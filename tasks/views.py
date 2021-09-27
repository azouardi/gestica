from ordres.views import LettreMissionObjectMixin
from django.db import models
from accounts.models import Portefolio, Validator
from config.mysqlconn import create_connection, create_connection_db_check, execute_read_query
import datetime
from django.views.generic.base import View
from django.views.generic.edit import ModelFormMixin
from tasks.forms import ClaimForm, ExerciceForm, PeriodForm, SituationCollForm, SituationForm, WorkCollForm, WorkForm, TaxReturnForm, TaxReturnCollForm
from tasks.models import Account, BenefitItem, BenefitLink, Exercice, Period, Situation, Task, Work, Claim, TaxReturn
from ordres.models import LettreMission
from django.views.generic import ListView, DetailView, CreateView, DeleteView
from django.shortcuts import render, redirect, get_object_or_404
from accounts.views import UserAccessMixin
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from datetime import timedelta, date
from dateutil.relativedelta import relativedelta
from calendar import monthrange
import calendar


def last_day_of_month(date_value):
    return date_value.replace(day = monthrange(date_value.year, date_value.month)[1])
 

class PeriodListView(LoginRequiredMixin, UserAccessMixin, ListView):
    raise_exception = True
    permission_required = 'tasks.change_period'
        
    model = Period
    context_object_name = 'periodList'
    template_name = 'tasks/period_list.html'   

class PeriodObjectMixin(object):
    model = Period
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj

class PeriodUpdateView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'tasks.change_period'
    
    model = Period
    context_object_name = 'periodUpdate'
    template_name = 'tasks/period_update.html'
    form_class = PeriodForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
       
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'period': obj, 'form': form,
                       }
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()

        if obj is not None:
            form = self.form_class(request.POST, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/periods/')
        context = {'period': obj, 'form': form,
                   }
        return render(request, self.template_name, context)

    
class PeriodDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'tasks.change_period'
    
    model = Period
    context_object_name = 'periodDetail'
    template_name = 'tasks/period_detail.html'
    form_class = PeriodForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        result = {}
        obj = self.get_object()
        works = obj.work_set.all().order_by('lettremission__company__name')
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'result':result,
                       'period': obj, 'form': form,
                       'works': works}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        works = obj.work_set.all()
        lettremissions=LettreMission.objects.filter(work__period=obj)
        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/periods/')
            context = {'lettremissions':lettremissions, 'period': obj, 'form': form,
                   'works': works}
        return render(request, self.template_name, context)
    
    def comments_count(self):
        #Your filter criteria can go here. 
        return self.comments_set.count()
    
    
class PeriodCreateView(LoginRequiredMixin, UserAccessMixin, CreateView):
    raise_exception = True
    permission_required = 'tasks.change_period'
     
    model = Period
    context_object_name = 'periodCreate'
    template_name = 'tasks/period_create.html'
    fields = '__all__'


class PeriodDeleteView(LoginRequiredMixin, UserAccessMixin, DeleteView):
    raise_exception = True
    permission_required = 'tasks.change_period'
    
    model = Period
    context_object_name = 'periodDelete'
    template_name = 'tasks/period_delete.html'
    
    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            context = {'period': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            obj.delete()
            return redirect('/periods/')
        context = {'period': obj}
        return render(request, self.template_name, context)

class PeriodView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_period'
    context_object_name = 'periodList'
    template_name = 'tasks/period_list.html'
    
    def get(self, request):
        context = {}
        periods = Period.objects.all().order_by('period')
        context = {'periods': periods}
        return render(request, self.template_name , context)

def benefitcheck(b,  t, lm, p, pdate, tadd, nadd, request, pk=None,*args, **kwargs):
    if BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).exists():
        print(BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id))
        if Work.objects.filter(task_id=t).filter(lettremission_id=lm.id).filter(period_id=p.id).exists():
            pass
        else:
            if request.method == 'POST':
                if tadd == 1 :
                    Work.objects.create(period_id= pk, date_limit=pdate+relativedelta(days=nadd),  lettremission_id=lm.id, task_id=t, value='0')
                elif tadd == 2 :
                    Work.objects.create(period_id= pk, date_limit=pdate+relativedelta(months=nadd),  lettremission_id=lm.id, task_id=t, value='0')
                else :
                    Work.objects.create(period_id= pk, date_limit=pdate+relativedelta(years=nadd),  lettremission_id=lm.id, task_id=t, value='0')

