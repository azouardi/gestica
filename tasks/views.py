from types import ModuleType
from django.contrib import messages

from django.urls.base import reverse, reverse_lazy
from audits.forms import ConclusionForm, SectionForm
from audits.models import AccountLead, Conclusion, Lead, Section, SectionModel
from ordres.views import LettreMissionObjectMixin
from django.db import models
from accounts.models import Manager, Portefolio, Validator
from config.mysqlconn import create_connection, create_connection_db_check, execute_read_query
import datetime
from django.views.generic.base import View
from django.views.generic.edit import ModelFormMixin
from tasks.forms import ClaimForm, DASCollForm, DASForm, ExerciceForm, LiasseFiscaleForm, PeriodForm, SituationCollForm, SituationForm, WorkCollForm, WorkForm, TaxReturnForm, TaxReturnCollForm, TaxReturnAmountForm
from tasks.models import DAS, Account, AccountBis, BaremeImpot, BenefitItem, BenefitLink, DASDetail, DASEXOModel, DASMatriculeCSS, DASMatriculeDetail, DASMatriculeExo, DASMatriculeFIPP, DASModel, Exercice, ImpotSociete, LiasseFiscale, Period, Situation, TableLiasseFiscale, Task, Work, Claim, TaxReturn, CotisationMinimal
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
from django.db.models import Sum
import math

def myround(x, base):
    if x is None:
        pass
    else:
        return base * math.ceil(x/base)

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
        context = {'period': obj, 'form': form}
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
        works = obj.work_set.all().order_by('lettremission__company__name','lettremission_id')
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
            work_inprocess = Work.objects.filter(period=obj, statut__in=[1,2,3,4])
            if work_inprocess.exists():
                messages.info(request, 'La période ne peut être supprimée en raison de travaux déjà en cours !')
                pass            
            context = {'period': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            work_inprocess = Work.objects.filter(period=obj, statut__in=[1,2,3,4])
            if work_inprocess.exists():
                pass
            else:
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
    if BenefitItem.objects.filter(code_benefit_id=b, active=True, benefitlink__lettremission__id=lm.id).exists():
        if Work.objects.filter(task_id=t).filter(lettremission_id=lm.id).filter(period_id=p.id).exists():
            pass
        else:
            task = Task.objects.filter(code_task=t)
            if  lm.terminate == True and lm.leave_date < pdate:
                pass
            elif task[0].provisoire == True and task[0].echeance < pdate:
                pass
            else:
                if request.method == 'POST':
                    if tadd == 1 :
                        Work.objects.create(period_id= pk, date_limit=last_day_of_month(pdate+relativedelta(days=nadd)),  lettremission_id=lm.id, task_id=t, value='0')
                    elif tadd == 2 :
                        Work.objects.create(period_id= pk, date_limit=last_day_of_month(pdate+relativedelta(months=nadd)),  lettremission_id=lm.id, task_id=t, value='0')
                    else :
                        Work.objects.create(period_id= pk, date_limit=last_day_of_month(pdate+relativedelta(years=nadd)),  lettremission_id=lm.id, task_id=t, value='0')

def specefic_check(t, lm, p, pdate, tadd, nadd, request, pk=None,*args, **kwargs):
    if Work.objects.filter(task_id=t).filter(lettremission_id=lm.id).filter(period_id=p.id).exists():
        pass
    else:
        task = Task.objects.filter(code_task=t)
        if  lm.terminate == True and lm.leave_date < pdate:
            pass
        elif task[0].provisoire == True and task[0].echeance < pdate:
            pass       
        else:
            if request.method == 'POST':
                if tadd == 1 :
                    Work.objects.create(period_id= pk, date_limit=last_day_of_month(pdate+relativedelta(days=nadd)),  lettremission_id=lm.id, task_id=t, value='0')
                elif tadd == 2 :
                    Work.objects.create(period_id= pk, date_limit=last_day_of_month(pdate+relativedelta(months=nadd)),  lettremission_id=lm.id, task_id=t, value='0')
                else :
                    Work.objects.create(period_id= pk, date_limit=last_day_of_month(pdate+relativedelta(years=nadd)),  lettremission_id=lm.id, task_id=t, value='0')


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
        user = request.user.profile

        #varification des LDM sans paie vs Paie calculée
        lettremissions_all=LettreMission.objects.filter(entry_date__lte=p.echeance).filter(company__create_date__lte=p.echeance).filter(company__statut=1).filter(manager__user=user)
        lettremissions_0=lettremissions_all.exclude(company__legal_form_id__in=[12], moduleservice_id=11)
        b='002'
        for lm in lettremissions_0:             
            if BenefitItem.objects.filter(code_benefit_id=b, active=True, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance).exists():
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
        
        # tasks=Task.objects.all()
        
        lettremissions=lettremissions_0
        lettremissions_compta=lettremissions_0.filter(moduleservice_id=2)
        lettremissions_paie=lettremissions_all.exclude(company__legal_form_id__in=[12]).filter(moduleservice_id=11)
        lettremissions_part=lettremissions_all.filter(company__legal_form_id__in=[12])
        lettremission_audit=lettremissions_all.exclude(company__legal_form_id__in=[12]).filter(moduleservice_id=1)
        if month == 12:
            lettremissions_pm=lettremissions.filter(company__legal_form_id__in=[4,5,6,7,8,9,10], company__fiscal_year=1)
            lettremissions_pp=lettremissions.filter(company__legal_form_id__in=[3,11])
            tasks_an_pp=Task.objects.filter(persontype=2).filter(specific=True).filter(frequency=5).filter(year_civil=True).filter(repeted=True).filter(code_benefit=None)
            tasks_an_c_com=Task.objects.filter(frequency=5).filter(year_civil=True).filter(repeted=True).filter(specific=False).filter(persontype=5).filter(code_benefit=None)

        else:            
            lettremissions_pm=lettremissions.filter(company__legal_form_id__in=[4,5,6,7,8,9,10], company__fiscal_year=month+1)

        tasks_an_pm=Task.objects.filter(persontype=1).filter(specific=True).filter(frequency=5).filter(repeted=True).filter(code_benefit=None)
        tasks_tva=Task.objects.filter(frequency__in=[2,3]).filter(year_civil=True).filter(repeted=True).filter(code_benefit='001')
        tasks_empl=Task.objects.filter(frequency__in=[2,3]).filter(year_civil=True).filter(repeted=True).filter(code_benefit='002')
        tasks_remb_tva=Task.objects.filter(frequency=3).filter(year_civil=True).filter(repeted=True).filter(code_benefit='003')
        tasks_an_part=Task.objects.filter(persontype=4).filter(specific=True).filter(frequency=5).filter(repeted=True).filter(code_benefit=None)
        tasks_report=Task.objects.filter(repeted=True).filter(code_benefit='008')
        tasks_revision=Task.objects.filter(repeted=True).filter(code_benefit='009')
        tasks_audit=Task.objects.filter(repeted=True).filter(code_benefit='010')
   
        # #PM déclarations annuelles Jaune
        # for t in tasks_an_pm:
        #     ct=t.code_task
        #     tadd=t.to_add               
        #     nadd=t.numbre_add
        #     for lm in lettremissions_pm:      
        #         specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
    
        # #PP déclarations annuelles month = 12 Bleu
        # if month in [12]:
        #     # déclaration pp       Bleu
        #     for t in tasks_an_pp:
        #         ct=t.code_task
        #         tadd=t.to_add               
        #         nadd=t.numbre_add
        #         for lm in lettremissions_pp:      
        #             specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
                    
        #     for t in tasks_an_part:
        #         ct=t.code_task
        #         tadd=t.to_add               
        #         nadd=t.numbre_add
        #         for lm in lettremissions_part:      
        #             specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
                                    
        #     # déclaration commune       vert
        #     for t in tasks_an_c_com:
        #         ct=t.code_task
        #         tadd=t.to_add               
        #         nadd=t.numbre_add
        #         for lm in lettremissions:      
        #             specefic_check(t=ct, lm=lm, p=p, pdate=pdate,tadd=tadd, nadd=nadd, request=request, pk=pk)
            
        # # déclaration TVA            
        # for t in tasks_tva:
        #     b='001'
        #     ct=t.code_task
        #     tadd=t.to_add
        #     nadd=t.numbre_add
        #     for lm in lettremissions:   
        #         if BenefitItem.objects.filter(code_benefit_id=b, active=True, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance) .exists():
        #             if t.specific is True:
        #                 specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
        #         elif t.specific is False:
        #             if month in [3,6,9,12]:
        #                 specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)

        # # Employeur Mission COMPTA + PAIE           
        # for t in tasks_empl:
        #     b='002'
        #     ct=t.code_task
        #     tadd=t.to_add
        #     nadd=t.numbre_add
        #     for lm in lettremissions:  
        #         if BenefitItem.objects.filter(code_benefit_id=b, active=True, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance).exists():
        #             if t.frequency == 2:
        #                 specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
        #             elif t.frequency == 3:
        #                 if month in [3,6,9,12]:
        #                     specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)                          
                            
        # # Employeur Mission PAIE           
        # for t in tasks_empl:
        #     b='002'
        #     ct=t.code_task
        #     tadd=t.to_add
        #     nadd=t.numbre_add
        #     for lm in lettremissions_paie:   
        #         if BenefitItem.objects.filter(code_benefit_id=b, active=True, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance).exists():
        #             if t.frequency == 2:
        #                 specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
        #             elif t.frequency == 3:
        #                 if month in [3,6,9,12]:
        #                     specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
                                            
        # # Remb TVA            
        # for t in tasks_remb_tva:
        #     b='003'
        #     ct=t.code_task
        #     tadd=t.to_add
        #     nadd=t.numbre_add
        #     for lm in lettremissions:   
        #         if BenefitItem.objects.filter(code_benefit_id=b, active=True, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance).exists():
        #             if t.frequency == 3:
        #                 if month in [3,6,9,12]:
        #                     specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
        
        # # Reporting            
        # for t in tasks_report:
        #     b='008'
        #     ct=t.code_task
        #     tadd=t.to_add
        #     nadd=t.numbre_add
        #     for lm in lettremissions_compta:
        #         benefit = BenefitItem.objects.filter(code_benefit_id=b, active=True, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance)
        #         if benefit.exists():                  
        #             specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)
        #         # else:                       
        #         #     specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=nadd, request=request, pk=pk)
                    
        # Révision           
        for t in tasks_revision:
            b='009'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            for lm in lettremissions:
                benefit = BenefitItem.objects.filter(code_benefit_id=b, active=True, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance)
                if benefit.exists():
                    frq=lm.company.fiscal_year
                    if frq == 1:
                        toadd = 11
                    else:
                        toadd = -1
                        
                    if (benefit[0]).frequency == 2:
                        specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)

                    elif (benefit[0]).frequency == 3:
                        if  month in [frq+2, frq+5, frq+8, frq+toadd]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)

                    elif (benefit[0]).frequency == 4:
                        if  month in [frq+5, frq+toadd]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)
                    
                    elif (benefit[0]).frequency == 5:
                        if  month in [frq+toadd]:
                            specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)
                            
        # CAC
        for t in tasks_audit:
            b='010'
            ct=t.code_task
            tadd=t.to_add
            nadd=t.numbre_add
            for lm in lettremission_audit:      
                benefit = BenefitItem.objects.filter(code_benefit_id=b, benefitlink__lettremission__id=lm.id).filter(date_start__lte=p.echeance)
                if benefit.exists():
                    frq=lm.company.fiscal_year
                    if frq == 1:
                        toadd = 11
                    else:
                        toadd = -1
                    if  month in [frq+toadd]:
                        specefic_check(t=ct, lm=lm, p=p, pdate=pdate, tadd=tadd, nadd=(benefit[0]).numbre_add, request=request, pk=pk)
                       
     
        
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
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=work.lettremission_id).exists()
        if work is not None:
            form = self.form_class(request.POST, request.FILES, instance=work)
            if form.is_valid():
                form.save()
                # if is_manager == True:
                #     return redirect('/period/'+str(period)+'/')
                return redirect('/period/'+str(period)+'/')
                
        context = {'is_manager':is_manager, 'period': period, 'work': work, 'form': form}
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
            is_manager = Manager.objects.filter(user=user, lettremission_id=work.lettremission_id).exists()

            if work.statut == 2 or is_manager == True or (is_resp == True and is_val == True):
                pass
            elif is_resp==True :
                form.fields['statut'].choices =Statut_R.choices
            elif is_val==True :
                form.fields['statut'].choices =Statut_V.choices
                
        context = {'is_manager':is_manager,'period': period,'work': work, 'form': form, 'is_val':is_val}
            
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        work = Work.objects.get(pk=pk)
        period = work.period.id
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=work.lettremission_id).exists()
        is_val = Validator.objects.filter(user=user, lettremission_id=work.lettremission_id).exists()
        if work is not None:
            form = self.form_class(request.POST, request.FILES, instance=work)
            if form.is_valid():
                form.save()
                if is_manager == True:
                    return redirect('/company_tdb/'+str(work.lettremission.company.id)+'/')
                elif is_val == True:
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
        user = request.user.profile
        lettremission = claim.lettremission.id
        is_manager = Manager.objects.filter(user=user, lettremission_id=claim.lettremission_id).exists()
        if claim is not None:
            form = self.form_class(instance=claim)
            if is_manager == False:
                form.fields['supervised'].disabled = True
            context = {'lettremission': lettremission,'claim': claim, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        claim = Claim.objects.get(pk=pk)
        user = request.user.profile
        lettremission = claim.lettremission.id
        is_manager = Manager.objects.filter(user=user, lettremission_id=claim.lettremission_id).exists()
        if claim is not None:
            form = self.form_class(request.POST, request.FILES, instance=claim)
            if form.is_valid():
                form.save()
                if is_manager == True :
                    return redirect('/user_portefolio_manager/')
                else :
                    return redirect('/company_tdb/'+str(claim.lettremission.company.id)+'/')                

                
        context = {'is_manager':is_manager,'lettremission': lettremission, 'claim': claim, 'form': form}
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
            context = {'exercice': obj, 'form': form}
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

class ExerciceDetailManagerView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    
    model = Exercice
    context_object_name = 'exerciceDetailManager'
    template_name = 'tasks/exercice_detail_manager.html'
    form_class = ExerciceForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        result = {}
        obj = self.get_object()
        user = request.user.profile
        situations = Situation.objects.filter(lettremission__manager__user=user, exercice=obj).order_by('lettremission__company__name')
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'result':result,
                       'exercice': obj, 'form': form,
                       'situations': situations}
        return render(request, self.template_name, context)
    
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
    
