# customers/views.py

import datetime
from ordres.models import LettreMission, LettreMissionLink
from mysql.connector import errors
from accounts.views import UserAccessMixin
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, DetailView, CreateView, DeleteView
from django.shortcuts import render, redirect, get_object_or_404
from django.views import View
from .models import BlackList, Company, CompanyTemps, Contact, Office, Person, Prospect, Representative, RepresentativeCompany, RepresentativeLink, Shareholder, ShareholderCompany, ShareholderLink, BankAcount
from .forms import BankAcountForm, CompanyForm, ContactForm, LettreMissionLinkForm, OfficeForm, PersonForm, ProspectForm, RepresentativeForm, RepresentativeLinkForm, ShareholderCompanyForm, ShareholderForm, RepresentativeCompanyForm, ShareholderLinkForm
from django.shortcuts import render
from config.mysqlconn import create_connection, execute_read_query

#connection = create_connection("192.168.1.101", "mysql.connexion", "----------", "010vs")
# def execute_read_query(connection, query):
#     cursor = connection.cursor()
#     result = None
#     try:
#         cursor.execute(query)
#         result = cursor.fetchall()
#         return result
#     except errors as e:
#         print(f"The error '{e}' occurred")


class IntegrationDataView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'       
    context_object_name = 'integrationData'
    template_name = 'customers/integration_data.html'
    
    def get(self, request):
        context = {}
        return render(request, self.template_name , context)


class PersonListView(LoginRequiredMixin, UserAccessMixin, ListView):
    raise_exception = True
    permission_required = 'customers.change_person'        
    model = Person
    context_object_name = 'personList'
    template_name = 'customers/person_list.html'   

class PersonObjectMixin(object):
    model = Person
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj

    
class PersonDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'customers.change_person'
    
    model = Person
    context_object_name = 'personDetail'
    template_name = 'customers/person_detail.html'
    form_class = PersonForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        shareholders = obj.shareholder_set.all()
        #shareholderpersons = obj.shareholderperson_set.all()
        representatives = obj.representative_set.all()
        #representativelinks = obj.representativelink.pk
        
        if obj is not None:
            form = self.form_class(instance=obj)
            
            #select_datas = "SELECT Matricule, Nom_Fipp FROM abnfipp WHERE Matricule='000476'"
            #datas = execute_read_query(connection, select_datas)
            
            context = { #'datas': datas,
                       'person': obj,
                       'form': form, 'representatives':representatives,
                       'shareholders': shareholders}
        return render(request, self.template_name, context)


    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        shareholders = obj.shareholder_set.all()
        #shareholderpersons = obj.shareholderperson_set.all()
        representatives = obj.representative_set.all()
        #representativelinks = obj.representativelink_set.all()

        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/persons/')
        context = {'person': obj, 'form': form,
                   'shareholders': shareholders, 'representatives':representatives}
        return render(request, self.template_name, context)
    
    
class PersonCreateView(LoginRequiredMixin, UserAccessMixin, CreateView):
    raise_exception = True
    permission_required = 'customers.change_person'
     
    model = Person
    context_object_name = 'personCreate'
    template_name = 'customers/person_create.html'
    fields = '__all__'


class PersonDeleteView(LoginRequiredMixin, UserAccessMixin, DeleteView):
    raise_exception = True
    permission_required = 'customers.change_person'
    
    model = Person
    context_object_name = 'personDelete'
    template_name = 'customers/person_delete.html'
    raise_exception = True
    permission_required = 'customers.change_person'
    
    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            context = {'person': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            obj.delete()
            return redirect('/persons/')
        context = {'person': obj}
        return render(request, self.template_name, context)

class PersonView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_person'
    context_object_name = 'personList'
    template_name = 'customers/person_list.html'
    
    def get(self, request):
        context = {}
        persons = Person.objects.all().order_by('last_name')

        context = {'persons': persons}
        return render(request, self.template_name , context)


class CompanyListView(LoginRequiredMixin, UserAccessMixin, ListView):
    raise_exception = True
    permission_required = 'customers.change_company'
        
    model = Company
    context_object_name = 'companyList'
    template_name = 'customers/company_list.html'   

class CompanyObjectMixin(object):
    model = Company
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj

    
class CompanyDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'customers.change_company'
    
    model = Company
    context_object_name = 'companyDetail'
    template_name = 'customers/company_detail.html'
    form_class = CompanyForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        shareholders = obj.shareholder_set.all()
        bankacounts = obj.bankacount_set.all()
        representatives = obj.representative_set.all()
        
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'company': obj, 'form': form, 'representatives':representatives,'bankacounts':bankacounts,
                       'shareholders': shareholders}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        shareholders = obj.shareholder_set.all()
        bankacounts = obj.bankacount_set.all()
        representatives = obj.representative_set.all()

        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/companies/')
        context = {'company': obj, 'form': form,'bankacounts':bankacounts,
                   'shareholders': shareholders, 'representatives':representatives}
        return render(request, self.template_name, context)
    
    