def specefic_check(t, lm, p, pdate, tadd, nadd, request, pk=None,*args, **kwargs):
    if Work.objects.filter(task_id=t).filter(lettremission_id=lm.id).filter(period_id=p.id).exists():
        pass
    else:
        if request.method == 'POST':
            if tadd == 1 :
                Work.objects.create(period_id= pk, date_limit=pdate+relativedelta(days=nadd),  lettremission_id=lm.id, task_id=t, value='0')
            elif tadd == 2 :
                Work.objects.create(period_id= pk, date_limit=pdate+relativedelta(months=nadd),  lettremission_id=lm.id, task_id=t, value='0')
            else :
                Work.objects.create(period_id= pk, date_limit=pdate+relativedelta(years=nadd),  lettremission_id=lm.id, task_id=t, value='0')


def extradata_update(t, lm, p, d, s, request, pk=None,*args, **kwargs):
    work=Work.objects.filter(task_id=t).filter(lettremission_id=lm).filter(period_id=p.id)
    if work.exists():
        work.update(value=d, statut=s)


class UpdateWorkExtraDataView(LoginRequiredMixin, UserAccessMixin, PeriodObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_period'
    template_name = 'tasks/period_detail.html'
    form_class = WorkForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        ct={}
        tadd={}
        nadd={}
        obj = self.get_object()                   
        context = {'period': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        ct={}
        tadd={}
        nadd={}
        obj = self.get_object()
        p=obj
        month=p.echeance.month
        year=p.echeance.year
        pk = obj.pk
        # tasks=Work.objects.filter(task_id__in=[301, 311, 601, 602, 603, 604]).filter(period=p)
        lettremissions=LettreMission.objects.filter(work__period=p, work__task_id__in=[301, 311, 601, 602, 603, 604])
        nbre=lettremissions.count()
        # lettremissions=LettreMission.objects.filter(company__statut=1).filter(company__create_date__lte=p.echeance)
  

        # Employeur            
        for lm in lettremissions:
            db_name=lm.db_office+"vs"
            db_ip=lm.office.ip
            db_port=lm.office.port
            db_pass=lm.office.password
            works=Work.objects.filter(lettremission_id=lm, period=p, task_id__in=[301, 311, 601, 602, 603, 604])
            # print('works', works)
            connection = create_connection(db_ip, db_port, db_pass, db_name)
            for w in works:
                ct=w.task_id
                # IR
                if ct=='301':
                    select_datas = "SELECT sum(Retenue_result) as Value FROM abnlbulletin WHERE CodeRubrique_result = 490 and annee_bul = " + str(year) +" and mois_bul = " + str(month) + "  group by annee_bul and mois_bul;"
                    datas = execute_read_query(connection, select_datas)

                    if datas :
                        extradata_update(t=ct, lm=lm, p=p, d=(datas[0])[0], s=0, request=request, pk=pk)
                    else:
                        extradata_update(t=ct, lm=lm, p=p, d=0, s=4, request=request, pk=pk)               
                #CSS
                if ct=='311':
                    select_datas = "SELECT sum(Retenue_result) as Value FROM abnlbulletin WHERE CodeRubrique_result = 669 and annee_bul = " + str(year) +" and mois_bul = " + str(month) + "  group by annee_bul and mois_bul;"
                    datas = execute_read_query(connection, select_datas)

                    if datas :
                        extradata_update(t=ct, lm=lm, p=p, d=(datas[0])[0], s=0, request=request, pk=pk)
                    else:
                        extradata_update(t=ct, lm=lm, p=p, d=0, s=4, request=request, pk=pk)  

                #CNSS
                if ct=='601':
                    select_datas = "SELECT sum(Retenue_result) as Value FROM abnlbulletin WHERE (CodeRubrique_result BETWEEN 459 AND 465) and annee_bul = " + str(year) +" and mois_bul = " + str(month) + "  group by annee_bul and mois_bul;"
                    datas = execute_read_query(connection, select_datas)

                    if datas :
                        extradata_update(t=ct, lm=lm, p=p, d=(datas[0])[0], s=0, request=request, pk=pk)
                    else:
                        extradata_update(t=ct, lm=lm, p=p, d=0, s=4, request=request, pk=pk)  
                
                if month in [3,6,9,12]:
                    #Retraite
                    if ct=='604':
                        select_datas = "SELECT sum(Retenue_result) as Retenues_Retraite FROM abnlbulletin bl INNER JOIN abnretraite rt ON bl.CodeRubrique_result = rt.code_rubps OR bl.CodeRubrique_result = rt.code_rubpp WHERE bl.annee_bul =" + str(year) + " and (bl.mois_bul  BETWEEN " +str(month - 2) + " and " + str(month)+ ")  and rt.estCIMR=0 group by bl.annee_bul and bl.mois_bul;"
                        datas = execute_read_query(connection, select_datas)

                        if datas :
                            extradata_update(t=ct, lm=lm, p=p, d=(datas[0])[0], s=0, request=request, pk=pk)
                        else:
                            extradata_update(t=ct, lm=lm, p=p, d=0, s=4, request=request, pk=pk)  

                    #Mutuelle
                    if ct=='602':
                        select_datas = "SELECT sum(Retenue_result) as Retenues_Mutuelle FROM abnlbulletin bl INNER JOIN abnassmaladie rt ON bl.CodeRubrique_result = rt.code_rubps OR bl.CodeRubrique_result = rt.code_rubpp WHERE bl.annee_bul =" + str(year) + " and (bl.mois_bul  BETWEEN " +str(month - 2) + " and " + str(month)+ ") group by bl.annee_bul and bl.mois_bul;"
                        datas = execute_read_query(connection, select_datas)

                        if datas :
                            extradata_update(t=ct, lm=lm, p=p, d=(datas[0])[0], s=0, request=request, pk=pk)
                        else:
                            extradata_update(t=ct, lm=lm, p=p, d=0, s=4, request=request, pk=pk)  

                    # #CIMR
                    if ct=='603':
                        select_datas = "SELECT sum(Retenue_result) as Retenues_CIMR FROM abnlbulletin bl INNER JOIN abnretraite rt ON bl.CodeRubrique_result = rt.code_rubps OR bl.CodeRubrique_result = rt.code_rubpp WHERE bl.annee_bul =" +str(year)+ " and (bl.mois_bul  BETWEEN " +str(month - 2) + " and " + str(month)+ ")  and rt.estCIMR=1 group by bl.annee_bul and bl.mois_bul;"
                        datas = execute_read_query(connection, select_datas)

                        if datas :
                            extradata_update(t=ct, lm=lm, p=p, d=(datas[0])[0], s=0, request=request, pk=pk)
                        else:
                            extradata_update(t=ct, lm=lm, p=p, d=0, s=4, request=request, pk=pk)  

        return redirect('/period/'+str(pk)+'/')



class InsertWorkView(LoginRequiredMixin, UserAccessMixin, PeriodObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_period'
    template_name = 'tasks/period_detail.html'
    form_class = WorkForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        ct={}
        tadd={}
        nadd={}
        obj = self.get_object()                   
        context = {'period': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        ct={}
        tadd={}
        nadd={}
        obj = self.get_object()
        p=obj
        pdate=p.echeance      
        month=p.echeance.month
        year=p.echeance.year
        pk = obj.pk
        
        #varification des LDM sans paie vs Paie calculée
        lettremissions_0=LettreMission.objects.filter(company__statut=1).filter(company__create_date__lte=p.echeance).exclude(company__legal_form_id__in=[12], moduleservice_id=11)
        b='002'
        for lm in lettremissions_0:             
            if BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance).exists():
                pass
            else:
                db_name=lm.db_office+"vs"
                db_ip=lm.office.ip
                db_port=lm.office.port
                db_pass=lm.office.password
                check_db = create_connection_db_check(db_ip, db_port, db_pass, db_name)
                if check_db == True:
                    connection = create_connection(db_ip, db_port, db_pass, db_name)
                    select_datas = "SELECT COUNT(mois_bul)  As Nbre_Bulletins, annee_bul, mois_bul FROM abnbulletin WHERE annee_bul = " + str(year) +" and mois_bul = " + str(month) + "  group by annee_bul and mois_bul;"
                    datas = execute_read_query(connection, select_datas)
                    if datas:
                        if BenefitLink.objects.filter(lettremission_id=lm.id).exists():
                            BenefitItem.objects.create(active=True, date_start=pdate,  benefitlink_id=lm.benefitlink.id, code_benefit_id='002')
                        else:
                            BenefitLink.objects.create(lettremission_id=lm.id)
                            BenefitItem.objects.create(active=True, date_start=pdate,  benefitlink_id=lm.benefitlink.id, code_benefit_id='002')
        
        tasks=Task.objects.all()
        
        lettremissions=LettreMission.objects.filter(company__statut=1).filter(company__create_date__lte=p.echeance).exclude(company__legal_form_id__in=[12]).exclude(moduleservice_id=11)
        lettremissions_paie=LettreMission.objects.filter(company__statut=1).filter(moduleservice_id=11).filter(company__create_date__lte=p.echeance).exclude(company__legal_form_id__in=[12])
        lettremissions_part=LettreMission.objects.filter(company__statut=1).filter(company__create_date__lte=p.echeance).filter(company__legal_form_id__in=[12])
        if month == 12:
            lettremissions_pm=lettremissions.filter(company__legal_form_id__in=[4,5,6,7,8,9,10], company__fiscal_year=1).filter(company__create_date__lte=p.echeance)
            lettremissions_pp=lettremissions.filter(company__legal_form_id__in=[3,11], company__statut=1).filter(company__create_date__lte=p.echeance)
            tasks_an_pp=Task.objects.filter(persontype=2).filter(specific=True).filter(frequency=5).filter(year_civil=True).filter(repeted=True).filter(code_benefit=None)
            tasks_an_c_com=Task.objects.filter(frequency=5).filter(year_civil=True).filter(repeted=True).filter(specific=False).filter(persontype=5).filter(code_benefit=None)

        else:            
            lettremissions_pm=lettremissions.filter(company__legal_form_id__in=[4,5,6,7,8,9,10], company__fiscal_year=month+1).filter(company__create_date__lte=p.echeance)

        tasks_an_pm=Task.objects.filter(persontype=1).filter(specific=True).filter(frequency=5).filter(repeted=True).filter(code_benefit=None)
        tasks_tva=Task.objects.filter(frequency__in=[2,3]).filter(year_civil=True).filter(repeted=True).filter(code_benefit='001')
        tasks_empl=Task.objects.filter(frequency__in=[2,3]).filter(year_civil=True).filter(repeted=True).filter(code_benefit='002')
        tasks_remb_tva=Task.objects.filter(frequency=3).filter(year_civil=True).filter(repeted=True).filter(code_benefit='003')
        tasks_an_part=Task.objects.filter(persontype=4).filter(specific=True).filter(frequency=5).filter(repeted=True).filter(code_benefit=None)
        tasks_report=Task.objects.filter(repeted=True).filter(code_benefit='008')
        tasks_revision=Task.objects.filter(repeted=True).filter(code_benefit='009')
        tasks_audit=Task.objects.filter(repeted=True).filter(code_benefit='010')
   
        #PM déclarations annuelles Jaune
        for t in tasks_an_pm:
            ct=t.code_task
            tadd=t.to_add               
            nadd=t.numbre_add
            for lm in lettremissions_pm:      
                specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
    
        #PP déclarations annuelles month = 12 Bleu
        if month in [12]:
            # déclaration pp       Bleu
            for t in tasks_an_pp:
                ct=t.code_task
                tadd=t.to_add               
                nadd=t.numbre_add
                for lm in lettremissions_pp:      
                    specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
                    
            for t in tasks_an_part:
                ct=t.code_task
                tadd=t.to_add               
                nadd=t.numbre_add
                for lm in lettremissions_part:      
                    specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
                                    
            # déclaration commune       vert
            for t in tasks_an_c_com:
                ct=t.code_task
                tadd=t.to_add               
                nadd=t.numbre_add
                for lm in lettremissions:      
                    specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
            
        # déclaration TVA            
        for t in tasks_tva:
            b='001'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            # print(ct, tadd, nadd)
            for lm in lettremissions:   
                if BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance) .exists():
                    if t.specific is True:
                        specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
                elif t.specific is False:
                    if month in [3,6,9,12]:
                        specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)

        # Employeur Mission COMPTA + PAIE           
        for t in tasks_empl:
            b='002'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            # print(ct, tadd, nadd)
            for lm in lettremissions:  
                if BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance).exists():
                    if t.frequency == 2:
                        specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
                    elif t.frequency == 3:
                        if month in [3,6,9,12]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)                          
                            
        # Employeur Mission PAIE           
        for t in tasks_empl:
            b='002'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            # print(ct, tadd, nadd)
            for lm in lettremissions_paie:   
                if BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance).exists():
                    if t.frequency == 2:
                        specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
                    elif t.frequency == 3:
                        if month in [3,6,9,12]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
                                            
        # Remb TVA            
        for t in tasks_remb_tva:
            b='003'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            # print(ct, tadd, nadd)
            for lm in lettremissions:   
                if BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance).exists():
                    if t.frequency == 3:
                        if month in [3,6,9,12]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
        
        # Reporting            
        for t in tasks_report:
            b='008'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            # print(ct, tadd, nadd)
            for lm in lettremissions:
                benefit = BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance)
                if benefit.exists():                  
                    specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)
                else:                       
                    specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
                    
        # Révision           
        for t in tasks_revision:
            b='009'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            # print(ct, tadd, nadd)
            for lm in lettremissions:
                benefit = BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance)
                if benefit.exists():
                    frq=lm.company.fiscal_year
                    if (benefit[0]).frequency == 2:
                        specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)

                    elif (benefit[0]).frequency == 3:
                        if  month in [frq+2, frq+5, frq+8, frq+11]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)

                    elif (benefit[0]).frequency == 4:
                        if  month in [frq+5, frq+11]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)
                    
                    elif (benefit[0]).frequency == 5:
                        if  month in [frq+11]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)
                            
        # CAC
        for t in tasks_audit:
            b='010'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            for lm in lettremissions:      
                benefit = BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance)
                if benefit.exists():
                    specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
                       
            # if month in [12]:
            #     for lm in lettremissions: 
            #         benefit = BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance)
            #         if benefit.exists():
            #             specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)        
        
        return redirect('/period/'+str(pk)+'/')
        # context = {'period': obj, 'tasks':tasks}
        # return render(request, self.template_name, context)
    