class ExerciceDASView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    context_object_name = 'exerciceListDAS'
    template_name = 'tasks/exercice_list_das.html'
    
    def get(self, request):
        context = {}
        exercices = Exercice.objects.all().order_by('exercice')
        context = {'exercices': exercices}
        return render(request, self.template_name , context)

class ExerciceSituationView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    context_object_name = 'exerciceListSituation'
    template_name = 'tasks/exercice_list_situation.html'
    
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
                lettremission = request.POST.get('lettremission')
                situation = Situation.objects.filter(exercice=obj, lettremission=lettremission)
                if situation.exists():
                    messages.info(request, 'La situation '+ str(situation[0]) +' existe déja !')
                else:
                    new_item = form.save(commit=False)
                    new_item.exercice = obj
                    new_item.save()
                    return redirect('/exercice_manager/'+str(pk)+'/')

        context = {'exercice': obj, 'form': form}
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
    template_name = 'tasks/situation_update_coll.html'
    form_class = SituationCollForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        resultat= situation.taxreturn_set.filter(taxreturn=1, deduc_reint=0, nature=0,code_account='RES_NET').aggregate(sum=Sum('amount'))
        if resultat['sum'] is None:
            resultat['sum'] = 0
        taxreturns11 = situation.taxreturn_set.filter(taxreturn=1, deduc_reint=0, nature=0).exclude(code_account='RES_NET').order_by('ordre')
        sum11 = situation.taxreturn_set.filter(taxreturn=1, deduc_reint=0, nature=0).exclude(code_account='RES_NET').aggregate(sum=Sum('amount'))
        if sum11['sum'] is None:
            sum11['sum'] = 0
        taxreturns12 = situation.taxreturn_set.filter(taxreturn=1, deduc_reint=0, nature=1).order_by('ordre')
        sum12 = situation.taxreturn_set.filter(taxreturn=1, deduc_reint=0, nature=1).aggregate(sum=Sum('amount'))
        if sum12['sum'] is None:
            sum12['sum'] = 0
        taxreturns21 = situation.taxreturn_set.filter(taxreturn=1, deduc_reint=1, nature=0).order_by('ordre')
        sum21 = situation.taxreturn_set.filter(taxreturn=1, deduc_reint=1, nature=0).aggregate(sum=Sum('amount'))
        if sum21['sum'] is None:
            sum21['sum'] = 0
        taxreturns22 = situation.taxreturn_set.filter(taxreturn=1, deduc_reint=1, nature=1).order_by('ordre')
        sum22 = situation.taxreturn_set.filter(taxreturn=1, deduc_reint=1, nature=1).aggregate(sum=Sum('amount'))
        if sum22['sum'] is None:
            sum22['sum'] = 0
        rfbrut_sum = resultat['sum']+sum11['sum']+sum12['sum']-sum21['sum']-sum22['sum']       
        imputdeficit2 = situation.taxreturn_set.filter(taxreturn=2).order_by('ordre')
        imputdeficitsum = situation.taxreturn_set.filter(taxreturn=2).aggregate(sum=Sum('amount'))
        if imputdeficitsum['sum'] is None:
            imputdeficitsum['sum'] = 0
        rfnet_sum = rfbrut_sum-imputdeficitsum['sum']
        repordeficit3 = situation.taxreturn_set.filter(taxreturn=3).order_by('ordre')
        repordeficitsum = situation.taxreturn_set.filter(taxreturn=3).exclude(code_account='AMO_DIF').aggregate(sum=Sum('amount'))
        rescour_ha4 = situation.taxreturn_set.filter(taxreturn=4).order_by('ordre')
        rf5 = situation.taxreturn_set.filter(taxreturn=5)
        ventilrf6 = situation.taxreturn_set.filter(taxreturn=6)
        acompt7 = situation.taxreturn_set.filter(taxreturn=7).order_by('ordre')
        rel_exc8 = situation.taxreturn_set.filter(taxreturn=8).order_by('ordre')
        acomptesn19 = situation.taxreturn_set.filter(taxreturn=9).order_by('ordre')
        etat_deficit10 = situation.taxreturn_set.filter(taxreturn=10)
        etat_ventes11 = situation.taxreturn_set.filter(taxreturn=11)
        liasse12 = situation.taxreturn_set.filter(taxreturn=12)
        user = request.user.profile
        #Calcul impôt - CM
        cotisation_min = situation.cotisationminimal_set.all()
        cotisation_minsum = myround(situation.cotisationminimal_set.all().aggregate(sum=Sum('amount'))['sum'],1)

        impotsociete = situation.impotsociete_set.all()
        impotsociete_sum = situation.impotsociete_set.all().aggregate(sum=Sum('amount'))['sum']
        cfc=BenefitItem.objects.filter(code_benefit_id='012', active=True, benefitlink__lettremission__id=situation.lettremission.id).exists()
        cfc2020=BenefitItem.objects.filter(code_benefit_id='013', active=True, benefitlink__lettremission__id=situation.lettremission.id).exists()
        export=BenefitItem.objects.filter(code_benefit_id='003', active=True, benefitlink__lettremission__id=situation.lettremission.id).exists()
    

        if situation is not None:
            form = self.form_class(instance=situation)
            class Statut_R(models.IntegerChoices):
                InProcess = (0,'En Cours')
                Done = (1,'Traitée')
                InChecked = (3,'Non-validée')
                NonApplicable = (4,'Non Applicable')
            class Statut_V(models.IntegerChoices):
                InProcess = (0,'En Cours')
                Done = (1,'Traitée')
                Checked = (2,'Validée')
                InChecked = (3,'Non-validée')
                NonApplicable = (4,'Non Applicable')
            is_resp = Portefolio.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()
            is_manager = Manager.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()

            if situation.statut == 2 or (is_resp == True and is_manager == True) or request.user.is_staff == True:
                pass
            elif is_resp==True :
                form.fields['statut'].choices =Statut_R.choices
            elif is_manager==True :
                form.fields['statut'].choices =Statut_V.choices
                                        
        context = {'is_manager':is_manager,'exercice': exercice,'situation': situation,
                   'resultat' :resultat,
                   'rfnet_sum':rfnet_sum,                 
                   'taxreturns11':taxreturns11, 'sum11':sum11,
                   'taxreturns12':taxreturns12, 'sum12':sum12,
                   'taxreturns21':taxreturns21, 'sum21':sum21,
                   'taxreturns22':taxreturns22, 'sum22':sum22,
                   'rfbrut_sum':rfbrut_sum,
                   'imputdeficitsum':imputdeficitsum,
                   'imputdeficit2':imputdeficit2,
                   'repordeficit3':repordeficit3,
                   'repordeficitsum':repordeficitsum,
                   'rescour_ha4':rescour_ha4,
                   'rf5':rf5,
                   'ventilrf6':ventilrf6,
                   'acompt7':acompt7,
                   'rel_exc8':rel_exc8,
                   'acomptesn19':acomptesn19,
                   'etat_deficit10':etat_deficit10,
                   'etat_ventes11':etat_ventes11,
                   'liasse12': liasse12,
                   'cotisation_min':cotisation_min, 'cotisation_minsum':cotisation_minsum,
                   'impotsociete':impotsociete,  'impotsociete_sum':impotsociete_sum,
                   'cfc':cfc, 'cfc2020':cfc2020, 'export':export, 
                   'form': form}
            
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
                    return redirect('/user_portefolio_situation/')
                else:
                    return redirect('/ldm_situation/'+str(situation.lettremission.id)+'/')
                                
        context = {'exercice': exercice, 'situation': situation, 'form': form}
        return render(request, self.template_name, context)


class UpdateSituationView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/situation_update.html'
    form_class = SituationCollForm

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
                InProcess = (0,'En Cours')
                Done = (1,'Traitée')
                Checked = (2,'Validée')
                InChecked = (3,'Non-validée')
                NonApplicable = (4,'Non Applicable')

            is_resp = Portefolio.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()
            is_manager = Manager.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()

            if situation.statut == 2 or (is_resp == True and is_manager == True) or request.user.is_staff == True:
                pass
            elif is_resp==True :
                form.fields['statut'].choices =Statut_R.choices
            elif is_manager==True :
                form.fields['statut'].choices =Statut_V.choices
                        
        context = {'exercice': exercice,'situation': situation,
                   'form': form, 'is_manager':is_manager}
            
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user).exists()
        if situation is not None:
            form = self.form_class(request.POST, request.FILES, instance=situation)
            if form.is_valid():
                form.save()
                if is_manager==True:            
                    return redirect('/exercice_manager/'+str(situation.exercice.id)+'/')
                else:
                    return redirect('/ldm_situation/'+str(situation.lettremission.id)+'/')
                                
        context = {'exercice': exercice, 'situation': situation, 'form': form}
        return render(request, self.template_name, context)

class UpdateDataSituationView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/situation_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        if situation is not None:
            context = {'situation': situation}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice
        if situation is not None:
            datasituation(s=situation, obj=situation.exercice, *args, **kwargs)
            return redirect('/update_situation_coll/'+str(situation.pk)+'/')
                
        context = {'situation': situation}
        return render(request, self.template_name, context)
    
    #---------------SECTION---------------SECTION------------

class UpdateDataSectionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/situation_update_section.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        if situation is not None:
            context = {'situation': situation}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice
        if situation is not None:
            datasituation(s=situation, obj=situation.exercice, *args, **kwargs)
            return redirect('/update_situation_section/'+str(situation.pk)+'/')
                
        context = {'situation': situation}
        return render(request, self.template_name, context)
    
    
    
class UpdateSectionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    form_class = SituationForm
    template_name = 'tasks/situation_update_section.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user).exists()
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        sections = situation.section_set.all().order_by('section')
        sections_val = Section.objects.filter(situation=situation).filter(statut__in=[2,4])
        sections_enc = Section.objects.filter(situation=situation).exclude(statut__in=[2,4])
        if situation is not None:
            form = self.form_class(instance=situation)
            context = {'is_manager':is_manager,'exercice': exercice,'situation': situation, 'sections':sections,'sections_val':sections_val,'sections_enc':sections_enc,'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        sections = situation.section_set.all().select_related('section')
        user = request.user.profile
        if situation is not None:
            form = self.form_class(request.POST, request.FILES, instance=situation)
            #form = self.form_class(request.POST, instance=situation)
            if form.is_valid():
                form.save()               
                is_val = Validator.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()
                if is_val == True :
                    return redirect('/user_portefolio_situation/')
                else:
                    return redirect('/ldm_situation/'+str(situation.lettremission.id)+'/')
                
        context = {'exercice': exercice, 'situation': situation, 'sections':sections, 'form': form}
        return render(request, self.template_name, context)

class UpdateSectionLeadView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/section_update_lead.html'
    form_class = SectionForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        section = Section.objects.get(pk=pk)
        revues_an=Conclusion.objects.filter(section=section, type=0)
        risques=Conclusion.objects.filter(section=section, type=1)
        recoms=Conclusion.objects.filter(section=section, type=2)
        conclusions=Conclusion.objects.filter(section=section, type=3)
        situation = section.situation
        date_closing_n1=situation.date_closing+relativedelta(years=-1)
        date_closing_n1_end=situation.date_start+relativedelta(days=-1)

        lead = Lead.objects.filter(section=section).filter(code_account__level__in=[3,4,5]).order_by('ordre').select_related('code_account')
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()

        if section is not None:
            form = self.form_class(instance=section)
            if is_manager == False:
                # readonly_fields = ('supervised',)
                form.fields['supervised'].disabled = True
            context = {'situation':situation,'lead': lead,'section': section,'date_closing_n1':date_closing_n1 , 
                       'date_closing_n1_end':date_closing_n1_end,
                       'conclusions':conclusions,
                       'revues_an':revues_an,
                       'risques':risques,
                       'recoms':recoms,
                       'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        section = Section.objects.get(pk=pk)
        revues_an=Conclusion.objects.filter(section=section, type=0)
        risques=Conclusion.objects.filter(section=section, type=1)
        recoms=Conclusion.objects.filter(section=section, type=2)
        conclusions=Conclusion.objects.filter(section=section, type=3)
        situation = section.situation
        date_closing_n1=situation.date_closing+relativedelta(years=-1)
        date_closing_n1_end=situation.date_start+relativedelta(days=-1)
        lead = Lead.objects.filter(section=section).filter(code_account__level__in=[3,4,5]).order_by('ordre').select_related('code_account')
        if section is not None:
            form = self.form_class(request.POST, request.FILES, instance=section)
            if form.is_valid():
                form.save()
                return redirect('/update_situation_section/'+str(section.situation.id)+'/')
                
        context = {'situation':situation,'lead': lead,'section': section,'date_closing_n1':date_closing_n1, 
                    'date_closing_n1_end':date_closing_n1_end,
                    'conclusions':conclusions,
                    'revues_an':revues_an,
                    'risques':risques,
                    'recoms':recoms,
                    'form': form}
        return render(request, self.template_name, context)


    #--------------CONCLUSION--------------------------------------------------------
class SectionObjectMixin(object):
    model = Section
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj

class CreateConclusionView(LoginRequiredMixin, UserAccessMixin, SectionObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    form_class = ConclusionForm
    template_name = 'tasks/conclusion.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'section': obj, 'form': form}
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
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.section = obj
                new_item.auto_genre = False
                new_item.save()
                return redirect('/update_section_lead/'+str(pk)+'/')

        context = {'section': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateConclusionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    form_class = ConclusionForm
    template_name = 'tasks/conclusion_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        conclusion = Conclusion.objects.get(pk=pk)
        section = conclusion.section
        if conclusion is not None:
            form = self.form_class(instance=conclusion)
            context = {'section': section,'conclusion': conclusion, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        conclusion = Conclusion.objects.get(pk=pk)
        section = conclusion.section
        if conclusion is not None:
            form = self.form_class(request.POST, request.FILES, instance=conclusion)
            if form.is_valid():
                form.save()
                return redirect('/update_section_lead/'+str(section.id)+'/')
                
        context = {'section': section, 'conclusion': conclusion, 'form': form}
        return render(request, self.template_name, context)

class DeleteConclusionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/conclusion_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        conclusion = Conclusion.objects.get(pk=pk)
        section = conclusion.section
        if conclusion is not None:
            context = {'conclusion': conclusion, 'section': section}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        conclusion = Conclusion.objects.get(pk=pk)
        section = conclusion.section
        if conclusion is not None:
            conclusion.delete()
            return redirect('/update_section_lead/'+str(section.id)+'/')
            
        context = {'conclusion': conclusion, 'section': section}
        return render(request, self.template_name, context) 

    
    #----------------DATA SITUATION --------------------

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
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user).exists()
        year=obj.exercice
        pk = obj.pk
       
        lettremissions_compta=LettreMission.objects.filter(terminate=False).filter(company__create_date__year__lte=year).filter(entry_date__year__lte=year).filter(company__create_date__year__lte=year).filter(company__statut=1).filter(terminate=False).filter(manager__user=user).filter(moduleservice_id=2).exclude(company__legal_form_id__in=[12]) 

        for lm in lettremissions_compta:
            if obj.month < int(lm.company.fiscal_year):
                date_o = datetime.date(year=int(year)-1, month=int(lm.company.fiscal_year), day=1)
            else:
                date_o = datetime.date(year=int(year), month=int(lm.company.fiscal_year), day=1)
            month = lm.company.fiscal_year
            create_date = lm.company.create_date
            if  month == 1:
                if obj.intermediate == True:
                    month = obj.month
                else:
                    month = 12
                date_c = last_day_of_month(datetime.date(year=int(year), month=month, day=1))
            else:
                if obj.intermediate == True:
                    month = obj.month
                    date_c = last_day_of_month(datetime.date(year=int(year), month=month, day=1))
                else:
                    month = month-1
                    date_c = last_day_of_month(datetime.date(year=int(year)+1, month=month, day=1))
            
            if create_date < date_c:
                if date_o > create_date:
                    date_o =date_o
                else:
                    date_o =  create_date
                
                if  lm.company.legal_form_id == 3 :
                    add_date_decl = 4
                else :
                    add_date_decl = 3
                num_months = (date_c.year - date_o.year) * 12 + (date_c.month - date_o.month)+1
                
                situation_exit = Situation.objects.filter(exercice_id = pk).filter(lettremission_id=lm.id).filter(supervised=False).filter(date_closing = date_c)
                if situation_exit.exists():
                    situation_exit.update(date_start=date_o, numbre_month= num_months, date_declaration = last_day_of_month(date_c+relativedelta(months=add_date_decl)), date_ago =date_c+relativedelta(months=6))
                else:
                    Situation.objects.create(date_start=date_o, date_closing = date_c , numbre_month= num_months, date_declaration = last_day_of_month(date_c+relativedelta(months=add_date_decl)), exercice_id = pk, date_ago =date_c+relativedelta(months=6), lettremission_id=lm.id, statut=0, supervised=False)
            
            situation_exit = Situation.objects.filter(exercice_id = pk).filter(lettremission_id=lm.id).filter(supervised=False).filter(date_closing = date_c)           
            #Exonération CM
            if lm.company.legal_form_id == 3 :
                date_end_exo_cm = last_day_of_month(datetime.date(year=int(create_date.year), month=12, day=31)+relativedelta(years=2))
            else:
                date_end_exo_cm = last_day_of_month(create_date+relativedelta(months=36))
            
            if date_end_exo_cm >= date_c :
                situation_exit.update(exempt_cm=True, date_exempt_cm=date_end_exo_cm)
            else:
                situation_exit.update(exempt_cm=False, date_exempt_cm=date_end_exo_cm)
            #Exonération IS Export
            
            exo_is = BenefitItem.objects.filter(code_benefit='003', active=True).filter(benefitlink__lettremission_id=lm.id)
            if exo_is.exists():
                chang_ex = BenefitItem.objects.filter(code_benefit='011', active=True).filter(benefitlink__lettremission_id=lm.id)
                if chang_ex.exists():
                    nbre_chan_ex = chang_ex[0].numbre_add
                else:
                    nbre_chan_ex = 0
    
                situation_exit = Situation.objects.filter(exercice_id = pk).filter(lettremission_id=lm.id).filter(supervised=False).filter(date_closing = date_c)
                date_exo_is = exo_is[0].date_start+relativedelta(years=4-nbre_chan_ex)
                date_end_exo_is = last_day_of_month(datetime.date(year=int(date_exo_is.year), month=month, day=1))
                if date_end_exo_is >= date_c :
                    situation_exit.update(exempt_is=True, date_exempt_is=date_end_exo_is)
                else:
                    situation_exit.update(exempt_is=False, date_exempt_is=date_end_exo_is)

            exo_is = BenefitItem.objects.filter(code_benefit='012', active=True).filter(benefitlink__lettremission_id=lm.id)
            if exo_is.exists():
                chang_ex = BenefitItem.objects.filter(code_benefit='011', active=True).filter(benefitlink__lettremission_id=lm.id)
                if chang_ex.exists():
                    nbre_chan_ex = chang_ex[0].numbre_add
                else:
                    nbre_chan_ex = 0
    
                situation_exit = Situation.objects.filter(exercice_id = pk).filter(lettremission_id=lm.id).filter(supervised=False).filter(date_closing = date_c)
                date_exo_is = exo_is[0].date_start+relativedelta(years=4-nbre_chan_ex)
                date_end_exo_is = last_day_of_month(datetime.date(year=int(date_exo_is.year), month=month, day=1))
                if date_end_exo_is >= date_c :
                    situation_exit.update(exempt_is=True, date_exempt_is=date_end_exo_is)
                else:
                    situation_exit.update(exempt_is=False, date_exempt_is=date_end_exo_is)

            exo_is = BenefitItem.objects.filter(code_benefit='013', active=True).filter(benefitlink__lettremission_id=lm.id)
            if exo_is.exists():
                chang_ex = BenefitItem.objects.filter(code_benefit='011', active=True).filter(benefitlink__lettremission_id=lm.id)
                if chang_ex.exists():
                    nbre_chan_ex = chang_ex[0].numbre_add
                else:
                    nbre_chan_ex = 0
    
                situation_exit = Situation.objects.filter(exercice_id = pk).filter(lettremission_id=lm.id).filter(supervised=False).filter(date_closing = date_c)
                date_exo_is = exo_is[0].date_start+relativedelta(years=4-nbre_chan_ex)
                date_end_exo_is = last_day_of_month(datetime.date(year=int(date_exo_is.year), month=month, day=1))
                if date_end_exo_is >= date_c :
                    situation_exit.update(exempt_is=True, date_exempt_is=date_end_exo_is)
                else:
                    situation_exit.update(exempt_is=False, date_exempt_is=date_end_exo_is)
        if is_manager==True:
            return redirect('/exercice_manager/'+str(pk)+'/')
        else:       
            return redirect('/exercice/'+str(pk)+'/')

def datasituation(s, obj, *args, **kwargs):
    lm=s.lettremission
    db_name=lm.db_office+"vs"
    db_ip=lm.office.ip
    db_port=lm.office.port
    db_pass=lm.office.password
    connection = create_connection(db_ip, db_port, db_pass, db_name)
    accounts = Account.objects.all()
    accountsbis = AccountBis.objects.all()

    for a in accounts:
        ex_diff = a.exercice
        date_start=s.date_start+relativedelta(years=-ex_diff)
        date_closing=s.date_closing+relativedelta(years=-ex_diff)
        taxreturn_sit = TaxReturn.objects.filter(situation_id=s.id)
        if a.sql == 0:
            select_datas = "SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As Solde, datemvt FROM abnecrits WHERE  Ncompte between '"+str(a.account_lower)+"%' and '"+str(a.account_upper)+"%' and (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
        elif a.sql == 1:
            select_datas = "SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As Solde, datemvt FROM abnecrits WHERE  (Ncompte like '"+str(a.account_lower)+"%' or Ncompte like '"+str(a.account_upper)+"%') and (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
        else:
            select_datas = "SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As Solde, datemvt FROM abnecrits WHERE ("+str(a.sql_text)+") and (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
        datas = execute_read_query(connection, select_datas)
        if (datas[0])[0] == None:
            solde=0
        else:
            if a.sens == 0:
                solde=(datas[0])[0]
            else:
                solde=-(datas[0])[0]
        data_acc = taxreturn_sit.filter(code_account=a.code_account).filter(auto_genre = True)
        if data_acc.exists():
            data_acc.update(amount=solde, rubrique=a.name_account, deduc_reint=a.deduc_reint, nature=a.nature , taxreturn=a.taxreturn, auto_genre=True)
        else:
            TaxReturn.objects.create(situation_id=s.id, code_account=a.code_account, amount=solde, rubrique=a.name_account, deduc_reint=a.deduc_reint, nature=a.nature , taxreturn=a.taxreturn, auto_genre=True)


    for a in accountsbis:
        solde=0
        data_acc = taxreturn_sit.filter(code_account=a.code_account).filter(auto_genre = True)
        if data_acc.exists():
            data_acc.update(amount=solde, rubrique=a.name_account, nature=0 , taxreturn=a.taxreturn, ordre=a.ordre, auto_genre=True)
        else:
            TaxReturn.objects.create(situation_id=s.id, code_account=a.code_account, amount=solde, rubrique=a.name_account, nature=0 , taxreturn=a.taxreturn, ordre=a.ordre, auto_genre=True)        

    # reports déficitaire n-1
    year=obj.exercice
    data_rep = taxreturn_sit.filter(code_account__in=['REP_DEF_N2'])
    for i in data_rep:
        data_rep_ant = TaxReturn.objects.filter(situation__exercice__exercice=int(year)-1).filter(situation__lettremission=lm).filter(code_account__in=['REP_DEF_N1'])
        if data_rep_ant.exists():
            data_rep.update(amount=data_rep_ant[0].amount)
    data_rep = taxreturn_sit.filter(code_account__in=['REP_DEF_N3'])
    for i in data_rep:
        data_rep_ant = TaxReturn.objects.filter(situation__exercice__exercice=int(year)-1).filter(situation__lettremission=lm).filter(code_account__in=['REP_DEF_N2'])
        if data_rep_ant.exists():
            data_rep.update(amount=data_rep_ant[0].amount)
    data_rep = taxreturn_sit.filter(code_account__in=['REP_DEF_N4'])
    for i in data_rep:
        data_rep_ant = TaxReturn.objects.filter(situation__exercice__exercice=int(year)-1).filter(situation__lettremission=lm).filter(code_account__in=['REP_DEF_N3'])
        if data_rep_ant.exists():
            data_rep.update(amount=data_rep_ant[0].amount)
    data_rep = taxreturn_sit.filter(code_account__in=['REP_DEF_N1'])
    for i in data_rep:
        data_rep_ant = TaxReturn.objects.filter(situation__exercice__exercice=int(year)-1).filter(situation__lettremission=lm).filter(code_account__in=['DEF_EXE'])
        if data_rep_ant.exists():
            data_rep.update(amount=data_rep_ant[0].amount)
    data_rep = taxreturn_sit.filter(code_account__in=['AMO_DIF'])
    for i in data_rep:
        data_rep_ant_memo = TaxReturn.objects.filter(situation__exercice__exercice=int(year)-1).filter(situation__lettremission=lm).filter(code_account__in=['AMO_DIF_MEMO'])
        data_rep_ant = TaxReturn.objects.filter(situation__exercice__exercice=int(year)-1).filter(situation__lettremission=lm).filter(code_account__in=['AMO_DIF'])
        if data_rep_ant.exists() and data_rep_ant_memo.exists():
            data_rep.update(amount=data_rep_ant[0].amount + data_rep_ant_memo[0].amount)
    
    # bénéfice fiscal ou déficit + amortissements différés
    sum1 = s.taxreturn_set.filter(taxreturn=1, deduc_reint=0).aggregate(sum=Sum('amount'))
    if sum1['sum'] is None:
        sum1['sum'] = 0
    sum2 = s.taxreturn_set.filter(taxreturn=1, deduc_reint=1).aggregate(sum=Sum('amount'))
    if sum2['sum'] is None:
        sum2['sum'] = 0
    resultbrut = float(sum1['sum'])-float(sum2['sum'])
    if resultbrut < 0:
        data_resltbrut = taxreturn_sit.filter(code_account__in=['DEF_EXE']).update(amount=-resultbrut)
        data_amort_diff = taxreturn_sit.filter(code_account__in=['DOT_AMO_DIF'])              
        data_rep_diff = taxreturn_sit.filter(code_account__in=['REP_AMO_DIF'])
        amort_dif_memo = data_amort_diff[0].amount - data_rep_diff[0].amount   
        if -resultbrut <= amort_dif_memo:
            taxreturn_sit.filter(code_account__in=['AMO_DIF_MEMO']).update(amount=-resultbrut)
        else:
            taxreturn_sit.filter(code_account__in=['AMO_DIF_MEMO']).update(amount=amort_dif_memo)


    else:
        taxreturn_sit.filter(code_account__in=['BEN_AVA_IMP_DEF']).update(amount=resultbrut)                           
        taxreturn_sit.filter(code_account__in=['DOT_AMO_DIF']).update(amount=0)
    
    #imputation des déficit
    rep_defi_sum = taxreturn_sit.filter(taxreturn=3).exclude(code_account=['AMO_DIF']).aggregate(sum=Sum('amount'))
    data_rep1 = taxreturn_sit.filter(code_account__in=['REP_DEF_N1'])
    data_rep2 = taxreturn_sit.filter(code_account__in=['REP_DEF_N2'])
    data_rep3 = taxreturn_sit.filter(code_account__in=['REP_DEF_N3'])
    data_rep4 = taxreturn_sit.filter(code_account__in=['REP_DEF_N4'])
    if resultbrut <= 0 or rep_defi_sum['sum'] <= 0:
        pass
    elif resultbrut >= rep_defi_sum['sum']:               
        taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N1']).update(amount=data_rep1[0].amount)
        taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N2']).update(amount=data_rep2[0].amount)
        taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N3']).update(amount=data_rep3[0].amount)
        taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N4']).update(amount=data_rep4[0].amount)

            
        taxreturn_sit.filter(code_account__in=['REP_DEF_N1']).update(amount=0)
        taxreturn_sit.filter(code_account__in=['REP_DEF_N2']).update(amount=0)
        taxreturn_sit.filter(code_account__in=['REP_DEF_N3']).update(amount=0)
        taxreturn_sit.filter(code_account__in=['REP_DEF_N4']).update(amount=0)
        taxreturn_sit.filter(code_account__in=['AMO_DIF']).update(amount=0)

    elif resultbrut < rep_defi_sum['sum']:
        if resultbrut < data_rep4[0].amount:
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N4']).update(amount=resultbrut)
            data_rep4.update(amount=data_rep4[0].amount - resultbrut)
            taxreturn_sit.filter(code_account__in=['DEF_EXE']).update(amount=0)

        elif resultbrut < (data_rep4[0].amount + data_rep3[0].amount):
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N4']).update(amount=data_rep4[0].amount)
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N3']).update(amount=resultbrut-data_rep4[0].amount)
            data_rep3.update(amount=data_rep3[0].amount + data_rep4[0].amount - resultbrut)
            data_rep4.update(amount=0)
            taxreturn_sit.filter(code_account__in=['DEF_EXE']).update(amount=0)    

        elif resultbrut < (data_rep4[0].amount + data_rep3[0].amount + data_rep2[0].amount):
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N4']).update(amount=data_rep4[0].amount)
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N3']).update(amount=data_rep3[0].amount)
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N2']).update(amount=resultbrut-data_rep4[0].amount-data_rep3[0].amount)
            data_rep2.update(amount=data_rep2[0].amount + data_rep3[0].amount + data_rep4[0].amount - resultbrut)
            data_rep4.update(amount=0)
            data_rep3.update(amount=0)
            taxreturn_sit.filter(code_account__in=['DEF_EXE']).update(amount=0)         

        elif resultbrut < (data_rep4[0].amount + data_rep3[0].amount + data_rep2[0].amount + data_rep1[0].amount):
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N4']).update(amount=data_rep4[0].amount)
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N3']).update(amount=data_rep3[0].amount)
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N2']).update(amount=data_rep2[0].amount)
            taxreturn_sit.filter(code_account__in=['IMP_REP_DEF_N1']).update(amount=resultbrut-data_rep4[0].amount-data_rep3[0].amount-data_rep2[0].amount)
            data_rep1.update(amount=data_rep1[0].amount + data_rep2[0].amount + data_rep3[0].amount + data_rep4[0].amount - resultbrut)
            data_rep4.update(amount=0)
            data_rep3.update(amount=0)
            data_rep2.update(amount=0)
            taxreturn_sit.filter(code_account__in=['DEF_EXE']).update(amount=0)
    #benefice après imputation déficits
    rep_defi_imp_sum = taxreturn_sit.filter(taxreturn=2).aggregate(sum=Sum('amount'))
    ben_av_dif =  taxreturn_sit.filter(code_account__in=['BEN_AVA_IMP_DEF'])
    taxreturn_sit.filter(code_account__in=['BEN_APR_IMP_DEF']).update(amount=ben_av_dif[0].amount-rep_defi_imp_sum['sum'])                           

    # Résultat courant hors amortissement
    chc_n = taxreturn_sit.filter(code_account__in=['CHA_EXP', 'CHA_FIN']).aggregate(sum=Sum('amount'))
    proc_n = taxreturn_sit.filter(code_account__in=['PRO_EXP', 'PRO_FIN']).aggregate(sum=Sum('amount'))
    amortc_n = taxreturn_sit.filter(code_account__in=['DOT_EXP_IMM_N']).aggregate(sum=Sum('amount'))
    repc_n = taxreturn_sit.filter(code_account__in=['REP_EXP_IMM_N']).aggregate(sum=Sum('amount'))
    taxreturn_sit.filter(code_account__in=['RES_COU_HOR_AMO_N']).update(amount=proc_n['sum']-chc_n['sum']+amortc_n['sum']-repc_n['sum'])
    
    chc_n = taxreturn_sit.filter(code_account__in=['CHA_EXP_N1', 'CHA_FIN_N1']).aggregate(sum=Sum('amount'))
    proc_n = taxreturn_sit.filter(code_account__in=['PRO_EXP_N1', 'PRO_FIN_N1']).aggregate(sum=Sum('amount'))
    amortc_n = taxreturn_sit.filter(code_account__in=['DOT_EXP_IMM_N1']).aggregate(sum=Sum('amount'))
    repc_n = taxreturn_sit.filter(code_account__in=['REP_EXP_IMM_N1']).aggregate(sum=Sum('amount'))
    taxreturn_sit.filter(code_account__in=['RES_COU_HOR_AMO_N1']).update(amount=proc_n['sum']-chc_n['sum']+amortc_n['sum']-repc_n['sum'])

    chc_n = taxreturn_sit.filter(code_account__in=['CHA_EXP_N2', 'CHA_FIN_N2']).aggregate(sum=Sum('amount'))
    proc_n = taxreturn_sit.filter(code_account__in=['PRO_EXP_N2', 'PRO_FIN_N2']).aggregate(sum=Sum('amount'))
    amortc_n = taxreturn_sit.filter(code_account__in=['DOT_EXP_IMM_N2']).aggregate(sum=Sum('amount'))
    repc_n = taxreturn_sit.filter(code_account__in=['REP_EXP_IMM_N2']).aggregate(sum=Sum('amount'))
    taxreturn_sit.filter(code_account__in=['RES_COU_HOR_AMO_N2']).update(amount=proc_n['sum']-chc_n['sum']+amortc_n['sum']-repc_n['sum'])
    #statut CFC
    cfc = BenefitItem.objects.filter(code_benefit_id='012', active=True, benefitlink__lettremission__id=s.lettremission.id).exists()
    cfc2020 = BenefitItem.objects.filter(code_benefit_id='013', active=True, benefitlink__lettremission__id=s.lettremission.id).exists()
 
    #Cotisation Minimale
    item_rc_av_amo = taxreturn_sit.filter(taxreturn=4)
    score = 0
    for rc in item_rc_av_amo:
        if rc.amount < 0:
            score = score-1
       
    item_base_cm = taxreturn_sit.filter(taxreturn=13)
    for cm in item_base_cm:
        regime = 0
        if score == -3:
            taux_cm = 6/1000
        else:
            taux_cm = 5/1000

        if s.exempt_cm == True :
            regime = 1
            taux_cm = 0
        elif s.exempt_is == True and s.exempt_cm==False and cm.code_account =='VEN_ETR':
            regime = 1
            taux_cm = 0       
        elif cfc2020==True and s.exempt_is == True and s.exempt_cm==False and cm.code_account =='VEN_LOC':
            regime = 1
            taux_cm = 0
            
        base_cm = CotisationMinimal.objects.filter(situation_id=s.id).filter(code_account=cm.code_account, auto_genre=True)
        if base_cm.exists():
            base_cm.update(rubrique=cm.rubrique, ordre=cm.ordre, regime=regime, base=cm.amount, taux=taux_cm, amount=cm.amount*taux_cm, auto_genre=True)
        else:
            CotisationMinimal.objects.create(situation_id=s.id,  rubrique=cm.rubrique, regime=regime,  base=cm.amount, taux=taux_cm, amount=cm.amount*taux_cm, code_account=cm.code_account, ordre=cm.ordre, auto_genre=True)     
    

    #Ventilation Bénérice + calcul IS
    if cfc==False and cfc2020==True:
        impot=4
    elif  cfc==True and cfc2020==False :
        impot=3
    else:
        impot=0
    ben_ap_imp_def = taxreturn_sit.filter(code_account='BEN_APR_IMP_DEF')
    pourc_loc=0
    pourc_exp=0


    if ben_ap_imp_def[0].amount > 0:
        base_cm_sum = taxreturn_sit.filter(taxreturn=13).aggregate(sum=Sum('amount'))
        if cfc2020==True:
            ca_export_sum = taxreturn_sit.filter(code_account__in=['VEN_ETR','VEN_LOC']).aggregate(sum=Sum('amount'))
        else:
            ca_export_sum = taxreturn_sit.filter(code_account='VEN_ETR').aggregate(sum=Sum('amount'))
            
        if base_cm_sum['sum'] == 0 or base_cm_sum['sum'] == None:
            pourc_exp =0
        else:
            pourc_exp=round(ca_export_sum['sum']/(base_cm_sum['sum']),4)
        pourc_loc=round(1-pourc_exp,4)
        

        if pourc_loc>0:
            print("fffffffffffff", pourc_loc)
            if lm.company.legal_form.code_lf in [3,11]:
                bareme = BaremeImpot.objects.filter(impot=1, plancher__lte=ben_ap_imp_def[0].amount, plafond__gte=ben_ap_imp_def[0].amount).filter(a_partir_du__lte=s.date_start, jusqu_au__gte=s.date_start).filter(taux_specifique=False)
            else:
                bareme = BaremeImpot.objects.filter(impot=0, plancher__lte=ben_ap_imp_def[0].amount, plafond__gte=ben_ap_imp_def[0].amount).filter(a_partir_du__lte=s.date_start, jusqu_au__gte=s.date_start).filter(taux_specifique=False)
            if bareme.exists():
                importsociete = ImpotSociete.objects.filter(situation_id=s.id, benefice=0, auto_genre=True)
                if importsociete.exists():
                    importsociete.update(pourcentage=pourc_loc , base=ben_ap_imp_def[0].amount*pourc_loc, taux=bareme[0].taux , deduction=bareme[0].montant_a_deduire*pourc_loc , amount= myround((myround(ben_ap_imp_def[0].amount,10) * bareme[0].taux - bareme[0].montant_a_deduire)*pourc_loc,1), ordre=1, auto_genre=True)
                else:
                    ImpotSociete.objects.create(situation_id=s.id, benefice=0, pourcentage=pourc_loc , base=ben_ap_imp_def[0].amount*pourc_loc, taux=bareme[0].taux , deduction=bareme[0].montant_a_deduire*pourc_loc , amount= myround((myround(ben_ap_imp_def[0].amount,10) * bareme[0].taux - bareme[0].montant_a_deduire)*pourc_loc,1), ordre=1, auto_genre=True)
        if s.exempt_is == False:
            if pourc_exp>0:
                if lm.company.legal_form.code_lf in [3,11]:
                    bareme = BaremeImpot.objects.filter(impot=1, plancher__lte=ben_ap_imp_def[0].amount, plafond__gte=ben_ap_imp_def[0].amount).filter(a_partir_du__lte=s.date_start, jusqu_au__gte=s.date_start).filter(taux_specifique=True)
                else:
                    bareme = BaremeImpot.objects.filter(impot=impot, plancher__lte=ben_ap_imp_def[0].amount, plafond__gte=ben_ap_imp_def[0].amount).filter(a_partir_du__lte=s.date_start, jusqu_au__gte=s.date_start).filter(taux_specifique=True)                   
                if bareme.exists():
                    importsociete = ImpotSociete.objects.filter(situation_id=s.id, benefice=1, auto_genre=True)
                    if importsociete.exists():
                        importsociete.update(pourcentage=pourc_exp , base=ben_ap_imp_def[0].amount*pourc_exp, taux=bareme[0].taux , deduction=bareme[0].montant_a_deduire*pourc_exp , amount= myround((myround(ben_ap_imp_def[0].amount,10) * bareme[0].taux - bareme[0].montant_a_deduire)*pourc_exp,1), ordre=2, auto_genre=True)
                    else:
                        ImpotSociete.objects.create(situation_id=s.id, benefice=1, pourcentage=pourc_exp , base=ben_ap_imp_def[0].amount*pourc_exp, taux=bareme[0].taux , deduction=bareme[0].montant_a_deduire*pourc_exp , amount= myround((myround(ben_ap_imp_def[0].amount,10) * bareme[0].taux - bareme[0].montant_a_deduire)*pourc_exp,1),ordre=2, auto_genre=True)
            #Exonéré à 0
            importsociete = ImpotSociete.objects.filter(situation_id=s.id, benefice=3, auto_genre=True)
            if importsociete.exists():
                importsociete.update(pourcentage=0 , base=0, taux=0 , deduction=0 , amount= 0, auto_genre=True)
            else:
                ImpotSociete.objects.create(situation_id=s.id, benefice=3, pourcentage=0 , base=0, taux=0 , deduction=0 , amount= 0, auto_genre=True)       
        else:
            if pourc_exp>0:
                if lm.company.legal_form.code_lf in [3,11]:
                    bareme = BaremeImpot.objects.filter(impot=1, plancher__lte=ben_ap_imp_def[0].amount, plafond__gte=ben_ap_imp_def[0].amount).filter(a_partir_du__lte=s.date_start, jusqu_au__gte=s.date_start).filter(taux_specifique=True)
                else:
                    bareme = BaremeImpot.objects.filter(impot=impot, plancher__lte=ben_ap_imp_def[0].amount, plafond__gte=ben_ap_imp_def[0].amount).filter(a_partir_du__lte=s.date_start, jusqu_au__gte=s.date_start).filter(taux_specifique=True)
                if bareme.exists():
                    importsociete = ImpotSociete.objects.filter(situation_id=s.id, benefice=3, auto_genre=True)
                    if importsociete.exists():
                        importsociete.update(pourcentage=pourc_exp , base=ben_ap_imp_def[0].amount*pourc_exp, taux=0 , deduction=0 , amount= 0, ordre=3, auto_genre=True)
                    else:
                        ImpotSociete.objects.create(situation_id=s.id, benefice=3, pourcentage=pourc_exp , base=ben_ap_imp_def[0].amount*pourc_exp, taux=0 , deduction=0 , amount=0, ordre=3, auto_genre=True)
            #Plafonnée à 0
            importsociete = ImpotSociete.objects.filter(situation_id=s.id, benefice=1, auto_genre=True)
            if importsociete.exists():
                importsociete.update(pourcentage=0 , base=0, taux=0 , deduction=0 , amount= 0, ordre=4, auto_genre=True)
            else:
                ImpotSociete.objects.create(situation_id=s.id, benefice=1, pourcentage=0 , base=0, taux=0 , deduction=0 , amount= 0, ordre=4, auto_genre=True)

        importsociete = ImpotSociete.objects.filter(situation_id=s.id, benefice=2, auto_genre=True)
        if importsociete.exists():
            importsociete.update(pourcentage=0 , base=0, taux=0 , deduction=0 , amount= 0, ordre=4, auto_genre=True)
        else:
            ImpotSociete.objects.create(situation_id=s.id, benefice=2, pourcentage=0 , base=0, taux=0 , deduction=0 , amount= 0, ordre=4, auto_genre=True)    
    #affectation IS + CM à la déclaration fiscale
    cotisation_minsum = myround(s.cotisationminimal_set.all().aggregate(sum=Sum('amount'))['sum'],1)
    if cotisation_minsum == [] or cotisation_minsum ==None:
         cotisation_minsum=0
    taxreturn_sit.filter(code_account='CM').update(amount=cotisation_minsum)
    
    impotsociete_sum = s.impotsociete_set.all().aggregate(sum=Sum('amount'))['sum']
    if impotsociete_sum == [] or impotsociete_sum ==None:
        impotsociete_sum=0
    taxreturn_sit.filter(code_account='IS_RF').update(amount=impotsociete_sum)
    
    #Acomptes exercice en Cours
    acomptes = {1:'ACO_1er', 2:'ACO_2EM',3:'ACO_3EM', 4:'ACO_4EM'}
    acomptes_pro = {1:'ACO_1er_PRO', 2:'ACO_2EM_PRO',3:'ACO_3EM_PRO', 4:'ACO_4EM_PRO'}
    date_closing_n1=s.date_closing+relativedelta(years=-1)
    acomptes_verse=0
    if s.lettremission.company.legal_form.code_lf in [3,11,12]:
        acomptes_verse=0
        for key in acomptes:
            taxreturn_sit.filter(code_account=acomptes[key]).update(amount=0)
    else:
        for key in acomptes:
            taxreturn_sit_n1 = TaxReturn.objects.filter(situation__lettremission=s.lettremission, situation__date_closing=date_closing_n1).filter(code_account=acomptes_pro[key])
            if taxreturn_sit_n1.exists():
                taxreturn_sit.filter(code_account=acomptes[key]).update(amount=taxreturn_sit_n1[0].amount)
                acomptes_verse = acomptes_verse + taxreturn_sit_n1[0].amount
    taxreturn_sit.filter(code_account='ACO_PRO_VERSE').update(amount=acomptes_verse)
    
    #Excedent ou Reliquat
    total_versment = taxreturn_sit.filter(code_account__in=['RED_IS_BOURSE', 'IS_ETRANGE', 'IS_PPRF_NON_IMP', 'RED_IS_INNOV', 'ACO_PRO_VERSE','EXC_IS_IMP','IS_PPRF_IMP','RED_IS_AUG_CAP', 'EXC_IS_NON_IMP']).aggregate(sum=Sum('amount'))['sum']
    taxreturn_sit.filter(code_account='TOTAL').update(amount=total_versment)
    if cotisation_minsum >= impotsociete_sum:
        impot_exercice = cotisation_minsum
    else:
        impot_exercice =impotsociete_sum
    
    if total_versment > impot_exercice:
        taxreturn_sit.filter(code_account='EXC_A_IMP').update(amount=total_versment - impot_exercice)
        taxreturn_sit.filter(code_account='REL_REST').update(amount=0)
    else:
        taxreturn_sit.filter(code_account='REL_REST').update(amount=impot_exercice - total_versment)
        taxreturn_sit.filter(code_account='EXC_A_IMP').update(amount=0)
        
    #acomptes provisonnel n+1
    # date_exempt_is
    if s.lettremission.company.legal_form.code_lf in [3,11,12]:
        acompte_pro = 0
    else:
        date_opningn1=s.date_closing+relativedelta(days=-1)
        if s.exempt_is==True and date_opningn1>s.date_exempt_is:
            pass
        else:
            acompte_pro = myround(impot_exercice/s.numbre_month*12/4,1)       
    for key in acomptes:
        taxreturn_sit.filter(code_account=acomptes_pro[key]).update(amount=acompte_pro)
    
    #SECTION ------------------------SECTION
    section_models = SectionModel.objects.exclude(code_section='X')
    for sm in section_models :
        section = Section.objects.filter(section = sm, situation = s)
        if section.exists():
            pass
        else:
            Section.objects.create(situation = s, section =sm, date_generation=date.today())

    # LEAD--------------------LEAD--------------------LEAD    
    date_start=s.date_start
    date_start_n1=s.date_start+relativedelta(years=-1)
    date_closing=s.date_closing
    date_closing_n1_ytd=s.date_closing+relativedelta(years=-1)
    date_closing_n1_end=s.date_start+relativedelta(days=-1)

    sections = Section.objects.filter(situation = s)
    for sct in sections:
        if sct.section.type==0:
            date_closing_n1=date_closing_n1_ytd
        else:
            date_closing_n1=date_closing_n1_end
        lead_accounts = AccountLead.objects.filter(section_id = sct.section_id).filter(level__in=[3,4,5])
        for la in lead_accounts:
            select_datas = "SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As Solde, datemvt FROM abnecrits WHERE  (Ncompte like '"+str(la.code_account)+"%') and (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
            select_datas_n1 = "SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As Solde, datemvt FROM abnecrits WHERE  (Ncompte like '"+str(la.code_account)+"%') and (datemvt between '" + str(date_start_n1) +"' and '" + str(date_closing_n1) +"');"

            datas = execute_read_query(connection, select_datas)
            datas_n1 = execute_read_query(connection, select_datas_n1)
            if (datas[0])[0] == None :
                solde=0
            else:
                if la.sens == 0:
                    solde=(datas[0])[0]
                else:
                    solde=-(datas[0])[0]
            
            if (datas_n1[0])[0] == None:
                solde_n1=0
            else:
                if la.sens == 0:
                    solde_n1=(datas_n1[0])[0]
                else:
                    solde_n1=-(datas_n1[0])[0]
            data_delta = solde-solde_n1
            if solde_n1 == 0:
                data_delta_pc = 0
            else:
                data_delta_pc = data_delta / solde_n1
                
            lead_section = Lead.objects.filter(section=sct, code_account = la)
            if lead_section.exists():
                lead_section.update(ordre=la.ordre, data_n=solde, data_n1=solde_n1, data_delta = data_delta , data_delta_pc = data_delta_pc, auto_genre=True)
            else:
                Lead.objects.create(section=sct,   code_account=la, ordre=la.ordre, data_n=solde, data_n1=solde_n1, data_delta = data_delta , data_delta_pc = data_delta_pc, auto_genre=True)
        lead_section = Lead.objects.filter(section=sct).filter(code_account__level__in=[3,4,5]).exclude(data_n = 0, data_n1 = 0)
        if lead_section.exists():
            Section.objects.filter(id=sct.id).update(statut=0)
        else:
            Section.objects.filter(id=sct.id).update(statut=4)

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
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user).exists()
        obj = self.get_object()
        year=obj.exercice
        pk = obj.pk     

        situations=Situation.objects.filter(exercice=obj).filter(lettremission__manager__user=user).exclude(supervised=True)
        for s in situations:
            datasituation(s=s, obj=obj, *args, **kwargs)
        if is_manager==True:
            return redirect('/exercice_manager/'+str(pk)+'/')
        else:       
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
        class Rubrique(models.IntegerChoices):
            passagerf = (1,'Passage au Résultat Fiscal')
            deficit = (2,'Imputation Déficites')
            report = (3,'Déficites Reportables')
            rcha = (4,'Résultat Courant Hors Amortissement')
            rf = (5,'Résultat Fiscal')
            ventilrf = (6,'Ventilation du bénéfice net fiscal')
            acomptes = (7,'Acomptes versés')
            rel_exc = (8,'Calcul Reliquat ou Excédent')
            acomptesn1 = (9,'Acomptes Provisionnel N+1')
            etat_deficit = (10,'Etat Explicatif Déficit ou Résultat Nul')
            etat_ventes = (11,'Etat des ventes par client')
            liasse = (12,'Etat Entreprises Encouragées')
        form.fields['taxreturn'].choices =Rubrique.choices
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
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.situation = obj
                new_item.auto_genre = False
                new_item.save()
                return redirect('/update_situation_coll/'+str(pk)+'/')

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
            class Rubrique(models.IntegerChoices):
                passagerf = (1,'Passage au Résultat Fiscal')
                deficit = (2,'Imputation Déficites')
                report = (3,'Déficites Reportables')
                rcha = (4,'Résultat Courant Hors Amortissement')
                rf = (5,'Résultat Fiscal')
                ventilrf = (6,'Ventilation du bénéfice net fiscal')
                acomptes = (7,'Acomptes versés')
                rel_exc = (8,'Calcul Reliquat ou Excédent')
                acomptesn1 = (9,'Acomptes Provisionnel N+1')
                etat_deficit = (10,'Etat Explicatif Déficit ou Résultat Nul')
                etat_ventes = (11,'Etat des ventes par client')
                liasse = (12,'Etat Entreprises Encouragées')
            form.fields['taxreturn'].choices =Rubrique.choices
            context = {'situation': situation,'taxreturn': taxreturn, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        taxreturn = TaxReturn.objects.get(pk=pk)
        situation = taxreturn.situation
        if taxreturn is not None:
            form = self.form_class(request.POST, request.FILES, instance=taxreturn)
            #form = self.form_class(request.POST, instance=taxreturn)
            if form.is_valid():
                form.save()
                datasituation(s=situation, obj=situation.exercice, *args, **kwargs)
                return redirect('/update_situation_coll/'+str(situation.id)+'/')
                
        context = {'situation': situation, 'taxreturn': taxreturn, 'form': form}
        return render(request, self.template_name, context)

class UpdateTaxReturnAmountView(UpdateTaxReturnView):
    form_class = TaxReturnAmountForm

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
            return redirect('/update_situation_coll/'+str(situation)+'/')
            
        context = {'taxreturn': taxreturn, 'situation': situation}
        return render(request, self.template_name, context) 

#-------------------LIASSE FISCALE---------------

def dataliassefiscale(situation, *args, **kwargs):
    lm=situation.lettremission
    db_name=lm.db_office+"vs"
    db_ip=lm.office.ip
    db_port=lm.office.port
    db_pass=lm.office.password
    connection = create_connection(db_ip, db_port, db_pass, db_name)
    tableliassefiscales = TableLiasseFiscale.objects.all()
    liasse_fiscale_sit = LiasseFiscale.objects.filter(situation_id=situation.id)
    exercice = situation.exercice.exercice
    date_start=situation.date_start
    date_closing=situation.date_closing
    date_start_n1=situation.date_start+relativedelta(years=-1)
    date_closing_n1=situation.date_closing+relativedelta(years=-1)
    def updatelf(*args, **kwargs):
        data_1 = liasse_fiscale_sit.filter(tableliassefiscale_id=t[0].code_table).filter(auto_genre = True)
        ordre = t[0].ordre
        if float(amount_1)-float(amount_2) > -float(t[0].tolerance) and float(amount_1)-float(amount_2) <float(t[0].tolerance) :
            statut=2
            message="OK : "+t[0].text_controle + " / err : "+ str(float(amount_1)-float(amount_2))
        else:
            statut=3
            message="ECART : "+ str('{:8,.2f}'.format(float(amount_1) - float(amount_2)))+" / " +t[0].text_controle

        if data_1.exists():
            data_1.update(amount_1=amount_1, statut=statut, message=message, amount_2=amount_2, ordre=ordre, auto_genre=True)
        else:
            LiasseFiscale.objects.create(situation=situation, tableliassefiscale_id=t[0].code_table, statut=statut, message=message, amount_1=amount_1, amount_2=amount_2, ordre=ordre, auto_genre=True)

    #SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As Solde, datemvt FROM abnecrits WHERE  (Ncompte like '"+str(la.code_account)+"%') and (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
    #T03_IMPOT
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T03_IMPOT')
    if t[0].ecriture == True:
        select_datas = str(t[0].text_sql) +"And (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
    else:
        select_datas = str(t[0].text_sql) +"And Annee="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    data_2=TaxReturn.objects.filter(situation=situation).filter(code_account='IS_RF').aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        impot_is=0
    else:
        impot_is=data_2['sum']
    data_2=TaxReturn.objects.filter(situation=situation).filter(code_account='CM').aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        impot_cm=0
    else:
        impot_cm=data_2['sum']
    if impot_is > impot_cm:
        amount_2=impot_is
    else:
        amount_2=impot_cm     
    updatelf(situation=situation, tableliassefiscale_id=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T03_REINT
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T03_REINT')
    select_datas = str(t[0].text_sql) +"And Annee="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    data_2=TaxReturn.objects.filter(situation=situation, taxreturn=1, deduc_reint=0).exclude(code_account='RES_NET').aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        amount_2=0
    else:
        amount_2=data_2['sum']
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    
    #T03_DEDUCT
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T03_DEDUCT')
    select_datas = str(t[0].text_sql) +"And Annee="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    data_2=TaxReturn.objects.filter(situation=situation, taxreturn=1, deduc_reint=1).exclude(code_account='RES_NET').aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        amount_2=0
    else:
        amount_2=data_2['sum']
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T03_RF_BRU
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T03_RF_BRU')
    select_datas = str(t[0].text_sql) +"And Annee="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_11=0
    else:
        amount_11=(data_1[0])[0]
    if (data_1[0])[1] == None:
        amount_12=0
    else:
        amount_12=(data_1[0])[1]
    amount_1=amount_11-amount_12    
    data_2=TaxReturn.objects.filter(situation=situation, taxreturn=1, deduc_reint=0).aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        amount_21=0
    else:
        amount_21=data_2['sum']        
    data_2=TaxReturn.objects.filter(situation=situation, taxreturn=1, deduc_reint=1).aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        amount_22=0
    else:
        amount_22=data_2['sum']
    amount_2=amount_21-amount_22    
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T03_RF_NET
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T03_RF_NET')
    select_datas = str(t[0].text_sql) +"And Annee="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_11=0
    else:
        amount_11=(data_1[0])[0]
    if (data_1[0])[1] == None:
        amount_12=0
    else:
        amount_12=(data_1[0])[1]
    amount_1=amount_11-amount_12
    
    data_2=TaxReturn.objects.filter(situation=situation, taxreturn__in=[1,2], deduc_reint=0).aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        amount_21=0
    else:
        amount_21=data_2['sum']       
    data_2=TaxReturn.objects.filter(situation=situation, taxreturn__in=[1,2], deduc_reint=1).aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        amount_22=0
    else:
        amount_22=data_2['sum']
    amount_2=amount_21-amount_22    
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T03_RF_CAD
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T03_CAD')
    select_datas = str(t[0].text_sql) +"And Annee="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    data_2=TaxReturn.objects.filter(situation=situation, taxreturn=3).filter(code_account='AMO_DIF').aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        amount_2=0
    else:
        amount_2=data_2['sum']
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T03_CU_DIF
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T03_CU_DIF')
    select_datas = str(t[0].text_sql) +"And Annee="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    data_2=TaxReturn.objects.filter(situation=situation, taxreturn=3).exclude(code_account='AMO_DIF').aggregate(sum=Sum('amount'))
    if data_2['sum'] == None:
        amount_2=0
    else:
        amount_2=data_2['sum']
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)
    
    
    #T04_IM_NVC
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T04_IM_NVC')
    select_datas = str(t[0].text_sql) +" And (Anne_ecol="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    select_datas_2= "SELECT Sum(`MontantmvtsD`) as Débit, Sum(`MontantmvtsC`) as Crédit FROM abnecrits WHERE Ncompte BETWEEN 21000000 AND 21999999 "+"And (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
    data_2 = execute_read_query(connection, select_datas_2)
    if (data_2[0])[0] == None:
        amount_20=0
    else:
        amount_20=(data_2[0])[0]
    if (data_2[0])[1] == None:
        amount_21=0
    else:
        amount_21=(data_2[0])[1]
        amount_2=float(amount_20)-float(amount_21)
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T04_IM_NVO
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T04_IM_NVO')
    select_datas = str(t[0].text_sql) +" And (Anne_ecol="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    select_datas_2= "SELECT Sum(`MontantmvtsD`) as Débit, Sum(`MontantmvtsC`) as Crédit FROM abnecrits WHERE Ncompte BETWEEN 21000000 AND 21999999 "+"And (datemvt between '" + str(date_start_n1) +"' and '" + str(date_closing_n1) +"');"
    data_2 = execute_read_query(connection, select_datas_2)
    if (data_2[0])[0] == None:
        amount_20=0
    else:
        amount_20=(data_2[0])[0]
    if (data_2[0])[1] == None:
        amount_21=0
    else:
        amount_21=(data_2[0])[1]
        amount_2=float(amount_20)-float(amount_21)
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T04_IM_ICC
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T04_IM_ICC')
    select_datas = str(t[0].text_sql) +" And (Anne_ecol="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    select_datas= "SELECT Sum(`MontantmvtsD`) as Débit, Sum(`MontantmvtsC`) as Crédit FROM abnecrits WHERE Ncompte BETWEEN 22000000 AND 22999999 "+"And (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
    data_2 = execute_read_query(connection, select_datas)
    if (data_2[0])[0] == None:
        amount_20=0
    else:
        amount_20=(data_2[0])[0]
    if (data_2[0])[1] == None:
        amount_21=0
    else:
        amount_21=(data_2[0])[1]
        amount_2=float(amount_20)-float(amount_21)
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T04_IM_ICO
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T04_IM_ICO')
    select_datas = str(t[0].text_sql) +" And (Anne_ecol="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    select_datas= "SELECT Sum(`MontantmvtsD`) as Débit, Sum(`MontantmvtsC`) as Crédit FROM abnecrits WHERE Ncompte BETWEEN 22000000 AND 22999999 "+"And (datemvt between '" + str(date_start_n1) +"' and '" + str(date_closing_n1) +"');"
    data_2 = execute_read_query(connection, select_datas)
    if (data_2[0])[0] == None:
        amount_20=0
    else:
        amount_20=(data_2[0])[0]
    if (data_2[0])[1] == None:
        amount_21=0
    else:
        amount_21=(data_2[0])[1]
        amount_2=amount_20-amount_21
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T04_IM_COC
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T04_IM_COC')
    select_datas = str(t[0].text_sql) +" And (Anne_ecol="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    select_datas= "SELECT Sum(`MontantmvtsD`) as Débit, Sum(`MontantmvtsC`) as Crédit FROM abnecrits WHERE Ncompte BETWEEN 23000000 AND 23999999 "+"And (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
    data_2 = execute_read_query(connection, select_datas)
    if (data_2[0])[0] == None:
        amount_20=0
    else:
        amount_20=(data_2[0])[0]
    if (data_2[0])[1] == None:
        amount_21=0
    else:
        amount_21=(data_2[0])[1]
        amount_2=float(amount_20)-float(amount_21)
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T04_IM_COO
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T04_IM_COO')
    select_datas = str(t[0].text_sql) +" And (Anne_ecol="+str(exercice)+");"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    select_datas= "SELECT Sum(`MontantmvtsD`) as Débit, Sum(`MontantmvtsC`) as Crédit FROM abnecrits WHERE Ncompte BETWEEN 23000000 AND 23999999 "+"And (datemvt between '" + str(date_start_n1) +"' and '" + str(date_closing_n1) +"');"
    data_2 = execute_read_query(connection, select_datas)
    if (data_2[0])[0] == None:
        amount_20=0
    else:
        amount_20=(data_2[0])[0]
    if (data_2[0])[1] == None:
        amount_21=0
    else:
        amount_21=(data_2[0])[1]
        amount_2=amount_20-amount_21
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)

    #T07_CB
    amount_1=0
    amount_2=0
    t = tableliassefiscales.filter(code_table='T07_CB')
    select_datas = str(t[0].text_sql) +" Annee="+str(exercice)+ ";"
    data_1 = execute_read_query(connection, select_datas)
    if (data_1[0])[0] == None:
        amount_1=0
    else:
        amount_1=(data_1[0])[0]
    select_datas= "SELECT Sum(`MontantmvtsD`) as Débit, Sum(`MontantmvtsC`) as Crédit FROM abnecrits WHERE Ncompte BETWEEN 61320000 AND 61329999 "+"And (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"
    data_2 = execute_read_query(connection, select_datas)
    if (data_2[0])[0] == None:
        amount_20=0
    else:
        amount_20=(data_2[0])[0]
    if (data_2[0])[1] == None:
        amount_21=0
    else:
        amount_21=(data_2[0])[1]
        amount_2=amount_20-amount_21
    updatelf(situation=situation, tableliassefiscale=t[0].code_table, amount_1=amount_1, amount_2=amount_2)
    
    
    
    
class UpdateDataLiasseFiscaleView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/situation_update_liasse_fiscale.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        if situation is not None:
            context = {'situation': situation}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        if situation is not None:
            dataliassefiscale(situation=situation, *args, **kwargs)
            return redirect('/update_situation_liasse_fiscale/'+str(situation.pk)+'/')
                
        context = {'situation': situation}
        return render(request, self.template_name, context)
    
class UpdateLiasseFiscaleView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    form_class = SituationForm
    template_name = 'tasks/situation_update_liasse_fiscale.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user).exists()
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        liassefiscale_tables = situation.liassefiscale_set.all().order_by('ordre')
        liassefiscale_tables_val = LiasseFiscale.objects.filter(situation=situation).filter(statut__in=[2,4])
        liassefiscale_tables_enc = LiasseFiscale.objects.filter(situation=situation).exclude(statut__in=[2,4])
        if situation is not None:
            form = self.form_class(instance=situation)
            context = {'is_manager':is_manager,'exercice': exercice,'situation': situation, 'liassefiscale_tables':liassefiscale_tables,'liassefiscale_tables_val':liassefiscale_tables_val,'liassefiscale_tables_enc':liassefiscale_tables_enc,'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        situation = Situation.objects.get(pk=pk)
        exercice = situation.exercice.id
        liassefiscale_tables = situation.liassefiscale_set.all().order_by('ordre')
        user = request.user.profile
        if situation is not None:
            form = self.form_class(request.POST, request.FILES, instance=situation)
            #form = self.form_class(request.POST, instance=situation)
            if form.is_valid():
                form.save()               
                is_val = Validator.objects.filter(user=user, lettremission_id=situation.lettremission_id).exists()
                if is_val == True :
                    return redirect('/user_portefolio_situation/')
                else:
                    return redirect('/ldm_situation/'+str(situation.lettremission.id)+'/')
                
        context = {'exercice': exercice, 'situation': situation, 'liassefiscale_tables':liassefiscale_tables, 'form': form}
        return render(request, self.template_name, context)
class CreateLiasseFiscalTableView(LoginRequiredMixin, UserAccessMixin, SituationObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    form_class = LiasseFiscaleForm
    template_name = 'tasks/liasse_fiscale.html'

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
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.situation = obj
                new_item.auto_genre = False
                new_item.save()
                return redirect('/update_situation_liasse_fiscale/'+str(pk)+'/')

        context = {'situation': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateLiasseFiscalTableView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    form_class = LiasseFiscaleForm
    template_name = 'tasks/liasse_fiscale_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        liasse_fiscale = LiasseFiscale.objects.get(pk=pk)
        situation = liasse_fiscale.situation.id
        if liasse_fiscale is not None:
            form = self.form_class(instance=liasse_fiscale)

            context = {'situation': situation,'liasse_fiscale': liasse_fiscale, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        liasse_fiscale = LiasseFiscale.objects.get(pk=pk)
        situation = liasse_fiscale.situation.id
        if liasse_fiscale is not None:
            form = self.form_class(request.POST, request.FILES, instance=liasse_fiscale)
            #form = self.form_class(request.POST, instance=liasse_fiscale)
            if form.is_valid():
                form.save()
                return redirect('/update_situation_liasse_fiscale/'+str(situation)+'/')
                
        context = {'situation': situation, 'liasse_fiscale': liasse_fiscale, 'form': form}
        return render(request, self.template_name, context)

class DeleteLiasseFiscalTableView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/liasse_fiscale_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        liasse_fiscale = LiasseFiscale.objects.get(pk=pk)
        situation = liasse_fiscale.situation.id
        if liasse_fiscale is not None:
            context = {'liasse_fiscale': liasse_fiscale, 'situation': situation}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        liasse_fiscale = LiasseFiscale.objects.get(pk=pk)
        situation = liasse_fiscale.situation.id
        if liasse_fiscale is not None:
            liasse_fiscale.delete()
            return redirect('/update_situation_liasse_fiscale/'+str(situation)+'/')
            
        context = {'liasse_fiscale': liasse_fiscale, 'situation': situation}
        return render(request, self.template_name, context) 

# ----------------DAS------DAS-----------
class CreateDASView(LoginRequiredMixin, UserAccessMixin, ExerciceObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    form_class = DASForm
    template_name = 'tasks/das.html'

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
            form = self.form_class()
        else:
            form = self.form_class(request.POST, request.FILES)
               
            if form.is_valid():
                lettremission = request.POST.get('lettremission')
                das = DAS.objects.filter(exercice=obj, lettremission=lettremission)
                if das.exists():
                    messages.info(request, 'La situation '+ str(das[0]) +' existe déja !')
                else:
                    new_item = form.save(commit=False)
                    new_item.exercice = obj
                    new_item.save()
                    return redirect('/exercice_das_manager/'+str(pk)+'/')

        context = {'exercice': obj, 'form': form}
        return render(request, self.template_name, context)


class DeleteDASView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/das_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        exercice = das.exercice.id
        if das is not None:
            context = {'das': das, 'exercice': exercice}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        exercice = das.exercice.id
        if das is not None:
            das.delete()
            return redirect('/exercice_das/'+str(exercice)+'/')
            
        context = {'das': das, 'exercice': exercice}
        return render(request, self.template_name, context) 





def datadas(das, obj, *args, **kwargs):
    lm=das.lettremission
    db_name=lm.db_office+"vs"
    db_ip=lm.office.ip
    db_port=lm.office.port
    db_pass=lm.office.password
    connection = create_connection(db_ip, db_port, db_pass, db_name)
    dasmodel = DASModel.objects.all().filter(type__in=[0,1,2,3])
    year=obj.exercice
    month=das.month
    date_start=das.date_start
    date_closing=das.date_closing
    date_versement = date_closing+relativedelta(months=1)
    dasdetail_das = DASDetail.objects.filter(das_id=das.id)
    for a in dasmodel:
        if a.type == 0:
            select_datas = str(a.text_sql)+" and annee_bul = " + str(year) +" and mois_bul <= " + str(month) + ";"
        elif a.type == 1:
            select_datas = "SELECT Sum(Principal) as IRVerse FROM abnetat_9421 WHERE Annee = "+ str(year) +";"
        elif a.type == 2:
            select_datas = "SELECT  (Sum(MontantmvtsD) - Sum(MontantmvtsC)) As solde FROM abnecrits WHERE ("+str(a.text_sql)+") and (datemvt between '" + str(date_start) +"' and '" + str(date_closing) +"');"       
        else:
            if a.code_rubrique=='EXO_DAS':
                select_datas = "SELECT Sum(Gain_result) as Valeur FROM abnlbulletin WHERE ((CodeRubrique_result BETWEEN 360 AND 379) Or (CodeRubrique_result BETWEEN 501 AND 597)) and annee_bul = " + str(year) +" and mois_bul <= " + str(month) + ";"
        datas = execute_read_query(connection, select_datas)
        if datas == [] or (datas[0])[0] == None:
            solde=0
        else:
            solde=(datas[0])[0]
            
        data_acc = dasdetail_das.filter(dasmodel=a).filter(auto_genre = True)
        if data_acc.exists():
            data_acc.update(amount=solde, dasmodel=a, ordre=a.ordre, auto_genre=True)
        else:
            DASDetail.objects.create(das_id=das.id, amount=solde, dasmodel=a, ordre=a.ordre, auto_genre=True)
    sbg = dasdetail_das.filter(dasmodel_id='SBG')
    ms = dasdetail_das.filter(dasmodel_id='REM_PER') 
    ir = dasdetail_das.filter(dasmodel_id='IR')
    irv = dasdetail_das.filter(dasmodel_id='IRV')
    exo = dasdetail_das.filter(dasmodel_id='EXO')
    exo_das = dasdetail_das.filter(dasmodel_id='EXO_DAS')
    if float(sbg[0].amount) - float(ms[0].amount) > -0.01 and float(sbg[0].amount) - float(ms[0].amount) <0.01:
        sbg.update(coherence=True)
        ms.update(coherence=True)
    else:
        sbg.update(coherence=False)
        ms.update(coherence=False)
        
    if float(ir[0].amount) - float(irv[0].amount) > -100 and float(ir[0].amount) - float(irv[0].amount) == 0:
        ir.update(coherence=True)
        irv.update(coherence=True)
    else:
        ir.update(coherence=False)
        irv.update(coherence=False)
        
    if float(exo[0].amount) == float(exo_das[0].amount):
        exo.update(coherence=True)
        exo_das.update(coherence=True)
    else:
        exo.update(coherence=False)
        exo_das.update(coherence=False)
                
        
   
    select_matricule = "SELECT Matricule FROM abnlbulletin WHERE (annee_bul = "+ str(year) +" and mois_bul <= " + str(month) +") group by Matricule;"
    matricules = execute_read_query(connection, select_matricule)
        
    if matricules == []:
        pass
    else:
        
        dasmatriculedetail_das = DASMatriculeDetail.objects.filter(das_id=das.id)
        dasmatriculeexo_das = DASMatriculeExo.objects.filter(das_id=das.id)
        dasmatriculefipp_das = DASMatriculeFIPP.objects.filter(das_id=das.id)
        dasmatriculecss_das = DASMatriculeCSS.objects.filter(das_id=das.id)

        for m in matricules:                
        # catégorie : Permanent Exo
            a_dict = {1: True, 2: False, 3: True, 4:False}
            for key in a_dict:
                imposable_ir = a_dict[key]
                categorie=key
                categorie_sql = "SELECT Matricule, Categorie FROM abnbulletin WHERE Matricule = '"+str(m[0])+"'  and Categorie="+str(categorie)+"  and annee_bul = "+ str(year) +" and mois_bul <= "+ str(month) +" group by Matricule;"
                categorie_con = execute_read_query(connection, categorie_sql)
                if categorie_con==[] or categorie_con==None:
                    pass
                else:     
                    sbase_sql="SELECT Sum(Gain_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 102 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    sbase_con = execute_read_query(connection, sbase_sql)
                    if sbase_con == [] or (sbase_con[0])[0] == None:
                        sbase=0
                    else:
                        sbase=(sbase_con[0])[0]
                    
                    sbg_sql="SELECT Sum(Base_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 598 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    sbg_con = execute_read_query(connection, sbg_sql)
                    if sbg_con == [] or (sbg_con[0])[0] == None:
                        sbg=0
                    else:
                        sbg=(sbg_con[0])[0]

                    exonere_sql="SELECT Sum(Gain_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and ((CodeRubrique_result BETWEEN 360 AND 379) Or (CodeRubrique_result BETWEEN 501 AND 597)) and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    exonere_con = execute_read_query(connection, exonere_sql)
                    if exonere_con == [] or (exonere_con[0])[0] == None:
                        exonere=0
                    else:
                        exonere=(exonere_con[0])[0]
                        
                    sbi_sql="SELECT Sum(Base_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 400 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    sbi_con = execute_read_query(connection, sbi_sql)
                    if sbi_con == [] or (sbi_con[0])[0] == None:
                        sbi=0
                    else:
                        sbi=(sbi_con[0])[0]
                    
                    fp_sql="SELECT Sum(Base_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 489 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    fp_con = execute_read_query(connection, fp_sql)
                    if fp_con == [] or (fp_con[0])[0] == None:
                        fp=0
                    else:
                        fp=(fp_con[0])[0]

                    taux_fp_sql = "SELECT TauxFP FROM abnbulletin WHERE Matricule = '"+str(m[0])+"'  and Categorie="+str(categorie)+"  and annee_bul = "+ str(year) +" and mois_bul <= "+ str(month) +" group by Matricule;"
                    taux_fp_con = execute_read_query(connection, taux_fp_sql)
                    if taux_fp_con == [] or (taux_fp_con[0])[0] == None:
                        taux_fp=0
                    else:
                        taux_fp=(taux_fp_con[0])[0]

                    retenues_sql="SELECT sum(abnlbulletin.Retenue_result) as Valeur, abnrubrique.Code_FIPP, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul INNER JOIN abnrubrique ON abnlbulletin.CodeRubrique_result = abnrubrique.CodeRubrique WHERE abnrubrique.Code_FIPP <> 'E' And abnbulletin.Categorie="+str(categorie)+" And abnlbulletin.Matricule = '"+str(m[0])+"' and (CodeRubrique_result BETWEEN 401 AND 469) and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    retenues_con = execute_read_query(connection, retenues_sql)
                    if retenues_con == [] or (retenues_con[0])[0] == None:
                        retenues=0
                    else:
                        retenues=(retenues_con[0])[0]
                        
                    sbi_sql="SELECT Sum(Base_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 400 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    logneco_sql = "SELECT Sum(Base_result) as SBG FROM abnlbulletin WHERE Matricule = '"+str(m[0])+"' and CodeRubrique_result = 470 and annee_bul = "+ str(year) +" and mois_bul <= " + str(month) +" group by Matricule;"
                    logneco_con = execute_read_query(connection, logneco_sql)
                    if logneco_con == [] or (logneco_con[0])[0] == None:
                        logneco=0
                    else:
                        logneco=(logneco_con[0])[0]

                    logeco_sql="SELECT Sum(Base_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 471 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    logeco_con = execute_read_query(connection, logeco_sql)
                    if logeco_con == [] or (logeco_con[0])[0] == None:
                        logeco=0
                    else:
                        logeco=(logeco_con[0])[0]
                        
                    retcomp_sql="SELECT Sum(Base_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 472 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    retcomp_con = execute_read_query(connection, retcomp_sql)
                    if retcomp_con == [] or (retcomp_con[0])[0] == None:
                        retcomp=0
                    else:
                        retcomp=(retcomp_con[0])[0]
                        
                    deduction_sql = "SELECT NbreDeductions FROM abnfipp WHERE Matricule = '"+str(m[0])+"' group by Matricule;"
                    deduction_con = execute_read_query(connection, deduction_sql)
                    if deduction_con == [] or (deduction_con[0])[0] == None:
                        deduction=0
                    else:
                        deduction=(deduction_con[0])[0]
                        
                    njt_sql="SELECT Sum(Taux_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 100 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    njt_con = execute_read_query(connection, njt_sql)
                    if njt_con == [] or (njt_con[0])[0] == None:
                        njt=0
                    else:
                        njt=(njt_con[0])[0] 
                            
                    taux_fixe_ir_sql = "SELECT abncategoriepaie.ir, abncategoriepaie.TauxFP, abncategoriepaie.IR_Tauxfixe, abnfipp.Matricule FROM abnfipp LEFT JOIN abncategoriepaie ON abnfipp.Code_categorie = abncategoriepaie.Code WHERE abnfipp.Matricule = '"+str(m[0])+"'  group by Matricule;"
                    taux_fixe_ir_con = execute_read_query(connection, taux_fixe_ir_sql)
                    if taux_fixe_ir_con == [] or (taux_fixe_ir_con[0])[2] == None:
                        taux_fixe_ir=0
                    else:
                        taux_fixe_ir=(taux_fixe_ir_con[0])[2]
                    
                    ir_sql="SELECT Sum(Retenue_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 490 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    ir_con = execute_read_query(connection, ir_sql)
                    if ir_con == [] or (ir_con[0])[0] == None:
                        ir=0
                    else:
                        ir=(ir_con[0])[0]
                        # Frais pro----------
                    fp_c = sbi * taux_fp/100
                    fp_p = 30000 * njt/312
                    if fp_c > fp_p:
                        fp_c = fp_p
                    sni = float(sbg)-float(exonere)-float(retenues)-float(fp_c)
                    
                    logneco_p=sni*10/100
                    logneco_c=logneco
                    if logneco_c > logneco_p:
                        logneco_c= logneco_p
                    retcomp_p=sni*50/100
                    retcomp_c=retcomp
                    if retcomp_c > retcomp_p:
                        retcomp_c= retcomp_p               
                    if njt == 0 or njt==None or sni < 0:
                        sni=0
                    else:
                        sni = (float(sni) -float(logeco) -float(logneco_c) - float(retcomp_c))*312/float(njt)
                    bareme = BaremeImpot.objects.filter(impot=1, plancher__lte=sni, plafond__gte=sni)
                    if taux_fixe_ir==0:
                        if bareme == [] or sni < 0 or imposable_ir == False:
                            ir_reconstitue=0
                        else:
                            ir_reconstitue = float((sni * bareme[0].taux - bareme[0].montant_a_deduire)- 360 * deduction)*float(njt)/312
                    else:
                        ir_reconstitue = float(sbi) * float(taux_fixe_ir)
                    if ir_reconstitue < 0:
                        ir_reconstitue=0

                    if float(ir)-float(ir_reconstitue) > -1 and float(ir)-float(ir_reconstitue) < 100:
                        coherence = True
                    else:
                        coherence = False

                    data_matdetail = dasmatriculedetail_das.filter(matricule=m[0], categorie=categorie).filter(auto_genre = True)
                    if data_matdetail.exists():
                        data_matdetail.update(sbg=sbg, exonere=exonere, sbi=sbi, fp=fp, taux_fp=taux_fp, retenues=retenues, logneco=logneco, logeco=logeco, retcomp=retcomp, deduction=deduction, njt=njt, imposable_ir=imposable_ir, taux_fixe_ir=taux_fixe_ir,   ir=ir, ir_reconstitue=ir_reconstitue, categorie=categorie, coherence=coherence, auto_genre=True)
                    else:
                        DASMatriculeDetail.objects.create(das_id=das.id, matricule=m[0], sbg=sbg, exonere=exonere, sbi=sbi, fp=fp, taux_fp=taux_fp, retenues=retenues, logneco=logneco, logeco=logeco, retcomp=retcomp, deduction=deduction, njt=njt, imposable_ir=imposable_ir, taux_fixe_ir=taux_fixe_ir,   ir=ir, ir_reconstitue=ir_reconstitue,categorie=categorie,  coherence=coherence, auto_genre=True)        

                    #CSS----------CSS--------
                    if njt == 0 or njt==None or sni < 0:
                        sni=0
                    else:
                        sni=(float(sbg)-float(exonere)-float(retenues)-float(fp_c))/float(njt)*312
                    bareme = BaremeImpot.objects.filter(impot=1, plancher__lte=sni, plafond__gte=sni)
                    if taux_fixe_ir==0:
                        if bareme == [] or sni < 0 or imposable_ir == False:
                            ir_reconstitue=0
                        else:
                            ir_reconstitue = float((sni * bareme[0].taux - bareme[0].montant_a_deduire)- 360 * deduction)*float(njt)/312
                    else:
                        ir_reconstitue = float(sbi) * float(taux_fixe_ir)
                    if ir_reconstitue < 0:
                        ir_reconstitue=0
                    
                    amount_base=float(sbg)-float(retenues)-float(ir_reconstitue)
       
                    css_sql="SELECT Sum(Retenue_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 669 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    css_con = execute_read_query(connection, css_sql)
                    if css_con == [] or (css_con[0])[0] == None:
                        css=0
                    else:
                        css=(css_con[0])[0]

                    css_regul_sql="SELECT Sum(Gain_result) as Valeur, abnbulletin.Categorie, abnbulletin.Matriculeannee_bulmois_bulperiode_bul  FROM abnlbulletin INNER JOIN abnbulletin ON abnbulletin.Matriculeannee_bulmois_bulperiode_bul=abnlbulletin.Matriculeannee_bulmois_bulperiode_bul WHERE abnlbulletin.Matricule = '"+str(m[0])+"' and abnbulletin.Categorie="+str(categorie)+" and CodeRubrique_result = 668 and abnlbulletin.annee_bul = "+ str(year) +" and abnlbulletin.mois_bul <= "+ str(month) +" group by abnlbulletin.Matricule;"
                    css_regul_con = execute_read_query(connection, css_regul_sql)
                    if css_regul_con == [] or (css_regul_con[0])[0] == None:
                        css_regul=0
                    else:
                        css_regul=(css_regul_con[0])[0]

                    if amount_base >= 240000:
                        amount_theo=amount_base*1.5/100
                    else:
                        amount_theo=0
                    ecart = float(css)-float(css_regul)-float(amount_theo)
                    if ecart> -1 and ecart < 10:
                        coherence = True
                        comment="OK CSS"
                    else:
                        coherence = False
                        if ecart > 0:
                            comment="CSS à restituer : "+str(ecart)
                        else:
                            comment="Complément CSS à verser : "+str(ecart)

                    data_matcss = dasmatriculecss_das.filter(matricule=m[0], categorie=categorie).filter(auto_genre = True)
                    if data_matcss.exists():
                        data_matcss.update(css=css, css_regul=css_regul, amount_base=amount_base, amount_theo=amount_theo, ecart=ecart, categorie=categorie, coherence=coherence, comment=comment, auto_genre=True)
                    else:
                        DASMatriculeCSS.objects.create(das_id=das.id, matricule=m[0], css=css,amount_base=amount_base, amount_theo=amount_theo, ecart=ecart,  categorie=categorie, comment=comment, coherence=coherence, auto_genre=True)        



        # exonération par matirucle----------------
            exo_detail_sql = "SELECT sum(Gain_result) as Valeur, CodeRubrique_result, Matricule, abnrubrique.NatureRub  FROM abnlbulletin INNER JOIN abnrubrique ON abnlbulletin.CodeRubrique_result = abnrubrique.CodeRubrique WHERE ((CodeRubrique_result BETWEEN 360 AND 379) Or (CodeRubrique_result BETWEEN 501 AND 597)) and Matricule = '"+str(m[0])+"' and annee_bul = "+ str(year) +" and mois_bul <= " + str(month) +" group by CodeRubrique_result;"
            exo_detail_con = execute_read_query(connection, exo_detail_sql)
            
            for i in exo_detail_con:
                if exo_detail_con == [] or (exo_detail_con[0])[0] == None:
                    amount=0
                else:
                    amount=i[0]
                if len(i[3])>15 :
                    code_rubrique=None
                else:
                    code_rubrique=i[3]
                        
                data_exodetail = dasmatriculeexo_das.filter(matricule=m[0]).filter(auto_genre = True)
                if data_exodetail.exists():
                    data_exodetail.update(code_rubrique=code_rubrique, amount=amount, auto_genre=True)
                else:
                    DASMatriculeExo.objects.create(das_id=das.id, matricule=m[0], code_rubrique=code_rubrique, amount=amount, auto_genre=True)        

            
            data_exodetail = dasmatriculeexo_das.filter(matricule=m[0]).filter(auto_genre = True)
            for exo in data_exodetail:
                exo_mod = DASEXOModel.objects.filter(code_rubrique=str(exo.code_rubrique))
                if len(exo_mod) == 0:
                    data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=False, comment='Rubrique non renseignée ou valide !')
                else:
                    if exo_mod[0].type==0 and exo_mod[0].periodicite==0 and float(njt)>0:
                        if exo_mod[0].value * 12/float(njt)+0.1 >= exo.amount/float(njt):
                            data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=True, comment='OK : plafond de '+ str(exo_mod[0].value) + ' mensuel non dépassé')
                        else:
                            data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=False, comment='Dépassement du plafond de '+ str(exo_mod[0].value) + ' !')

                    elif exo_mod[0].type==2 and exo_mod[0].periodicite==0 and float(njt)>0:
                        if exo_mod[0].base_rubrique == 'SBI':
                            plafond = float(sbi)
                        elif exo_mod[0].base_rubrique == 'SB':
                            plafond = float(sbase)
                        if exo_mod[0].value * 12/float(njt) >= plafond*float(exo_mod[0].taux)/float(njt):
                            plafond_2=exo_mod[0].value * 12/float(njt)
                        else:
                            plafond_2=plafond*float(exo_mod[0].taux)/float(njt)
                        if plafond_2+0.1 >=exo.amount/float(njt):
                            data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=True, comment='OK : plafond de '+ str(exo_mod[0].value) + ' mensuel non dépassé')
                        else:
                            data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=False, comment='Dépassement du plafond de '+ str(exo_mod[0].value) + ' !')

                    elif exo_mod[0].type==3 and exo_mod[0].periodicite==0:
                        if exo_mod[0].base_rubrique == 'SBI':
                            plafond = float(sbi)
                        elif exo_mod[0].base_rubrique == 'SB':
                            plafond = float(sbase)
                        if plafond*float(exo_mod[0].taux)+0.1 >= exo.amount:
                            data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=True, comment='OK : plafond de '+ str(exo_mod[0].taux * 100) + 'pc mensuel non dépassé /'+str(plafond))
                        else:
                            data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=False, comment='Dépassement du plafond de '+ str(exo_mod[0].taux * 100) + 'pc de : '+str(plafond))

                    elif exo_mod[0].type==1 and exo_mod[0].periodicite==1:
                        if exo_mod[0].value+0.1 >= exo.amount:
                            data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=True, comment='OK : plafond de '+ str(exo_mod[0].value) + ' annuel non dépassé')
                        else:
                            data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=False, comment='Dépassement du plafond de '+ str(exo_mod[0].value) + ' !')

                    else :
                        data_exodetail.filter(code_rubrique=str(exo.code_rubrique)).update(coherence=True, comment='!!! A justifier manuellement  : plafond de '+ str(exo_mod[0].name_rubrique))
            

            fipp_detail_sql="SELECT Matricule, Nom_Fipp,Prenom_Fipp, Adresse, Ville, CIN, DateNaissance, Sexe, Nationnalite, SituationFam, NbreDeductions, NumAffilCNSS, TauxFP FROM abnfipp WHERE Matricule = '"+str(m[0])+"';"
            fipp_detail_con = execute_read_query(connection, fipp_detail_sql)
            
            if len(fipp_detail_con)==0 :
                pass
            else:
                l=12
                for i in fipp_detail_con:
                    y = 0
                    manque=0
                    while y<=l:
                        if i[y] == [] or i[y] == "":
                            manque=manque+1
                        y+=1
                        if manque>0:
                            coherence=False
                        else:
                            coherence=True
                                                
                    if i[6]==None:
                        datenaissance = None
                    else:
                        datenaissance = datetime.datetime.strptime(str(i[6]),'%Y-%m-%d')
                    data_fippdetail = dasmatriculefipp_das.filter(matricule=m[0]).filter(auto_genre = True)
                    try:
                        if data_fippdetail.exists():
                            data_fippdetail.update(matricule = i[0], nom = i[1], prenom = i[2], adresse = i[3], ville = i[4], cin = i[5], datenaissance = datenaissance,  sexe = i[7],situationfam = i[9],deduction= i[10],cnss = i[11],tauxfp = i[12], coherence=coherence, auto_genre=True)
                        else:
                            DASMatriculeFIPP.objects.create(das_id=das.id,matricule = i[0], nom = i[1], prenom = i[2], adresse = i[3], ville = i[4], cin = i[5],datenaissance = datenaissance,  sexe = i[7], situationfam = i[9],deduction= i[10],cnss = i[11],tauxfp = i[12], coherence=coherence, auto_genre=True)        
                    except ValueError:
                        if data_fippdetail.exists():
                            data_fippdetail.update(matricule = i[0],nom = i[1], prenom = i[2], adresse = i[3], ville = i[4], cin = i[5], datenaissance = datenaissance, situationfam = i[9],deduction= i[10],cnss = i[11],tauxfp = i[12], coherence=coherence, auto_genre=True)
                        else:
                            DASMatriculeFIPP.objects.create(das_id=das.id,matricule = i[0], nom = i[1], prenom = i[2], adresse = i[3], ville = i[4], cin = i[5], datenaissance = datenaissance,  situationfam = i[9],deduction= i[10],cnss = i[11],tauxfp = i[12], coherence=coherence, auto_genre=True)


            
    # validation DAS---------------------
    incoh = dasdetail_das.filter(dasmodel_id__in=['REM_PER', 'IRV','EXO_DAS'] , coherence=False)
    incohmat=  DASMatriculeDetail.objects.filter(das_id=das.id, coherence=False)
    incohexo = DASMatriculeExo.objects.filter(das_id=das.id, coherence=False)
    incohfipp = DASMatriculeFIPP.objects.filter(das_id=das.id, coherence=False)
    if incoh.exists() or incohexo.exists() or incohmat.exists() or incohfipp.exists() :
        DAS.objects.filter(id=das.id).update(statut=1)
    else:
        DAS.objects.filter(id=das.id).update(statut=2)
    

