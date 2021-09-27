# tasks/urls.py
from django.contrib.auth import views
from django.urls import path
from .views import *
from . import views


app_name= 'tasks'
urlpatterns = [
    
    path('periods/', PeriodView.as_view(), name='periodList'),
    path('period/create/', PeriodCreateView.as_view(), name='periodCreate'), 
    path('period/<uuid:pk>/', PeriodDetailView.as_view(), name='periodDetail'), 
    path('period_update/<uuid:pk>/', PeriodUpdateView.as_view(), name='periodUpdate'), 
    path('period_delete/<uuid:pk>/', PeriodDeleteView.as_view(), name='periodDelete'),
    
    path('create_work/<uuid:pk>/', CreateWorkView.as_view(), name='createWork'),
    path('update_work/<uuid:pk>/', UpdateWorkView.as_view(), name='updateWork'),
    path('delete_work/<uuid:pk>/', DeleteWorkView.as_view(), name='deleteWork'),   
    path('update_work_coll/<uuid:pk>/', UpdateWorkViewColl.as_view(), name='updateWorkColl'),
    path('update_work_sup/<uuid:pk>/', UpdateWorkViewSup.as_view(), name='updateWorkSup'),

    # path('insert_work/<uuid:pk>/', views.insert_view, name='insertWork2'),
    path('insert_work/<uuid:pk>/', InsertWorkView.as_view(), name='insertWork'),
    path('extradata_update/<uuid:pk>/', UpdateWorkExtraDataView.as_view(), name='ExtraDataUpdate'),
    
    
    path('create_claim/<uuid:pk>/', CreateClaimView.as_view(), name='createClaim'),
    path('update_claim/<uuid:pk>/', UpdateClaimView.as_view(), name='updateClaim'),
    path('delete_claim/<uuid:pk>/', DeleteClaimView.as_view(), name='deleteClaim'),

    path('exercices/', ExerciceView.as_view(), name='exerciceList'),
    path('exercice/create/', ExerciceCreateView.as_view(), name='exerciceCreate'), 
    path('exercice/<uuid:pk>/', ExerciceDetailView.as_view(), name='exerciceDetail'), 
    path('exercice_update/<uuid:pk>/', ExerciceUpdateView.as_view(), name='exerciceUpdate'), 
    path('exercice_delete/<uuid:pk>/', ExerciceDeleteView.as_view(), name='exerciceDelete'),
    
    path('create_situation/<uuid:pk>/', CreateSituationView.as_view(), name='createSituation'),
    path('update_situation/<uuid:pk>/', UpdateSituationView.as_view(), name='updateSituation'),
    path('delete_situation/<uuid:pk>/', DeleteSituationView.as_view(), name='deleteSituation'),
    
    path('update_situation_coll/<uuid:pk>/', UpdateSituationViewColl.as_view(), name='updateSituationColl'),
    path('update_situation_sup/<uuid:pk>/', UpdateSituationViewSup.as_view(), name='updateSituationSup'),

    path('insert_situation/<uuid:pk>/', InsertSituationView.as_view(), name='insertSituation'),
    path('situationdata_update/<uuid:pk>/', UpdateSituationDataView.as_view(), name='SituationDataUpdate'),


    path('create_taxreturn/<uuid:pk>/', CreateTaxReturnView.as_view(), name='createTaxReturn'),
    path('update_taxreturn/<uuid:pk>/', UpdateTaxReturnView.as_view(), name='updateTaxReturn'),
    path('delete_taxreturn/<uuid:pk>/', DeleteTaxReturnView.as_view(), name='deleteTaxReturn'),   
    path('update_taxreturn_coll/<uuid:pk>/', UpdateTaxReturnViewColl.as_view(), name='updateTaxReturnColl'),
    path('update_taxreturn_sup/<uuid:pk>/', UpdateTaxReturnViewSup.as_view(), name='updateTaxReturnSup'),
    
]