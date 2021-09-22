
from django.http.response import HttpResponseRedirect
from customers.models import Prospect
from accounts.forms import PWSafeForm
from tasks.models import BenefitItem, BenefitLink
from django.db.models import Sum
from accounts.models import PWSafe, Portefolio, Validator
from accounts.views import UserAccessMixin
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, DetailView, CreateView, DeleteView
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.conf import settings
from django.http import HttpResponse
from django.template.loader import render_to_string
from django.views import View
from .forms import BenefitItemForm, BenefitLinkForm, LettreMissionForm, OrdreForm, PortefolioForm, ServiceItemForm, OutlayItemForm, ValidatorForm
from .models import Company, LettreMission, Ordre, ServiceItem, OutlayItem
import weasyprint


#@staff_member_required
def admin_ordre_detail(request, order_id):
    ordre = get_object_or_404(Ordre, id=order_id)
    return render(request,'ordres/ordre/detail.html',{'ordre': ordre})

#@staff_member_required
def admin_ordre_pdf(request, order_id):
    ordre = get_object_or_404(Ordre, id=order_id)
    serviceitems = ordre.serviceitem_set.all()
    outlayitems = ordre.outlayitem_set.all()
    html = render_to_string('ordres/ordre/pdf.html',{'ordre':ordre, 'serviceitems':serviceitems, 'outlayitems':outlayitems})
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'filename=ordre_{ordre.id}.pdf'
    weasyprint.HTML(string=html).write_pdf(response,
        stylesheets=[weasyprint.CSS(
    settings.STATIC_ROOT + '/css/pdf.css')])
    return response
  

class OrdreListView(LoginRequiredMixin, UserAccessMixin, ListView):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
        
    model = Ordre
    context_object_name = 'ordre_list'
    template_name = 'ordres/ordre_list.html'
    

class OrdreObjectMixin(object):
    model = Ordre
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj

    
class OrdreDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    
    model = Ordre
    context_object_name = 'ordreDetail'
    template_name = 'ordres/ordre_detail.html'
    form_class = OrdreForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        serviceitems = obj.serviceitem_set.all()
        outlayitems = obj.outlayitem_set.all()

        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'ordre': obj, 'form': form,
                       'serviceitems': serviceitems, 'outlayitems': outlayitems}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        serviceitems = obj.serviceitem_set.all()
        outlayitems = obj.outlayitem_set.all()
        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/ordres/')
        context = {'ordre': obj, 'form': form,
                   'serviceitems': serviceitems, 'outlayitems': outlayitems}
        return render(request, self.template_name, context)
    
    
class OrdreCreateView(LoginRequiredMixin, UserAccessMixin, CreateView):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
     
    model = Ordre
    context_object_name = 'ordreCreate'
    template_name = 'ordres/ordre_create.html'
    fields = '__all__'


class OrdreDeleteView(LoginRequiredMixin, UserAccessMixin, DeleteView):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    
    model = Ordre
    context_object_name = 'ordreDelete'
    template_name = 'ordres/ordre_delete.html'
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    
    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            context = {'ordre': obj}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        if obj is not None:
            obj.delete()
            return redirect('/ordres/')
        context = {'ordre': obj}
        return render(request, self.template_name, context)