class UpdateDASView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/das_update.html'
    form_class = DASCollForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        dasdetails = das.dasdetail_set.all().order_by('ordre')
        dasdetails0 = dasdetails.filter(dasmodel__type=0)
        dasdetails0S = dasdetails0.aggregate(sum = Sum('amount'))
        dasdetails1 = dasdetails.filter(dasmodel__type=1)
        dasdetails2 = dasdetails.filter(dasmodel__type=2)
        dasdetails3 = dasdetails.filter(dasmodel__type=3)
        exercice = das.exercice.id
        user = request.user.profile
        if das is not None:
            form = self.form_class(instance=das)
            class Statut_R(models.IntegerChoices):
                InProcess = (0,'En Cours')
                Done = (1,'Traitée')
                InChecked = (3,'Non-validée')
                NonApplicable = (4,'Non Applicable')
            class Statut_V(models.IntegerChoices):
                InProcess = (0,'En Cours')
                Done = (1,'Traitée')
                Checked = (2,'Validée')
                InChecked = (3,'Non-validée')
                NonApplicable = (4,'Non Applicable')

            is_resp = Portefolio.objects.filter(user=user, lettremission_id=das.lettremission_id).exists()
            is_manager = Manager.objects.filter(user=user, lettremission_id=das.lettremission_id).exists()

            if das.statut == 2 or (is_resp == True and is_manager == True) or request.user.is_staff == True:
                pass
            elif is_resp==True :
                form.fields['statut'].choices =Statut_R.choices
            elif is_manager==True :
                form.fields['statut'].choices =Statut_V.choices
                        
        context = {'exercice': exercice,'das': das, 'dasdetails0': dasdetails0, 'dasdetails1': dasdetails1,'dasdetails2': dasdetails2, 'dasdetails3': dasdetails3, 'dasdetails0S':dasdetails0S,
                   'form': form, 'is_manager':is_manager}           
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        exercice = das.exercice.id
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=das.lettremission_id).exists()
        if das is not None:
            form = self.form_class(request.POST, request.FILES, instance=das)
            #form = self.form_class(request.POST, instance=das)
            if form.is_valid():
                form.save()               
                if is_manager == True:
                    return redirect('/exercice_das_manager/'+str(das.exercice.id)+'/')                               
                else:
                    return redirect('/ldm_das/'+str(das.lettremission.id)+'/')                               
        context = {'exercice': exercice, 'das': das, 'form': form}
        return render(request, self.template_name, context)
            