class CompanyCreateView(LoginRequiredMixin, UserAccessMixin, CreateView):
    raise_exception = True
    permission_required = 'customers.change_company'
     
    model = Company
    context_object_name = 'companyCreate'
    template_name = 'customers/company_create.html'
    fields = '__all__'


class CompanyDeleteView(LoginRequiredMixin, UserAccessMixin, DeleteView):
    raise_exception = True
    permission_required = 'customers.change_company'
    
    model = Company
    context_object_name = 'companyDelete'
    template_name = 'customers/company_delete.html'
    
    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            context = {'company': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            obj.delete()
            return redirect('/companies/')
        context = {'company': obj}
        return render(request, self.template_name, context)

class CompanyView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    context_object_name = 'companyList'
    template_name = 'customers/company_list.html'
    
    def get(self, request):
        context = {}
        customers = Company.objects.all().order_by('name')
        total_clients = customers.count()
        total_customers = customers.count()
        inapproval = customers.filter(statut=0).count()
        inprocess = customers.filter(statut=1).count()
        terminate = customers.filter(statut=2).count()
        canceled = customers.filter(statut=3).count()
        invoiced = customers.filter(statut=4).count()

        context = {'customers': customers, 'customers': customers, 'total_clients': total_clients, 'total_customers': total_customers,
                   'inapproval': inapproval, 'inprocess': inprocess, 'terminate': terminate, 'canceled': canceled, 'invoiced': invoiced
                   }
        return render(request, self.template_name , context)


class CreateBankAcountView(LoginRequiredMixin, UserAccessMixin, CompanyObjectMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = BankAcountForm
    template_name = 'customers/bankacount.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'company': obj, 'form': form}
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
                new_item.company = obj
                new_item.save()
                return redirect('/company/'+str(pk)+'/')

        context = {'company': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateBankAcountView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = BankAcountForm
    template_name = 'customers/bankacount_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        bankacount = BankAcount.objects.get(pk=pk)
        company = bankacount.company.id
        if bankacount is not None:
            form = self.form_class(instance=bankacount)
            context = {'company': company,'bankacount': bankacount, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        bankacount = BankAcount.objects.get(pk=pk)
        company = bankacount.company.id
        if bankacount is not None:
            form = self.form_class(request.POST, request.FILES, instance=bankacount)
            if form.is_valid():
                form.save()
                return redirect('/company/'+str(company)+'/')
                
        context = {'company': company, 'bankacount': bankacount, 'form': form}
        return render(request, self.template_name, context)


class DeleteBankAcountView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/bankacount_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        bankacount = BankAcount.objects.get(pk=pk)
        company = bankacount.company.id
        if bankacount is not None:
            context = {'bankacount': bankacount, 'company': company}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholder = BankAcount.objects.get(pk=pk)
        company = shareholder.company.id
        if shareholder is not None:
            shareholder.delete()
            return redirect('/company/'+str(company)+'/')
            
        context = {'shareholder': shareholder, 'company': company}
        return render(request, self.template_name, context)  

class CreateShareholderView(LoginRequiredMixin, UserAccessMixin, CompanyObjectMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = ShareholderForm
    template_name = 'customers/shareholder.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'company': obj, 'form': form}
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
                new_item.company = obj
                new_item.save()
                return redirect('/company/'+str(pk)+'/')

        context = {'company': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateShareholderView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = ShareholderForm
    template_name = 'customers/shareholder_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholder = Shareholder.objects.get(pk=pk)
        company = shareholder.company.id
        if shareholder is not None:
            form = self.form_class(instance=shareholder)
            context = {'company': company,'shareholder': shareholder, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholder = Shareholder.objects.get(pk=pk)
        company = shareholder.company.id
        if shareholder is not None:
            form = self.form_class(request.POST, instance=shareholder)
            if form.is_valid():
                form.save()
                return redirect('/company/'+str(company)+'/')
                
        context = {'company': company, 'shareholder': shareholder, 'form': form}
        return render(request, self.template_name, context)


class DeleteShareholderView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/shareholder_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholder = Shareholder.objects.get(pk=pk)
        company = shareholder.company.id
        if shareholder is not None:
            context = {'shareholder': shareholder, 'company': company}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholder = Shareholder.objects.get(pk=pk)
        company = shareholder.company.id
        if shareholder is not None:
            shareholder.delete()
            return redirect('/company/'+str(company)+'/')
            
        context = {'shareholder': shareholder, 'company': company}
        return render(request, self.template_name, context)

class CreateShareholderLinkView(LoginRequiredMixin, UserAccessMixin, CompanyObjectMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = ShareholderLinkForm
    template_name = 'customers/shareholderlink.html'    


    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'company': obj, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        #pk = obj.pk
        if request.method != 'POST':
            # No data submitted; create a blank form.
            form = self.form_class()
        else:
            form = self.form_class(request.POST)
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.company = obj
                new_item.save()
                pk = new_item.id
                return redirect('/update_shareholderlink/'+str(pk)+'/')
                

        context = {'company': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateShareholderLinkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = ShareholderLinkForm
    template_name = 'customers/shareholderlink_detail.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholderlink = ShareholderLink.objects.get(pk=pk)
        company = shareholderlink.company.id
        shareholdercompanys = shareholderlink.shareholdercompany_set.all()
        if shareholderlink is not None:
            form = self.form_class(instance=shareholderlink)
            context = {'shareholdercompanys':shareholdercompanys ,'company': company,'shareholderlink': shareholderlink, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholderlink = ShareholderLink.objects.get(pk=pk)
        company = shareholderlink.company.id
        shareholdercompanys = shareholderlink.shareholdercompany_set.all()
        if shareholderlink is not None:
            form = self.form_class(request.POST, instance=shareholderlink)
            if form.is_valid():
                form.save()
                return redirect('/company/'+str(company)+'/')
                
        context = {'shareholdercompanys':shareholdercompanys, 'company': company, 'shareholderlink': shareholderlink, 'form': form}
        return render(request, self.template_name, context)


class DeleteshareholderlinkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/shareholderlink_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholderlink = ShareholderLink.objects.get(pk=pk)
        company = shareholderlink.company.id
        if shareholderlink is not None:
            context = {'shareholderlink': shareholderlink, 'company': company}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholderlink = ShareholderLink.objects.get(pk=pk)
        company = shareholderlink.company.id
        if shareholderlink is not None:
            shareholderlink.delete()
            return redirect('/company/'+str(company)+'/')
        context = {'shareholderlink': shareholderlink, 'company': company}
        return render(request, self.template_name, context)


class ShareholderLinkObjectMixin(object):
    model = ShareholderLink
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj


class CreateShareholderCompanyView(LoginRequiredMixin, UserAccessMixin, ShareholderLinkObjectMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = ShareholderCompanyForm
    template_name = 'customers/shareholdercompany.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'shareholderlink': obj, 'form': form}
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
                new_item.shareholderlink = obj
                new_item.save()
                return redirect('/update_shareholderlink/'+str(pk)+'/')
             
        context = {'shareholderlink': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateShareholderCompanyView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = ShareholderCompanyForm
    template_name = 'customers/shareholdercompany_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholdercompany = ShareholderCompany.objects.get(pk=pk)
        shareholderlink = shareholdercompany.shareholderlink.id
        if shareholdercompany is not None:
            form = self.form_class(instance=shareholdercompany)
            context = {'shareholderlink': shareholderlink,'shareholdercompany': shareholdercompany, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholdercompany = ShareholderCompany.objects.get(pk=pk)
        shareholderlink = shareholdercompany.shareholderlink.id
        if shareholdercompany is not None:
            form = self.form_class(request.POST, instance=shareholdercompany)
            if form.is_valid():
                form.save()
                return redirect('/update_shareholderlink/'+str(shareholderlink)+'/')
                
        context = {'shareholderlink': shareholderlink, 'shareholdercompany': shareholdercompany, 'form': form}
        return render(request, self.template_name, context)


class DeleteShareholderCompanyView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/shareholdercompany_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholdercompany = ShareholderCompany.objects.get(pk=pk)
        shareholderlink = shareholdercompany.shareholderlink.id
        if shareholdercompany is not None:
            context = {'shareholdercompany': shareholdercompany, 'shareholderlink': shareholderlink}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        shareholdercompany = ShareholderCompany.objects.get(pk=pk)
        shareholderlink = shareholdercompany.shareholderlink.id
        if shareholdercompany is not None:
            shareholdercompany.delete()
            return redirect('/update_shareholderlink/'+str(shareholderlink)+'/')
            
        context = {'shareholdercompany': shareholdercompany, 'shareholderlink': shareholderlink}
        return render(request, self.template_name, context)


class CreateRepresentativeView(LoginRequiredMixin, UserAccessMixin, CompanyObjectMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = RepresentativeForm
    template_name = 'customers/representative.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'company': obj, 'form': form}
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
                new_item.company = obj
                new_item.save()
                return redirect('/company/'+str(pk)+'/')
                

        context = {'company': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateRepresentativeView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = RepresentativeForm
    template_name = 'customers/representative_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        representative = Representative.objects.get(pk=pk)
        company = representative.company.id
        if representative is not None:
            form = self.form_class(instance=representative)
            context = {'company': company,'representative': representative, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        representative = Representative.objects.get(pk=pk)
        company = representative.company.id
        if representative is not None:
            form = self.form_class(request.POST, instance=representative)
            if form.is_valid():
                form.save()
                return redirect('/company/'+str(company)+'/')
                
        context = {'company': company, 'representative': representative, 'form': form}
        return render(request, self.template_name, context)


class DeleteRepresentativeView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/representative_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        representative = Representative.objects.get(pk=pk)
        company = representative.company.id
        if Representative is not None:
            context = {'representative': representative, 'company': company}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        representative = Representative.objects.get(pk=pk)
        company = representative.company.id
        if representative is not None:
            representative.delete()
            return redirect('/company/'+str(company)+'/')
            
        context = {'representative': representative, 'company': company}
        return render(request, self.template_name, context)



class CreateRepresentativeLinkView(LoginRequiredMixin, UserAccessMixin, CompanyObjectMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = RepresentativeLinkForm
    template_name = 'customers/representativelink.html'    


    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'company': obj, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        #pk = obj.pk
        if request.method != 'POST':
            # No data submitted; create a blank form.
            form = self.form_class()
        else:
            form = self.form_class(request.POST)
            if form.is_valid():
                new_item = form.save(commit=False)
                new_item.company = obj
                new_item.save()
                pk = new_item.id
                return redirect('/update_representativelink/'+str(pk)+'/')
                

        context = {'company': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateRepresentativeLinkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = RepresentativeLinkForm
    template_name = 'customers/representativelink_detail.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        representativelink = RepresentativeLink.objects.get(pk=pk)
        company = representativelink.company.id
        representativecompanys = representativelink.representativecompany_set.all()
        if representativelink is not None:
            form = self.form_class(instance=representativelink)
            context = {'representativecompanys':representativecompanys,'company': company,'representativelink': representativelink, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        representativelink = RepresentativeLink.objects.get(pk=pk)
        company = representativelink.company.id
        representativecompanys = representativelink.representativecompany_set.all()
        if representativelink is not None:
            form = self.form_class(request.POST, instance=representativelink)
            if form.is_valid():
                form.save()
                return redirect('/company/'+str(company)+'/')
                
        context = {'representativecompanys':representativecompanys,'company': company, 'representativelink': representativelink, 'form': form}
        return render(request, self.template_name, context)


class DeleteRepresentativelinkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/representativelink_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        representativelink = RepresentativeLink.objects.get(pk=pk)
        company = representativelink.company.id
        if representativelink is not None:
            context = {'representativelink': representativelink, 'company': company}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        representativelink = RepresentativeLink.objects.get(pk=pk)
        company = representativelink.company.id
        if representativelink is not None:
            representativelink.delete()
            return redirect('/company/'+str(company)+'/')
        context = {'representativelink': representativelink, 'company': company}
        return render(request, self.template_name, context)


class RepresentativeLinkObjectMixin(object):
    model = RepresentativeLink
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj



class CreateRepresentativeCompanyView(LoginRequiredMixin, UserAccessMixin, RepresentativeLinkObjectMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = RepresentativeCompanyForm
    template_name = 'customers/representativecompany.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'representativelink': obj, 'form': form}
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
                new_item.representativelink = obj
                new_item.save()
                return redirect('/update_representativelink/'+str(pk)+'/')
                

        context = {'representativelink': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateRepresentativeCompanyView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    form_class = RepresentativeCompanyForm
    template_name = 'customers/representativecompany_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        representativecompany = RepresentativeCompany.objects.get(pk=pk)
        representativelink = representativecompany.representativelink.id
        if representativecompany is not None:
            form = self.form_class(instance=representativecompany)
            context = {'representativelink': representativelink,'representativecompany': representativecompany, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        representativecompany = RepresentativeCompany.objects.get(pk=pk)
        representativelink = representativecompany.representativelink.id
        if representativecompany is not None:
            form = self.form_class(request.POST, instance=representativecompany)
            if form.is_valid():
                form.save()
                return redirect('/update_representativelink/'+str(representativelink)+'/')
                
        context = {'representativelink': representativelink, 'representativecompany': representativecompany, 'form': form}
        return render(request, self.template_name, context)


class DeleteRepresentativeCompanyView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/representativecompany_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        representativecompany = RepresentativeCompany.objects.get(pk=pk)
        representativelink = representativecompany.representativelink.id
        if representativecompany is not None:
            context = {'representativecompany': representativecompany, 'representativelink': representativelink}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        representativecompany = RepresentativeCompany.objects.get(pk=pk)
        representativelink = representativecompany.representativelink.id
        if representativecompany is not None:
            representativecompany.delete()
            return redirect('/update_representativelink/'+str(representativelink)+'/')
        context = {'representativecompany': representativecompany, 'representativelink': representativelink}
        return render(request, self.template_name, context)

class ContactDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'customers.change_contact'
    
    model = Contact
    context_object_name = 'contactDetail'
    template_name = 'customers/contact_detail.html'
    form_class = ContactForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        prospects = obj.prospect_set.all()

        
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'contact': obj, 'form': form, 
                       'prospects': prospects}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        prospects = obj.prospect_set.all()

        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/contacts/')
        context = {'contact': obj, 'form': form,
                   'prospects': prospects}
        return render(request, self.template_name, context)
    
    
class ContactCreateView(LoginRequiredMixin, UserAccessMixin, CreateView):
    raise_exception = True
    permission_required = 'customers.change_contact'
     
    model = Contact
    context_object_name = 'contactCreate'
    template_name = 'customers/contact_create.html'
    fields = '__all__'


class ContactDeleteView(LoginRequiredMixin, UserAccessMixin, DeleteView):
    raise_exception = True
    permission_required = 'customers.change_contact'
    
    model = Contact
    context_object_name = 'contactDelete'
    template_name = 'customers/contact_delete.html'
    
    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            context = {'contact': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            obj.delete()
            return redirect('/contacts/')
        context = {'contact': obj}
        return render(request, self.template_name, context)


class ContactView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_contact'
    context_object_name = 'contactList'
    template_name = 'customers/contact_list.html'
    
    def get(self, request):
        context = {}
        contacts = Contact.objects.all().order_by('person')

        context = {'contacts': contacts}
        return render(request, self.template_name , context)
    

class ProspectDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'customers.change_prospect'
    
    model = Prospect
    context_object_name = 'prospectDetail'
    template_name = 'customers/prospect_detail.html'
    form_class = ProspectForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        lettremissionlinks = obj.lettremissionlink_set.all()

        
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'prospect': obj, 'form': form, 
                       'lettremissionlinks': lettremissionlinks
                       }
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        lettremissionlinks = obj.lettremissionlink_set.all()

        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/prospects/')
        context = {'prospect': obj, 'form': form,
                    'lettremissionlinks': lettremissionlinks
                    }
        return render(request, self.template_name, context)
    
    
class ProspectCreateView(LoginRequiredMixin, UserAccessMixin, CreateView):
    raise_exception = True
    permission_required = 'customers.change_prospect'
     
    model = Prospect
    context_object_name = 'prospectCreate'
    template_name = 'customers/prospect_create.html'
    fields = '__all__'


class ProspectDeleteView(LoginRequiredMixin, UserAccessMixin, DeleteView):
    raise_exception = True
    permission_required = 'customers.change_prospect'
    
    model = Prospect
    context_object_name = 'prospectDelete'
    template_name = 'customers/prospect_delete.html'
    
    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            context = {'prospect': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            obj.delete()
            return redirect('/prospects/')
        context = {'prospect': obj}
        return render(request, self.template_name, context)


class ProspectView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_prospect'
    context_object_name = 'prospectList'
    template_name = 'customers/prospect_list.html'
    
    def get(self, request):
        context = {}
        prospects = Prospect.objects.all().order_by('contact')

        context = {'prospects': prospects}
        return render(request, self.template_name , context)

class ProspectObjectMixin(object):
    model = Prospect
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj
    

class CreateLettreMissionLinkView(LoginRequiredMixin, UserAccessMixin, ProspectObjectMixin, View):
    raise_exception = True
    permission_required = 'customers.change_prospect'
    form_class = LettreMissionLinkForm
    template_name = 'customers/lettremissionlink.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'prospect': obj, 'form': form}
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
                new_item.prospect = obj
                new_item.save()
                return redirect('/prospect/'+str(pk)+'/')

        context = {'prospect': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateLettreMissionLinkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_prospect'
    form_class = LettreMissionLinkForm
    template_name = 'customers/lettremissionlink_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        lettremissionlink = LettreMissionLink.objects.get(pk=pk)
        prospect = lettremissionlink.prospect.id
        if lettremissionlink is not None:
            form = self.form_class(instance=lettremissionlink)
            context = {'prospect': prospect,'lettremissionlink': lettremissionlink, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        lettremissionlink = LettreMissionLink.objects.get(pk=pk)
        prospect = lettremissionlink.prospect.id
        if lettremissionlink is not None:
            form = self.form_class(request.POST, instance=lettremissionlink)
            if form.is_valid():
                form.save()
                return redirect('/prospect/'+str(prospect)+'/')
                
        context = {'prospect': prospect, 'lettremissionlink': lettremissionlink, 'form': form}
        return render(request, self.template_name, context)


class DeleteLettreMissionLinkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_prospect'
    template_name = 'customers/lettremissionlink_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        lettremissionlink = LettreMissionLink.objects.get(pk=pk)
        prospect = lettremissionlink.prospect.id
        if lettremissionlink is not None:
            context = {'lettremissionlink': lettremissionlink, 'prospect': prospect}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        lettremissionlink = LettreMissionLink.objects.get(pk=pk)
        prospect = lettremissionlink.prospect.id
        if lettremissionlink is not None:
            lettremissionlink.delete()
            return redirect('/prospect/'+str(prospect)+'/')
            
        context = {'lettremissionlink': lettremissionlink, 'prospect': prospect}
        return render(request, self.template_name, context)
    

# --------------DB société depuis ERP--------------
class InsertCompanyTempsView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/companytemps_list.html'
    form_class = OfficeForm

    def get(self, request, *args, **kwargs):
        context = {}
        companytemps = CompanyTemps.objects.all()
        form = self.form_class()
                  
        context = {'companytemps': companytemps, 'form':form}
        return render(request, self.template_name, context)

    def post(self, request, *args, **kwargs):
        user = request.user.profile
        office = Office.objects.filter(code_lf=user.office_id)                 
        db_name="parambd"
        db_ip=office[0].ip
        db_port=office[0].port
        db_pass=office[0].password
        connection = create_connection(db_ip, db_port, db_pass, db_name)
        
        select_datas = "SELECT `code_soci`, `nom_soci`,`adre_soci`, `codp_soci` , `pate_soci` , `idef_soci` ,`reco_soci` ,`cnss_soci` ,`activ_soc` ,`moisex_soci` , `model_soci`, `rtva_soci`, `Nom_vill`,`Date_creation` ,`ICE`,`fj_soci` FROM parambd.abnsoci;"       
        datas = execute_read_query(connection, select_datas)
        for i in datas:
            ldm = LettreMission.objects.filter(db_office=str(i[0])).filter(office_id=office[0])
            if ldm.exists():
                pass
            else:
                blacklist = BlackList.objects.filter(codedb=str(i[0])).filter(office_id=office[0])
                if blacklist.exists():
                    pass
                else:
                    print(str(i[15]))
                    if str(i[15])==str('SARL ') or str(i[15])==str('SARL'):
                        legal_form =5
                    elif str(i[15]) =='SARLAU' or str(i[15]) == str('SARL AU') or str(i[15]) == str('SARL à Associé Unique'):
                        legal_form =6
                    elif str(i[15])==str('SA') or str(i[15])==str('SA '):
                        legal_form =4
                    elif str(i[15]) ==str('PP'):
                        legal_form =3
                    elif str(i[15]) ==str('SAS'):
                        legal_form =7
                    elif str(i[15]) ==str('SCS') or str(i[15])==str('SUCCURSAL') or str(i[15])==str('SUCC'):
                        legal_form =8
                    elif str(i[15]) ==str('PARTICULIER'):
                        legal_form =12
                    else:
                        legal_form=None
                                                                       
                    if i[13]==None:
                        create_date = None
                    else:
                        create_date = datetime.datetime.strptime(str(i[13]),'%Y-%m-%d')
                                                                 
                    companytemps = CompanyTemps.objects.filter(codedb =str(i[0]))
                    if companytemps.exists():
                        companytemps.update(exclude = False,  name = str(i[1]),    adresse = str(i[2]),    code_postal = str(i[3]),    city = str(i[12]),    country_id =212 ,    nationality_id =212 ,
                                               currency_id='MAD' , national_law =True ,  ice =str(i[14]) ,  identifiant_fiscal = str(i[5]), cnss = str(i[7]), rc =str(i[6]) ,    tp =str(i[4]) ,    activity =str(i[8]) ,  fiscal_year =str(i[9]),
                                               share_capital =0 ,    nominal_value =100 , create_date = create_date, legal_form_id=legal_form)
                    else:
                        CompanyTemps.objects.create(codedb =str(i[0]), exclude = False , name = str(i[1]),    adresse = str(i[2]),    code_postal = str(i[3]),    city = str(i[12]),    country_id =212 ,    nationality_id =212 ,
                                               currency_id='MAD' , national_law =True ,  ice =str(i[14]) ,  identifiant_fiscal = str(i[5]), cnss = str(i[7]), rc =str(i[6]) ,    tp =str(i[4]) ,    activity =str(i[8]) ,  fiscal_year =str(i[9]),
                                               share_capital =0 ,    nominal_value =100 , create_date = create_date, legal_form_id=legal_form)

                   
                   
        return redirect('/delete/')

class CompanyTemps_view(LoginRequiredMixin, UserAccessMixin,View):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/companytemps_list.html'
        
    def get(self, request, *args, **kwargs):
        context = {}
        companytemps = CompanyTemps.objects.all()    
        context = {'companytemps': companytemps}
        return render(request, self.template_name, context)
    
    def post(self, request, *args, **kwargs):
        user = request.user.profile
        office = Office.objects.filter(code_lf=user.office_id)  
        companytemps = CompanyTemps.objects.filter(exclude=False)
        for i in companytemps:
            company = Company.objects.filter(ice =i.ice)
            if company.exists():
                pass
            else:
                Company.objects.create(name = i.name,    adresse = i.adresse,    code_postal = i.code_postal,    city = i.city,    country_id =i.country_id ,    nationality_id =i.nationality_id ,
                                        currency_id=i.currency_id , national_law =i.national_law ,  ice =i.ice ,  identifiant_fiscal =i.identifiant_fiscal, cnss =i.cnss, rc =i.rc ,    tp =i.tp ,    activity =i.activity ,  fiscal_year =i.fiscal_year,
                                        share_capital =i.share_capital ,    nominal_value =i.nominal_value , create_date = i.create_date)
            
            company=Company.objects.filter(ice =i.ice)
            if company.exists():
                if LettreMission.objects.filter(company=company[0].id).exists():
                    pass
                else:
                    LettreMission.objects.create(reference='LDM/'+str(i.codedb), company_id=company[0].id, office_id=office[0].code_lf, moduleservice_id=2, db_office=i.codedb, entry_date=datetime.datetime.now() )
                CompanyTemps.objects.filter(ice=i.ice).delete()         
        return redirect('customers:CompanyTempsDelete')


class CompanyTempsExcludeView(LoginRequiredMixin, UserAccessMixin, DeleteView):
    raise_exception = True
    permission_required = 'customers.change_company'
    template_name = 'customers/companytemps_list.html'
    
    def post(self, request, pk=None, *args, **kwargs):
        obj = CompanyTemps.objects.filter(pk=pk)
        if obj is not None:
            if obj[0].exclude==False:
                obj.update(exclude=True)
            else:
                obj.update(exclude=False)
            return redirect('customers:CompanyTempsDelete')
