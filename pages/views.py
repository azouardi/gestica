# pages/views.py
from django.views.generic import TemplateView
from django.shortcuts import render, redirect
from django.contrib.auth.models import User, Group
from accounts.models import Manager, Portefolio

from ordres.models import LettreMission
from tasks.models import Claim, Situation, Work


class HomePageView(TemplateView):
       
    template_name = 'home.html'
    def get(self, request):
        user = request.user.id
        # if User.objects.filter(pk=user, groups__name='Managers').exists():
        portefeuil_coll = Portefolio.objects.filter(user=user).filter(lettremission__terminate=False).order_by('lettremission__company__name')
        portefeuil_coll_tache ={}
        portefeuil_coll_list =[]
        for i in portefeuil_coll:
            works = Work.objects.filter(lettremission=i.lettremission_id).filter(supervised=False).exclude(statut__in=[2,4])
            claims = Claim.objects.filter(lettremission=i.lettremission_id).filter(supervised=False).exclude(statut__in=[2,4])
            works_count =  works.count()
            claims_count = claims.count()
            portefeuil_coll_tache['Dossier'] = i.lettremission.company.name
            portefeuil_coll_tache['Tache'] = works_count
            portefeuil_coll_tache['Requete'] = claims_count
            portefeuil_coll_tache['ID'] = i.lettremission.company.id
            c_portefeuil_coll_tache=portefeuil_coll_tache.copy()
            portefeuil_coll_list.append(c_portefeuil_coll_tache)

        bilans = Work.objects.filter(lettremission__portefolio__user=user).filter(statut__in=[0,1,3]).filter(task__in=[409,408, 310, 401, 304]).exclude(supervised=True)
        validations = Work.objects.filter(lettremission__validator__user=user).filter(task__validator_manager=False).filter(statut__in=[1]).exclude(supervised=True)

        # w_0 = works.filter(statut=0).count()
        # w_1 = works.filter(statut=1).count()
        # w_3 = works.filter(statut=3).count()
        context = {'bilans':bilans, 'validations':validations,'portefeuil_coll_list':portefeuil_coll_list}
  
        return render(request, self.template_name, context)
   
   
class AboutPageView(TemplateView):
    template_name = 'about.html'
    pass 
    
def home(request):
    return render(request, 'home.html')

def about(request):
    return render(request, 'about.html')

