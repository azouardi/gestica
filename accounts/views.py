from editions.models import DocModel
from tasks.models import Claim, Work
from customers.models import Company, RepresentativeCompany, ShareholderCompany
from django.contrib.auth.mixins import PermissionRequiredMixin, LoginRequiredMixin

from django.contrib.auth.views import redirect_to_login
from django.shortcuts import get_object_or_404, render, redirect 
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.models import Group
from django.views import View
from .models import *
from .forms import CreateUserForm, ProfileForm
from .decorators import unauthenticated_user

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

class UserAccessMixin(PermissionRequiredMixin):
    def dispatch(self, request, *args, **kwargs):
        if (not self.request.user.is_authenticated):
            return redirect_to_login(self.request.get_full_path(), self.get_login_url(), self.get_redirect_field_name())
        if not self.has_permission():
            redirect('/about/')
        return super(UserAccessMixin, self).dispatch(request, *args, **kwargs)
    


@unauthenticated_user
def registerPage(request):
	form = CreateUserForm()
	if request.method == 'POST':
		form = CreateUserForm(request.POST)
		if form.is_valid():
			user = form.save()
			username = form.cleaned_data.get('username')
			group = Group.objects.get(name='Collaborateurs')
			user.groups.add(group)
			messages.success(request, 'Account was created for ' + username)
			return redirect('/login/')
		

	context = {'form':form}
	return render(request, 'accounts/register.html', context)

@unauthenticated_user
def loginPage(request):

	if request.method == 'POST':
		username = request.POST.get('username')
		password =request.POST.get('password')

		user = authenticate(request, username=username, password=password)

		if user is not None:
			login(request, user)
			return redirect('home')
		else:
			messages.info(request, 'Username OR password is incorrect')

	context = {}
	return render(request, 'accounts/login.html', context)

def logoutUser(request):
	logout(request)
	return redirect('/login/')


#@login_required(login_url='login')
#@allowed_users(allowed_roles=['customer'])

class UserObjectMixin(object):
    model = User
    def get_object(self):
        pk = self.kwargs.get('pk')
        obj = None
        if pk is not None:
            obj = get_object_or_404(self.model, pk=pk)
        return obj


def accountSettings(request):
	profile = request.user.profile
	form = ProfileForm(instance=profile)
	pwsafe = request.user.profile.pwsafe_set.all()
	if request.method == 'POST':
		form = ProfileForm(request.POST, request.FILES, instance=profile)
		if form.is_valid():
			form.save()
	context = {'form':form, 'pwsafe': pwsafe}
	return render(request, 'accounts/account_settings.html', context)


class UserView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/portefolio.html'  
 
    def get(self, request):
        context = {}
        profile = request.user.profile
        portefolio = request.user.profile.portefolio_set.all()
        validations = Work.objects.filter(lettremission__validator__user=profile).filter(statut__in=[1]).exclude(supervised=True)
        works = Work.objects.filter(lettremission__portefolio__user=profile).filter(statut__in=[0,1,3]).exclude(supervised=True)
        claims = Claim.objects.filter(lettremission__portefolio__user=profile).filter(statut__in=[0,1])
        bilans = Work.objects.filter(lettremission__portefolio__user=profile).filter(statut__in=[0,1,3]).filter(task__in=[409,408, 310, 401, 304]).exclude(supervised=True)

        context = {'bilans':bilans,'claims':claims,'portefolio':portefolio, 'validations':validations,'works':works}   
        return render(request, self.template_name, context)


class UserSituationView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/portefolio_situation.html'  
     
    def get(self, request):
        context = {}
        portefolio = request.user.profile.portefolio_set.all()        
        context = {'portefolio':portefolio}   
        return render(request, self.template_name, context)
    
    
class UserValidationView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/validation_tdb.html'
 
    def get(self, request):
        context = {}
        profile = request.user.profile
        validations = Work.objects.filter(lettremission__validator__user=profile).filter(statut__in=[1]).exclude(supervised=True)

        context = {'profile' : profile,
            'validations':validations}   
        return render(request, self.template_name, context)


class UserEditionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/portefolio_edition.html'  
     
    def get(self, request):
        context = {}
        portefolio = request.user.profile.portefolio_set.all()        
        context = {'portefolio':portefolio}   
        return render(request, self.template_name, context)


class CompanyEditionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/company_edition.html'  
     
    def get(self, request, pk):
        context = {}
        profile = request.user.profile
        company=Company.objects.get(pk=pk)
        # document = Document()
        # document.add_heading(str(company.name), 0)
        
        # document.save('test.docx')

        context = {'profile':profile, 'company':company}
        return render(request, self.template_name, context)

class LdmEditionView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/lettremission_edition.html'  
     
    def get(self, request, pk):
        context = {}
        profile = request.user.profile
        lettremission=LettreMission.objects.get(pk=pk)
        model = DocModel.objects.all()
        context = {'profile':profile,
                   'lettremission':lettremission,
                   'model':model
                   }
        return render(request, self.template_name, context)

class LdmSituationView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/lettremission_situation.html'  
     
    def get(self, request, pk):
        context = {}
        profile = request.user.profile
        lettremission=LettreMission.objects.get(pk=pk)
        # model = DocModel.objects.all()
        context = {'profile':profile,
                   'lettremission':lettremission,
                #    'model':model
                   }
        return render(request, self.template_name, context)
    
class CompanyTdbView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/company_tdb.html'  
     
    def get(self, request, pk):
        context = {}
        profile = request.user.profile
        company=Company.objects.get(pk=pk)
        shareholders=company.shareholder_set.all()
        shareholdercompanys = ShareholderCompany.objects.filter(shareholderlink_id__company_id=company)
        representativecompanys = RepresentativeCompany.objects.filter(representativelink_id__company_id=company)
        representatives=company.representative_set.all()
        lettremissions = company.lettremission_set.all()
        contacts = company.contact_set.all()
        if 	request.user.is_staff:
            works = Work.objects.filter(lettremission__company_id=company)
            claims = Claim.objects.filter(lettremission__company_id=company)
        else:
            works = Work.objects.filter(lettremission__company_id=company).filter(lettremission__portefolio__user=profile).exclude(supervised=True)
            claims = Claim.objects.filter(lettremission__company_id=company).filter(lettremission__portefolio__user=profile)
        validations = Work.objects.filter(lettremission__validator__user=profile).filter(statut__in=[1]).exclude(supervised=True)
        # works = Work.objects.raw('SELECT * FROM "tasks_work" INNER JOIN "ordres_lettremission" ON "tasks_work"."lettremission_id"="ordres_lettremission"."id" INNER JOIN "customers_company" ON "ordres_lettremission"."company_id"="customers_company"."id" WHERE ordres_lettremission.company_id=%s', [pk,])
        context = {
            'claims':claims,
            'works':works,
            'validations':validations,
            'lettremissions':lettremissions,
            'representativecompanys':representativecompanys,
            'shareholdercompanys':shareholdercompanys,
            'representatives':representatives,'shareholders':shareholders,'company': company,
                   'contacts': contacts}
        return render(request, self.template_name, context)
    
class SituationRFView(LoginRequiredMixin, UserAccessMixin, View):
    raise_exception = True
    permission_required = 'customers.view_company'
    template_name = 'accounts/situation_rf.html'  
     
    def get(self, request):
        context = {}
        profile = request.user.profile
        # model = DocModel.objects.all()
        context = {'profile':profile,
                #    'model':model
                   }
        return render(request, self.template_name, context)