class UpdateDASDataView(LoginRequiredMixin, UserAccessMixin, ExerciceObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/exercice_detail_das.html'
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
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user).exists()
        dass = []
        dass=DAS.objects.filter(exercice=obj).filter(lettremission__manager__user=user).exclude(supervised=True)
        for das in dass:
            datadas(das=das, obj=das.exercice, *args, **kwargs)
        if is_manager==True:
            return redirect('/exercice_das_manager/'+str(pk)+'/')
        else:
            return redirect('/exercice_das/'+str(pk)+'/')

class UpdateDASDataAttenteView(LoginRequiredMixin, UserAccessMixin, ExerciceObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/exercice_detail_das.html'
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
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user).exists()
        dass = []
        dass=DAS.objects.filter(exercice=obj, statut=0).filter(lettremission__manager__user=user).exclude(supervised=True)
        for das in dass:
            datadas(das=das, obj=das.exercice, *args, **kwargs)
        if is_manager==True:
            return redirect('/exercice_das_manager/'+str(pk)+'/')
        else:
            return redirect('/exercice_das/'+str(pk)+'/')

class UpdateDataDASView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/das_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        if das is not None:
            context = {'das': das}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        exercice = das.exercice
        if das is not None:
            datadas(das=das, obj=das.exercice, *args, **kwargs)
            return redirect('/update_dasdetail/'+str(das.pk)+'/')
                
        context = {'das': das}
        return render(request, self.template_name, context)