class OrdreView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
 
    model = Ordre
    context_object_name = 'ordres'
    template_name = 'ordres/ordres.html'
    
    def get(self, request, *args, **kwargs):
        context = {}
        ordres = Ordre.objects.all()
        fees = ServiceItem.objects.filter(ordre__statut__in=[1,2]).aggregate(fees_sum=Sum('amount'))
        ordres_statut0 = Ordre.objects.filter(statut=0)
        ordres_statut1 = Ordre.objects.filter(statut=1)
        ordres_statut2 = Ordre.objects.filter(statut=2)
        ordres_statut3 = Ordre.objects.filter(statut=3)
        ordres_statut4 = Ordre.objects.filter(statut=4)      
        customers = Company.objects.all()
        total_clients = customers.count()
        total_ordres = ordres.count()
        inapproval = ordres.filter(statut=0).count()
        inprocess = ordres.filter(statut=1).count()
        terminate = ordres.filter(statut=2).count()
        canceled = ordres.filter(statut=3).count()
        invoiced = ordres.filter(statut=4).count()

        context = {'fees':fees,'ordres': ordres, 'ordres_statut0': ordres_statut0, 'ordres_statut1': ordres_statut1, 'ordres_statut2': ordres_statut2,
                   'ordres_statut3': ordres_statut3, 'ordres_statut4': ordres_statut4,
                   'customers': customers, 'total_clients': total_clients, 'total_ordres': total_ordres,
                   'inapproval': inapproval, 'inprocess': inprocess, 'terminate': terminate, 'canceled': canceled, 'invoiced': invoiced
                   }
        return render(request, self.template_name, context)


class ServicesView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    
    def get(self, request):
        services = Ordre.objects.all()
        context = {'services': services}
        return render(request, 'services.html', context)