class CreateWorkView(LoginRequiredMixin, UserAccessMixin, PeriodObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_period'
    form_class = WorkForm
    template_name = 'tasks/work.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'period': obj, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        pk = obj.pk
        if request.method != 'POST':
            # No data submitted; create a blank form.
            form = self.form_class()
        else:
            form = self.form_class(request.POST, request.FILES)
            #form = self.form_class(request.POST)
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.period = obj
                new_item.save()
                return redirect('/period/'+str(pk)+'/')

        context = {'period': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateWorkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_period'
    form_class = WorkForm
    template_name = 'tasks/work_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        if work is not None:
            form = self.form_class(instance=work)
            context = {'period': period,'work': work, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        if work is not None:
            form = self.form_class(request.POST, request.FILES, instance=work)
            #form = self.form_class(request.POST, instance=work)
            if form.is_valid():
                form.save()
                return redirect('/period/'+str(period)+'/')
                
        context = {'period': period, 'work': work, 'form': form}
        return render(request, self.template_name, context)


class DeleteWorkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_period'
    template_name = 'tasks/work_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        if work is not None:
            context = {'work': work, 'period': period}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        if work is not None:
            work.delete()
            return redirect('/period/'+str(period)+'/')
            
        context = {'work': work, 'period': period}
        return render(request, self.template_name, context) 


class UpdateWorkViewColl(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_work'
    form_class = WorkCollForm
    template_name = 'tasks/work_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        user = request.user.profile
        if work is not None:
            form = self.form_class(instance=work)
            class Statut_R(models.IntegerChoices):
                InProcess = (0,'En Cours')
                Done = (1,'Traitée')
                InChecked = (3,'Non-validée')
                NonApplicable = (4,'Non Applicable')
            class Statut_V(models.IntegerChoices):
                Done = (1,'Traitée')
                Checked = (2,'Validée')
                InChecked = (3,'Non-validée')
            is_resp = Portefolio.objects.filter(user=user, lettremission_id=work.lettremission_id).exists()
            is_val = Validator.objects.filter(user=user, lettremission_id=work.lettremission_id).exists()

            if work.statut == 2 or (is_resp == True and is_val == True):
                pass
            elif is_resp==True :
                form.fields['statut'].choices =Statut_R.choices
            elif is_val==True :
                form.fields['statut'].choices =Statut_V.choices
                
        context = {'period': period,'work': work, 'form': form, 'is_val':is_val}
            
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        user = request.user.profile
        if work is not None:
            form = self.form_class(request.POST, request.FILES, instance=work)
            #form = self.form_class(request.POST, instance=work)
            if form.is_valid():
                form.save()
                
                is_val = Validator.objects.filter(user=user, lettremission_id=work.lettremission_id).exists()
                if is_val == True :
                    return redirect('/user_portefolio/')
                else:
                    return redirect('/company_tdb/'+str(work.lettremission.company.id)+'/')

                                
        context = {'period': period, 'work': work, 'form': form}
        return render(request, self.template_name, context)

class UpdateWorkViewSup(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_work'
    form_class = WorkForm
    template_name = 'tasks/work_update_sup.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        if work is not None:
            form = self.form_class(instance=work)
            context = {'period': period,'work': work, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        if work is not None:
            form = self.form_class(request.POST, request.FILES, instance=work)
            #form = self.form_class(request.POST, instance=work)
            if form.is_valid():
                form.save()
                return redirect('/company_tdb/'+str(work.lettremission.company.id)+'/')
                
        context = {'period': period, 'work': work, 'form': form}
        return render(request, self.template_name, context)
    
class CreateClaimView(LoginRequiredMixin, UserAccessMixin, LettreMissionObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_claim'
    form_class = ClaimForm
    template_name = 'tasks/claim.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'lettremission': obj, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        pk = obj.pk
        if request.method != 'POST':
            # No data submitted; create a blank form.
            form = self.form_class()
        else:
            form = self.form_class(request.POST)
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.lettremission = obj
                new_item.save()
                return redirect('/company_tdb/'+str(obj.company.id)+'/')

        context = {'lettremission': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateClaimView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_claim'
    form_class = ClaimForm
    template_name = 'tasks/claim_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        claim = Claim.objects.get(pk=pk)
        lettremission = claim.lettremission.id
        if claim is not None:
            form = self.form_class(instance=claim)
            context = {'lettremission': lettremission,'claim': claim, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        claim = Claim.objects.get(pk=pk)
        lettremission = claim.lettremission.id
        if claim is not None:
            form = self.form_class(request.POST, instance=claim)
            if form.is_valid():
                form.save()
                return redirect('/company_tdb/'+str(claim.lettremission.company.id)+'/')
                
        context = {'lettremission': lettremission, 'claim': claim, 'form': form}
        return render(request, self.template_name, context)


class DeleteClaimView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_claim'
    template_name = 'tasks/claim_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        claim = Claim.objects.get(pk=pk)
        lettremission = claim.lettremission.id
        if claim is not None:
            context = {'claim': claim, 'lettremission': lettremission}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        claim = Claim.objects.get(pk=pk)
        lettremission = claim.lettremission.id
        if claim is not None:
            claim.delete()
            return redirect('/company_tdb/'+str(claim.lettremission.company.id)+'/')
            
        context = {'claim': claim, 'lettremission': lettremission}
        return render(request, self.template_name, context)
    
    

# Exercice et situation comptable

class ExerciceListView(LoginRequiredMixin, UserAccessMixin, ListView):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
        
    model = Exercice
    context_object_name = 'exerciceList'
    template_name = 'tasks/exercice_list.html'   

class ExerciceObjectMixin(object):
    model = Exercice
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj

class ExerciceUpdateView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    
    model = Exercice
    context_object_name = 'exerciceUpdate'
    template_name = 'tasks/exercice_update.html'
    form_class = ExerciceForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
       
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'exercice': obj, 'form': form,
                       }
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()

        if obj is not None:
            form = self.form_class(request.POST, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/exercices/')
        context = {'exercice': obj, 'form': form,
                   }
        return render(request, self.template_name, context)

    
class ExerciceDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    
    model = Exercice
    context_object_name = 'exerciceDetail'
    template_name = 'tasks/exercice_detail.html'
    form_class = ExerciceForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        result = {}
        obj = self.get_object()
        situations = obj.situation_set.all().order_by('lettremission__company__name')
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'result':result,
                       'exercice': obj, 'form': form,
                       'situations': situations}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        situations = obj.situation_set.all()
        lettremissions=LettreMission.objects.filter(situation__exercice=obj)
        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/exercices/')
            context = {'lettremissions':lettremissions, 'exercice': obj, 'form': form,
                   'situations': situations}
        return render(request, self.template_name, context)
    
    def comments_count(self):
        #Your filter criteria can go here. 
        return self.comments_set.count()
    
    
class ExerciceCreateView(LoginRequiredMixin, UserAccessMixin, CreateView):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
     
    model = Exercice
    context_object_name = 'exerciceCreate'
    template_name = 'tasks/exercice_create.html'
    fields = '__all__'


class ExerciceDeleteView(LoginRequiredMixin, UserAccessMixin, DeleteView):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    
    model = Exercice
    context_object_name = 'exerciceDelete'
    template_name = 'tasks/exercice_delete.html'
    
    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            context = {'exercice': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            obj.delete()
            return redirect('/exercices/')
        context = {'exercice': obj}
        return render(request, self.template_name, context)

class ExerciceView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    context_object_name = 'exerciceList'
    template_name = 'tasks/exercice_list.html'
    
    def get(self, request):
        context = {}
        exercices = Exercice.objects.all().order_by('exercice')
        context = {'exercices': exercices}
        return render(request, self.template_name , context)
    

class CreateSituationView(LoginRequiredMixin, UserAccessMixin, ExerciceObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    form_class = SituationForm
    template_name = 'tasks/situation.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'exercice': obj, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        pk = obj.pk
        if request.method != 'POST':
            # No data submitted; create a blank form.
            form = self.form_class()
        else:
            form = self.form_class(request.POST, request.FILES)
            #form = self.form_class(request.POST)
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.exercice = obj
                new_item.save()
                return redirect('/exercice/'+str(pk)+'/')

        context = {'exercice': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateSituationView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    form_class = SituationForm
    template_name = 'tasks/situation_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        if situation is not None:
            form = self.form_class(instance=situation)
            context = {'exercice': exercice,'situation': situation, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        if situation is not None:
            form = self.form_class(request.POST, request.FILES, instance=situation)
            #form = self.form_class(request.POST, instance=situation)
            if form.is_valid():
                form.save()
                return redirect('/exercice/'+str(exercice)+'/')
                
        context = {'exercice': exercice, 'situation': situation, 'form': form}
        return render(request, self.template_name, context)


class DeleteSituationView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/situation_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        if situation is not None:
            context = {'situation': situation, 'exercice': exercice}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        if situation is not None:
            situation.delete()
            return redirect('/exercice/'+str(exercice)+'/')
            
        context = {'situation': situation, 'exercice': exercice}
        return render(request, self.template_name, context) 


class UpdateSituationViewColl(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    form_class = SituationCollForm
    template_name = 'tasks/situation_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        user = request.user.profile
        if situation is not None:
            form = self.form_class(instance=situation)
            class Statut_R(models.IntegerChoices):
                InProcess = (0,'En Cours')
                Done = (1,'Traitée')
                InChecked = (3,'Non-validée')
                NonApplicable = (4,'Non Applicable')
            class Statut_V(models.IntegerChoices):
                Done = (1,'Traitée')
                Checked = (2,'Validée')
                InChecked = (3,'Non-validée')
            is_resp = Portefolio.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()
            is_val = Validator.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()

            if situation.statut == 2 or (is_resp == True and is_val == True):
                pass
            elif is_resp==True :
                form.fields['statut'].choices =Statut_R.choices
            elif is_val==True :
                form.fields['statut'].choices =Statut_V.choices
                
        context = {'exercice': exercice,'situation': situation, 'form': form, 'is_val':is_val}
            
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        user = request.user.profile
        if situation is not None:
            form = self.form_class(request.POST, request.FILES, instance=situation)
            #form = self.form_class(request.POST, instance=situation)
            if form.is_valid():
                form.save()
                
                is_val = Validator.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()
                if is_val == True :
                    return redirect('/user_portefolio/')
                else:
                    return redirect('/company_tdb/'+str(situation.lettremission.company.id)+'/')

                                
        context = {'exercice': exercice, 'situation': situation, 'form': form}
        return render(request, self.template_name, context)

class UpdateSituationViewSup(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    form_class = SituationForm
    template_name = 'tasks/situation_update_sup.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        if situation is not None:
            form = self.form_class(instance=situation)
            context = {'exercice': exercice,'situation': situation, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        if situation is not None:
            form = self.form_class(request.POST, request.FILES, instance=situation)
            #form = self.form_class(request.POST, instance=situation)
            if form.is_valid():
                form.save()
                return redirect('/company_tdb/'+str(situation.lettremission.company.id)+'/')
                
        context = {'exercice': exercice, 'situation': situation, 'form': form}
        return render(request, self.template_name, context)


class InsertSituationView(LoginRequiredMixin, UserAccessMixin, ExerciceObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/exercice_detail.html'
    form_class = SituationForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()                   
        context = {'exercice': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        year=obj.exercice
        pk = obj.pk
       
        lettremissions_compta=LettreMission.objects.filter(company__statut=1).exclude(company__legal_form_id__in=[12]).exclude(moduleservice_id=11) 

        for lm in lettremissions_compta: 
            date_o = last_day_of_month(datetime.date(year=int(year), month=int(lm.company.fiscal_year), day=1))
            month = lm.company.fiscal_year
            create_date = lm.company.create_date
            if  month == 1:
                month = 12
                date_c = last_day_of_month(datetime.date(year=int(year), month=month, day=1))
            else:
                month = month-1
                date_c = last_day_of_month(datetime.date(year=int(year)+1, month=month, day=1))
            
            if create_date < date_c:
                if date_o > create_date :
                    date_o =date_o
                else:
                    date_o =  create_date
                
                if  lm.company.legal_form_id == 3 :
                    add_date_decl = 4
                else :
                    add_date_decl = 3
                num_months = (date_c.year - date_o.year) * 12 + (date_c.month - date_o.month)
                if Situation.objects.filter(exercice_id = pk).filter(lettremission_id=lm.id).filter(date_closing = date_c).exists():
                    pass
                else:
                    Situation.objects.create(date_start=date_o, date_closing = date_c , numbre_month= num_months, date_declaration = date_c+relativedelta(months=add_date_decl), exercice_id = pk, date_ago =date_c+relativedelta(months=6), lettremission_id=lm.id, statut=0, supervised=False)

        return redirect('/exercice/'+str(pk)+'/')
      

class UpdateSituationDataView(LoginRequiredMixin, UserAccessMixin, ExerciceObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/exercice_detail.html'
    # form_class = SituationForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()                   
        context = {'exercice': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        year=obj.exercice
        pk = obj.pk     

        situations=Situation.objects.filter(exercice=obj).exclude(supervised=True)
        # print('situations', situations)
        for s in situations:
            lm=s.lettremission
            db_name=lm.db_office+"vs"
            db_ip=lm.office.ip
            db_port=lm.office.port
            db_pass=lm.office.password
            accounts = Account.objects.all()
            connection = create_connection(db_ip, db_port, db_pass, db_name)
                
            for a in accounts:
                ex_diff = a.exercice
                year=int(year)-int(ex_diff)
                if a.sql == 0:
                    select_datas = "SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As Solde, Annee FROM abnecrits WHERE  Ncompte between '"+str(a.account_lower)+"%' and '"+str(a.account_upper)+"%' and Annee=" + str(year) +";"
                else:
                    select_datas = "SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As Solde, Annee FROM abnecrits WHERE  (Ncompte like '"+str(a.account_lower)+"%' or Ncompte like '"+str(a.account_upper)+"%') and Annee=" + str(year) +";"
                datas = execute_read_query(connection, select_datas)
                print(s, datas)
                if (datas[0])[0] == None:
                    solde=0
                else:
                    if a.sens == 0:
                        solde=(datas[0])[0]
                    else:
                        solde=-(datas[0])[0]
                data_acc = TaxReturn.objects.filter(situation_id=s.id).filter(code_account=a.code_account)
                if data_acc.exists():
                    data_acc.update(Amount=solde)
                else:
                    TaxReturn.objects.create(situation_id=s.id, code_account=a.code_account, Amount=solde, rubrique=a.name_account, deduc_reint=a.deduc_reint, nature=a.nature)    

        return redirect('/exercice/'+str(pk)+'/')




class SituationObjectMixin(object):
    model = Situation
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj

class CreateTaxReturnView(LoginRequiredMixin, UserAccessMixin, SituationObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    form_class = TaxReturnForm
    template_name = 'tasks/taxreturn.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'situation': obj, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        pk = obj.pk
        if request.method != 'POST':
            # No data submitted; create a blank form.
            form = self.form_class()
        else:
            form = self.form_class(request.POST, request.FILES)
            #form = self.form_class(request.POST)
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.situation = obj
                new_item.save()
                return redirect('/situation/'+str(pk)+'/')

        context = {'situation': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateTaxReturnView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    form_class = TaxReturnForm
    template_name = 'tasks/taxreturn_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation.id
        if taxreturn is not None:
            form = self.form_class(instance=taxreturn)
            context = {'situation': situation,'taxreturn': taxreturn, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation.id
        if taxreturn is not None:
            form = self.form_class(request.POST, request.FILES, instance=taxreturn)
            #form = self.form_class(request.POST, instance=taxreturn)
            if form.is_valid():
                form.save()
                return redirect('/situation/'+str(situation)+'/')
                
        context = {'situation': situation, 'taxreturn': taxreturn, 'form': form}
        return render(request, self.template_name, context)


class DeleteTaxReturnView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/taxreturn_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation.id
        if taxreturn is not None:
            context = {'taxreturn': taxreturn, 'situation': situation}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation.id
        if taxreturn is not None:
            taxreturn.delete()
            return redirect('/situation/'+str(situation)+'/')
            
        context = {'taxreturn': taxreturn, 'situation': situation}
        return render(request, self.template_name, context) 


class UpdateTaxReturnViewColl(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_taxreturn'
    form_class = TaxReturnCollForm
    template_name = 'tasks/taxreturn_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation.id
        user = request.user.profile
        if taxreturn is not None:
            form = self.form_class(instance=taxreturn)
            class Statut_R(models.IntegerChoices):
                InProcess = (0,'En Cours')
                Done = (1,'Traitée')
                InChecked = (3,'Non-validée')
                NonApplicable = (4,'Non Applicable')
            class Statut_V(models.IntegerChoices):
                Done = (1,'Traitée')
                Checked = (2,'Validée')
                InChecked = (3,'Non-validée')
            is_resp = Portefolio.objects.filter(user=user, lettremission_id=taxreturn.lettremission_id).exists()
            is_val = Validator.objects.filter(user=user, lettremission_id=taxreturn.lettremission_id).exists()

            if taxreturn.statut == 2 or (is_resp == True and is_val == True):
                pass
            elif is_resp==True :
                form.fields['statut'].choices =Statut_R.choices
            elif is_val==True :
                form.fields['statut'].choices =Statut_V.choices
                
        context = {'situation': situation,'taxreturn': taxreturn, 'form': form, 'is_val':is_val}
            
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation.id
        user = request.user.profile
        if taxreturn is not None:
            form = self.form_class(request.POST, request.FILES, instance=taxreturn)
            #form = self.form_class(request.POST, instance=taxreturn)
            if form.is_valid():
                form.save()
                
                is_val = Validator.objects.filter(user=user, lettremission_id=taxreturn.lettremission_id).exists()
                if is_val == True :
                    return redirect('/user_portefolio/')
                else:
                    return redirect('/company_tdb/'+str(taxreturn.lettremission.company.id)+'/')

                                
        context = {'situation': situation, 'taxreturn': taxreturn, 'form': form}
        return render(request, self.template_name, context)

class UpdateTaxReturnViewSup(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_taxreturn'
    form_class = TaxReturnForm
    template_name = 'tasks/taxreturn_update_sup.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation.id
        if taxreturn is not None:
            form = self.form_class(instance=taxreturn)
            context = {'situation': situation,'taxreturn': taxreturn, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation.id
        if taxreturn is not None:
            form = self.form_class(request.POST, request.FILES, instance=taxreturn)
            #form = self.form_class(request.POST, instance=taxreturn)
            if form.is_valid():
                form.save()
                return redirect('/company_tdb/'+str(taxreturn.lettremission.company.id)+'/')
                
        context = {'situation': situation, 'taxreturn': taxreturn, 'form': form}
        return render(request, self.template_name, context)