class UpdateDataDASMatriculeView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/das_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)

        if das is not None:
            context = {'das': das}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        exercice = das.exercice
        if das is not None:
            datadas(das=das, obj=das.exercice, *args, **kwargs)
            return redirect('/update_dasmatriculedetail/'+str(das.pk)+'/')
                
        context = {'das': das}
        return render(request, self.template_name, context)


class UpdateDataDASExoView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/das_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)

        if das is not None:
            context = {'das': das}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        exercice = das.exercice
        if das is not None:
            datadas(das=das, obj=das.exercice, *args, **kwargs)
            return redirect('/update_dasexodetail/'+str(das.pk)+'/')
                
        context = {'das': das}
        return render(request, self.template_name, context)

class UpdateDataDASCSSView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/das_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)

        if das is not None:
            context = {'das': das}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        exercice = das.exercice
        if das is not None:
            datadas(das=das, obj=das.exercice, *args, **kwargs)
            return redirect('/update_dascssdetail/'+str(das.pk)+'/')
                
        context = {'das': das}
        return render(request, self.template_name, context)
class UpdateDataDASFIPPView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_situation'
    template_name = 'tasks/das_update_coll.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)

        if das is not None:
            context = {'das': das}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        das = DAS.objects.get(pk=pk)
        exercice = das.exercice
        if das is not None:
            datadas(das=das, obj=das.exercice, *args, **kwargs)
            return redirect('/update_dasfippdetail/'+str(das.pk)+'/')
                
        context = {'das': das}
        return render(request, self.template_name, context)
    