class OrdresInvoicedView(LoginRequiredMixin,UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'

    def get(self, request):
        ordres = Ordre.objects.all()
        ordres_statut4 = Ordre.objects.filter(statut=4)
        clients = Company.objects.all()
        invoiced = ordres.filter(statut=4).count()

        context = {'ordres': ordres, 'ordres_statut4': ordres_statut4,
                   'clients': clients, 'invoiced': invoiced}
        return render(request, 'ordres/ordres_invoiced.html', context)


class CustomerView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    
    def get(self, request, pk):
        context = {}
        customer = Company.objects.get(pk=pk)
        ordres = customer.ordre_set.all()
        ordre_count = ordres.count()
        contacts = customer.contact_set.all()
        context = {'customer': customer, 'ordres': ordres,
                   'contacts': contacts, 'ordre_count': ordre_count}
        return render(request, 'ordres/customer.html', context)


class CreateServiceItemView(LoginRequiredMixin, UserAccessMixin, OrdreObjectMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    form_class = ServiceItemForm
    template_name = 'ordres/serviceitem.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'ordre': obj, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        pk = obj.pk
        if request.method != 'POST':
            # No data submitted; create a blank form.
            form = self.form_class()
        elif "another" in request.POST:
            form = self.form_class(request.POST)
            if form.is_valid():
                new_outlayeitem = form.save(commit=False)
                new_outlayeitem.ordre = obj
                new_outlayeitem.save()
                return redirect('/create_serviceItem/'+str(pk)+'/')
        else:
            form = self.form_class(request.POST)
            if form.is_valid():
                new_servciceitem = form.save(commit=False)
                new_servciceitem.ordre = obj
                new_servciceitem.save()
                return redirect('/ordre/'+str(pk)+'/')

        context = {'ordre': obj, 'form': form}
        return render(request, self.template_name, context)


class CreateOutlayItemView(LoginRequiredMixin, UserAccessMixin, OrdreObjectMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    form_class = OutlayItemForm
    template_name = 'ordres/outlayitem.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'ordre': obj, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        pk = obj.pk
        if request.method != 'POST':
            # No data submitted; create a blank form.
            form = self.form_class()
        elif "another" in request.POST:
            form = self.form_class(request.POST)
            if form.is_valid():
                new_outlayeitem = form.save(commit=False)
                new_outlayeitem.ordre = obj
                new_outlayeitem.save()
                return redirect('/create_outlayItem/'+str(pk)+'/')
        else:
            form = self.form_class(request.POST)
            if form.is_valid():
                new_outlayeitem = form.save(commit=False)
                new_outlayeitem.ordre = obj
                new_outlayeitem.save()
                return redirect('/ordre/'+str(pk)+'/')
                # return redirect('/ordres/')

        context = {'ordre': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateServiceItemView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    form_class = ServiceItemForm
    template_name = 'ordres/serviceitem_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        serviceitem = ServiceItem.objects.get(pk=pk)
        ordre = serviceitem.ordre.id
        if serviceitem is not None:
            form = self.form_class(instance=serviceitem)
            context = {'ordre': ordre,
                       'serviceitem': serviceitem, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        serviceitem = ServiceItem.objects.get(pk=pk)
        ordre = serviceitem.ordre.id
        if serviceitem is not None:
            form = self.form_class(request.POST, instance=serviceitem)
            if form.is_valid():
                form.save()
                return redirect('/ordre/'+str(ordre)+'/')
                # return redirect('/ordres/')
        context = {'ordre': ordre, 'serviceitem': serviceitem, 'form': form}
        return render(request, self.template_name, context)


class DeleteServiceItemView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    template_name = 'ordres/serviceitem_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        serviceitem = ServiceItem.objects.get(pk=pk)
        ordre = serviceitem.ordre.id
        if serviceitem is not None:
            context = {'serviceitem': serviceitem, 'ordre': ordre}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        serviceitem = ServiceItem.objects.get(pk=pk)
        ordre = serviceitem.ordre.id
        if serviceitem is not None:
            serviceitem.delete()
            return redirect('/ordre/'+str(ordre)+'/')
            # return redirect('/ordres/')
        context = {'serviceitem': serviceitem, 'ordre': ordre}
        return render(request, self.template_name, context)


class UpdateOutlayItemView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    form_class = OutlayItemForm
    template_name = 'ordres/outlayitem_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        outlayitem = OutlayItem.objects.get(pk=pk)
        ordre = outlayitem.ordre.id
        if outlayitem is not None:
            form = self.form_class(instance=outlayitem)
            context = {'ordre': ordre, 'outlayitem': outlayitem, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        outlayitem = OutlayItem.objects.get(pk=pk)
        ordre = outlayitem.ordre.id
        if outlayitem is not None:
            form = self.form_class(request.POST, instance=outlayitem)
            if form.is_valid():
                form.save()
                return redirect('/ordre/'+str(ordre)+'/')
                # return redirect('/ordres/')
        context = {'ordre': ordre, 'outlayitem': outlayitem, 'form': form}
        return render(request, self.template_name, context)


class DeleteOutlayItemView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_ordre'
    template_name = 'ordres/outlayitem_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        outlayitem = OutlayItem.objects.get(pk=pk)
        ordre = outlayitem.ordre.id
        if outlayitem is not None:
            context = {'outlayitem': outlayitem, 'ordre': ordre}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        outlayitem = OutlayItem.objects.get(pk=pk)
        ordre = outlayitem.ordre.id
        if outlayitem is not None:
            outlayitem.delete()
            return redirect('/ordre/'+str(ordre)+'/')
            # return redirect('/ordres/')
        context = {'outlayitem': outlayitem, 'ordre': ordre}
        return render(request, self.template_name, context)


class LettreMissionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    context_object_name = 'lettremissionList'
    template_name = 'ordres/lettremission_list.html'
    
    def get(self, request):
        context = {}
        prospects = Prospect.objects.filter(statut__in=[0,1,2]).count()
        lettremissions = LettreMission.objects.all().order_by('company__name')
        lettremissions_orph = LettreMission.objects.filter(portefolio__isnull=True).count()
        lettremissions_actif = LettreMission.objects.filter(terminate=False).count()
        lettremissions_inactif = LettreMission.objects.filter(terminate=True).count()
        lettremissions_orph = LettreMission.objects.filter(terminate=False).filter(portefolio__isnull=True).count()

        context = {'prospects':prospects,'lettremissions': lettremissions, 'lettremissions_orph':lettremissions_orph, 'lettremissions_actif':lettremissions_actif, 'lettremissions_inactif':lettremissions_inactif}
        return render(request, self.template_name , context)

class LettreMissionOrphView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    context_object_name = 'lettremissionListOrph'
    template_name = 'ordres/lettremission_list_orph.html'
    
    def get(self, request):
        context = {}
        lettremissions = LettreMission.objects.filter(terminate=False).filter(portefolio__isnull=True).order_by('company__name')
        context = {'lettremissions' :lettremissions}
        return render(request, self.template_name , context)
   

class CreateLettreMissionView(LoginRequiredMixin, UserAccessMixin, CreateView):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = LettreMissionForm
    template_name = 'ordres/lettremission.html'


class UpdateLettreMissionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = LettreMissionForm
    template_name = 'ordres/lettremission_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        lettremission = LettreMission.objects.get(pk=pk)
        company = lettremission.company.id
        if lettremission is not None:
            form = self.form_class(instance=lettremission)
            context = {'company': company,'lettremission': lettremission, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        lettremission = LettreMission.objects.get(pk=pk)
        company = lettremission.company.id
        if lettremission is not None:
            form = self.form_class(request.POST, instance=lettremission)
            if form.is_valid():
                form.save()
                return redirect('/company/'+str(company)+'/')
                
        context = {'company': company, 'lettremission': lettremission, 'form': form}
        return render(request, self.template_name, context)


class DeleteLettreMissionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    template_name = 'ordres/lettremission_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        lettremission = LettreMission.objects.get(pk=pk)
        company = lettremission.company.id
        if lettremission is not None:
            context = {'lettremission': lettremission, 'company': company}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        lettremission = LettreMission.objects.get(pk=pk)
        company = lettremission.company.id
        if lettremission is not None:
            lettremission.delete()
            return redirect('/company/'+str(company)+'/')
            
        context = {'lettremission': lettremission, 'company': company}
        return render(request, self.template_name, context)


class LettreMissionObjectMixin(object):
    model = LettreMission
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj


class LettreMissionDetailView(LoginRequiredMixin, UserAccessMixin, DetailView):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    
    model = LettreMission
    context_object_name = 'lettremissionDetail'
    template_name = 'ordres/lettremission_detail.html'
    form_class = LettreMissionForm

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        portefolios = obj.portefolio_set.all()
        validators = obj.validator_set.all()
        pwsafes = obj.pwsafe_set.all()
        
        if obj is not None:
            form = self.form_class(instance=obj)
            context = {'lettremission': obj, 'form': form, 'portefolios': portefolios, 'validators': validators, 'pwsafes':pwsafes}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        portefolios = obj.portefolio_set.all()
        validators = obj.validator_set.all()
        pwsafes = obj.pwsafe_set.all()

        if obj is not None:
            form = self.form_class(request.POST, request.FILES, instance=obj)
            if form.is_valid():
                form.save()
                return redirect('/lettremissions/')
        context = {'lettremission': obj, 'form': form,
                   'portefolios': portefolios,
                   'validators': validators,
                   'pwsafes':pwsafes}
        return render(request, self.template_name, context)
        
    
class CreatePortefolioView(LoginRequiredMixin, UserAccessMixin, LettreMissionObjectMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = PortefolioForm
    template_name = 'ordres/portefolio.html'

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
                return redirect('/lettremission/'+str(pk)+'/')

        context = {'lettremission': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdatePortefolioView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = PortefolioForm
    template_name = 'ordres/portefolio_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        portefolio = Portefolio.objects.get(pk=pk)
        lettremission = portefolio.lettremission.id
        if portefolio is not None:
            form = self.form_class(instance=portefolio)
            context = {'lettremission': lettremission,'portefolio': portefolio, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        portefolio = Portefolio.objects.get(pk=pk)
        lettremission = portefolio.lettremission.id
        if portefolio is not None:
            form = self.form_class(request.POST, instance=portefolio)
            if form.is_valid():
                form.save()
                return redirect('/lettremission/'+str(lettremission)+'/')
                
        context = {'lettremission': lettremission, 'portefolio': portefolio, 'form': form}
        return render(request, self.template_name, context)


class DeletePortefolioView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    template_name = 'ordres/portefolio_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        portefolio = Portefolio.objects.get(pk=pk)
        lettremission = portefolio.lettremission.id
        if portefolio is not None:
            context = {'portefolio': portefolio, 'lettremission': lettremission}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        portefolio = Portefolio.objects.get(pk=pk)
        lettremission = portefolio.lettremission.id
        if portefolio is not None:
            portefolio.delete()
            return redirect('/lettremission/'+str(lettremission)+'/')
            
        context = {'portefolio': portefolio, 'lettremission': lettremission}
        return render(request, self.template_name, context)
    

    
class CreateValidatorView(LoginRequiredMixin, UserAccessMixin, LettreMissionObjectMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = ValidatorForm
    template_name = 'ordres/validator.html'

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
                return redirect('/lettremission/'+str(pk)+'/')

        context = {'lettremission': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateValidatorView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = ValidatorForm
    template_name = 'ordres/validator_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        validator = Validator.objects.get(pk=pk)
        lettremission = validator.lettremission.id
        if validator is not None:
            form = self.form_class(instance=validator)
            context = {'lettremission': lettremission,'validator': validator, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        validator = Validator.objects.get(pk=pk)
        lettremission = validator.lettremission.id
        if validator is not None:
            form = self.form_class(request.POST, instance=validator)
            if form.is_valid():
                form.save()
                return redirect('/lettremission/'+str(lettremission)+'/')
                
        context = {'lettremission': lettremission, 'validator': validator, 'form': form}
        return render(request, self.template_name, context)


class DeleteValidatorView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    template_name = 'ordres/validator_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        validator = Validator.objects.get(pk=pk)
        lettremission = validator.lettremission.id
        if validator is not None:
            context = {'validator': validator, 'lettremission': lettremission}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        validator = Validator.objects.get(pk=pk)
        lettremission = validator.lettremission.id
        if validator is not None:
            validator.delete()
            return redirect('/lettremission/'+str(lettremission)+'/')
            
        context = {'validator': validator, 'lettremission': lettremission}
        return render(request, self.template_name, context)
    
class CreatePWSafeView(LoginRequiredMixin, UserAccessMixin, LettreMissionObjectMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = PWSafeForm
    template_name = 'ordres/pwsafe.html'

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
                return redirect('/lettremission/'+str(pk)+'/')

        context = {'lettremission': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdatePWSafeView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = PWSafeForm
    template_name = 'ordres/pwsafe_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        pwsafe = PWSafe.objects.get(pk=pk)
        lettremission = pwsafe.lettremission.id
        if pwsafe is not None:
            form = self.form_class(instance=pwsafe)
            context = {'lettremission': lettremission,'pwsafe': pwsafe, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        pwsafe = PWSafe.objects.get(pk=pk)
        lettremission = pwsafe.lettremission.id
        if pwsafe is not None:
            form = self.form_class(request.POST, instance=pwsafe)
            if form.is_valid():
                form.save()
                return redirect('/lettremission/'+str(lettremission)+'/')
                
        context = {'lettremission': lettremission, 'pwsafe': pwsafe, 'form': form}
        return render(request, self.template_name, context)


class DeletePWSafeView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    template_name = 'ordres/pwsafe_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        pwsafe = PWSafe.objects.get(pk=pk)
        lettremission = pwsafe.lettremission.id
        if pwsafe is not None:
            context = {'pwsafe': pwsafe, 'lettremission': lettremission}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        pwsafe = PWSafe.objects.get(pk=pk)
        lettremission = pwsafe.lettremission.id
        if pwsafe is not None:
            pwsafe.delete()
            return redirect('/lettremission/'+str(lettremission)+'/')
            
        context = {'pwsafe': pwsafe, 'lettremission': lettremission}
        return render(request, self.template_name, context)


class CreateBenefitLinkView(LoginRequiredMixin, UserAccessMixin, LettreMissionObjectMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = BenefitLinkForm
    template_name = 'ordres/benefitlink.html'    

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'lettremission': obj, 'form': form}
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
                new_item.lettremission = obj
                new_item.save()
                pk = new_item.id
                return redirect('/update_benefitlink/'+str(pk)+'/')
                

        context = {'lettremission': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateBenefitLinkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = BenefitLinkForm
    template_name = 'ordres/benefitlink_detail.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        benefitlink = BenefitLink.objects.get(pk=pk)
        lettremission = benefitlink.lettremission.id
        benefititems = benefitlink.benefititem_set.all()
        if benefitlink is not None:
            form = self.form_class(instance=benefitlink)
            context = {'benefititems':benefititems ,'lettremission': lettremission,'benefitlink': benefitlink, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        benefitlink = BenefitLink.objects.get(pk=pk)
        lettremission = benefitlink.lettremission.id
        benefititems = benefitlink.benefititem_set.all()
        if benefitlink is not None:
            form = self.form_class(request.POST, instance=benefitlink)
            if form.is_valid():
                form.save()
                return redirect('/lettremission/'+str(lettremission)+'/')
                
        context = {'benefititems':benefititems, 'lettremission': lettremission, 'benefitlink': benefitlink, 'form': form}
        return render(request, self.template_name, context)


class DeleteBenefitLinkView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    template_name = 'ordres/benefitlink_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        benefitlink = BenefitLink.objects.get(pk=pk)
        lettremission = benefitlink.lettremission.id
        if benefitlink is not None:
            context = {'benefitlink': benefitlink, 'lettremission': lettremission}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        benefitlink = BenefitLink.objects.get(pk=pk)
        lettremission = benefitlink.lettremission.id
        if benefitlink is not None:
            benefitlink.delete()
            return redirect('/lettremission/'+str(lettremission)+'/')
        context = {'benefitlink': benefitlink, 'lettremission': lettremission}
        return render(request, self.template_name, context)


class BenefitLinkObjectMixin(object):
    model = BenefitLink
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj


class CreateBenefitItemView(LoginRequiredMixin, UserAccessMixin, BenefitLinkObjectMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = BenefitItemForm
    template_name = 'ordres/benefititem.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        obj = self.get_object()
        form = self.form_class()
        context = {'benefitlink': obj, 'form': form}
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
                new_item.benefitlink = obj
                new_item.save()
                return redirect('/update_benefitlink/'+str(pk)+'/')
             
        context = {'benefitlink': obj, 'form': form}
        return render(request, self.template_name, context)


class UpdateBenefitItemView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    form_class = BenefitItemForm
    template_name = 'ordres/benefititem_update.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        benefititem = BenefitItem.objects.get(pk=pk)
        benefitlink = benefititem.benefitlink.id
        if benefititem is not None:
            form = self.form_class(instance=benefititem)
            context = {'benefitlink': benefitlink,'benefititem': benefititem, 'form': form}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        benefititem = BenefitItem.objects.get(pk=pk)
        benefitlink = benefititem.benefitlink.id
        if benefititem is not None:
            form = self.form_class(request.POST, instance=benefititem)
            if form.is_valid():
                form.save()
                return redirect('/update_benefitlink/'+str(benefitlink)+'/')
                
        context = {'benefitlink': benefitlink, 'benefititem': benefititem, 'form': form}
        return render(request, self.template_name, context)


class DeleteBenefitItemView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'ordres.change_lettremission'
    template_name = 'ordres/benefititem_delete.html'

    def get(self, request, pk=None, *args, **kwargs):
        context = {}
        benefititem = BenefitItem.objects.get(pk=pk)
        benefitlink = benefititem.benefitlink.id
        if benefititem is not None:
            context = {'benefititem': benefititem, 'benefitlink': benefitlink}
        return render(request, self.template_name, context)

    def post(self, request, pk=None, *args, **kwargs):
        context = {}
        benefititem = BenefitItem.objects.get(pk=pk)
        benefitlink = benefititem.benefitlink.id
        if benefititem is not None:
            benefititem.delete()
            return redirect('/update_benefitlink/'+str(benefitlink)+'/')
            
        context = {'benefititem': benefititem, 'benefitlink': benefitlink}
        return render(request, self.template_name, context)
    
    