class UpdateDASDetailView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/das_update_dasdetail.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}       
        das = DAS.objects.get(pk=pk)
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=das.lettremission_id).exists()
        dasdetails = das.dasdetail_set.all().order_by('ordre')
        dasdetails0 = dasdetails.filter(dasmodel__type=0)
        dasdetails0S = dasdetails0.aggregate(sum = Sum('amount'))
        dasdetails1 = dasdetails.filter(dasmodel__type=1)
        dasdetails2 = dasdetails.filter(dasmodel__type=2)
        dasdetails3 = dasdetails.filter(dasmodel__type=3, dasmodel__code_rubrique='EXO_DAS')
        dasdetails_no_ir = DASMatriculeDetail.objects.filter(das=das, imposable_ir=False).count()
        exercice = das.exercice.id
        if das is not None:
            context = {'is_manager':is_manager,'exercice': exercice,'das': das,'dasdetails_no_ir':dasdetails_no_ir, 'dasdetails0': dasdetails0, 'dasdetails1': dasdetails1,'dasdetails2': dasdetails2, 'dasdetails3': dasdetails3, 'dasdetails0S':dasdetails0S}
        return render(request, self.template_name, context)
    
class ExerciceDASView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    context_object_name = 'exerciceListDAS'
    template_name = 'tasks/exercice_list_das.html'
    
    def get(self, request):
        context = {}
        exercices = Exercice.objects.all().order_by('exercice')
        context = {'exercices': exercices}
        return render(request, self.template_name , context)
    

class UpdateDASMatriculeDetailView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/das_update_dasmatriculedetail.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        
        das = DAS.objects.get(pk=pk)
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=das.lettremission_id).exists()
        dasmatriculedetails = das.dasmatriculedetail_set.all().order_by('categorie','matricule')

        exercice = das.exercice.id
        if das is not None:
            context = {'is_manager':is_manager, 'exercice': exercice,'das': das, 'dasmatriculedetails':dasmatriculedetails}
        return render(request, self.template_name, context)

class UpdateDASExoDetailView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/das_update_dasexodetail.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        
        das = DAS.objects.get(pk=pk)
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=das.lettremission_id).exists()
        dasexodetails = das.dasmatriculeexo_set.all().order_by('matricule')

        exercice = das.exercice.id
        if das is not None:
            context = {'is_manager':is_manager, 'exercice': exercice,'das': das, 'dasexodetails':dasexodetails}
        return render(request, self.template_name, context)    

class UpdateDASCSSDetailView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/das_update_dascssdetail.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        
        das = DAS.objects.get(pk=pk)
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=das.lettremission_id).exists()
        dascssdetails = das.dasmatriculecss_set.all().order_by('matricule')

        exercice = das.exercice.id
        if das is not None:
            context = {'is_manager':is_manager, 'exercice': exercice,'das': das, 'dascssdetails':dascssdetails}
        return render(request, self.template_name, context)    

class UpdateDASFIPPDetailView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/das_update_dasfippdetail.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        
        das = DAS.objects.get(pk=pk)
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user, lettremission_id=das.lettremission_id).exists()
        dasfippdetails = das.dasmatriculefipp_set.all().order_by('matricule')

        exercice = das.exercice.id
        if das is not None:
            context = {'is_manager':is_manager, 'exercice': exercice,'das': das, 'dasfippdetails':dasfippdetails}
        return render(request, self.template_name, context)    

class ExerciceDASView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    context_object_name = 'exerciceListDAS'
    template_name = 'tasks/exercice_list_das.html'
    
    def get(self, request):
        context = {}
        exercices = Exercice.objects.all().order_by('exercice')
        context = {'exercices': exercices}
        return render(request, self.template_name , context)

class ExerciceDASDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    
    model = Exercice
    context_object_name = 'exerciceDASDetail'
    template_name = 'tasks/exercice_detail_das.html'
    form_class = ExerciceForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        result = {}
        obj = self.get_object()
        dass = obj.das_set.all().order_by('lettremission__company__name')
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'result':result,
                       'exercice': obj, 'form': form,
                       'dass': dass}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        dass = obj.das_set.all()
        lettremissions=LettreMission.objects.filter(das__exercice=obj)
        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/exercices/')
            context = {'lettremissions':lettremissions, 'exercice': obj, 'form': form,
                   'dass': dass}
        return render(request, self.template_name, context)
    
    def comments_count(self):
        #Your filter criteria can go here. 
        return self.comments_set.count()


class ExerciceDASDetailManagerView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    
    model = Exercice
    context_object_name = 'exerciceDASDetailManager'
    template_name = 'tasks/exercice_detail_das_manager.html'
    form_class = ExerciceForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        user = request.user.profile
        dass = DAS.objects.filter(lettremission__manager__user=user, exercice=obj).order_by('lettremission__company__name')
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'exercice': obj, 'form': form,
                       'dass': dass}
        return render(request, self.template_name, context)    

class InsertDASView(LoginRequiredMixin, UserAccessMixin, ExerciceObjectMixin, View):
    raise_exception = True
    permission_required = 'tasks.change_exercice'
    template_name = 'tasks/exercice_detail_das.html'
    form_class = DASForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()                   
        context = {'exercice': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        year=obj.exercice
        user = request.user.profile
        is_manager = Manager.objects.filter(user=user).exists()
        if obj.intermediate == True:
            month=obj.month
        else:
            month = 12
        pk = obj.pk
       
        lettremissions_compta=LettreMission.objects.filter(company__statut=1).filter(manager__user=user).exclude(company__legal_form_id__in=[12]) 

        for lm in lettremissions_compta: 
            date_o = datetime.date(year=int(year), month=1, day=1)
            create_date = lm.company.create_date
            date_c = last_day_of_month(datetime.date(year=int(year), month=month, day=1))
            if create_date == None:
                date_o =date_o
            elif create_date < date_c:
                if date_o > create_date:
                    date_o =date_o
                else:
                    date_o =  create_date
                                    
                das_exit = DAS.objects.filter(exercice_id = pk).filter(lettremission_id=lm.id).filter(supervised=False)
                if das_exit.exists():
                    das_exit.update(date_start=date_o, date_closing = date_c,  date_declaration =date_c+relativedelta(months=2), month=month)
                else:
                    DAS.objects.create(exercice_id = pk, lettremission_id=lm.id, date_start=date_o, date_closing=date_c, date_declaration=date_c+relativedelta(months=2), month=month, statut=0, supervised=False)
        if is_manager==True:
            return redirect('/exercice_das_manager/'+str(pk)+'/')
        else:
            return redirect('/exercice_das/'+str(pk)+'/')