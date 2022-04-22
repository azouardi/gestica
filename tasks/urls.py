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

    path('insert_work/<uuid:pk>/', InsertWorkView.as_view(), name='insertWork'),
    path('extradata_update/<uuid:pk>/', UpdateWorkExtraDataView.as_view(), name='ExtraDataUpdate'),
        
    path('create_claim/<uuid:pk>/', CreateClaimView.as_view(), name='createClaim'),
    path('update_claim/<uuid:pk>/', UpdateClaimView.as_view(), name='updateClaim'),
    path('delete_claim/<uuid:pk>/', DeleteClaimView.as_view(), name='deleteClaim'),

    path('exercices/', ExerciceView.as_view(), name='exerciceList'),
    path('exercices_situations/', ExerciceSituationView.as_view(), name='exerciceListSituation'),
    path('exercices_das/', ExerciceDASView.as_view(), name='exerciceListDAS'),
    path('exercice/create/', ExerciceCreateView.as_view(), name='exerciceCreate'), 
    path('exercice/<uuid:pk>/', ExerciceDetailView.as_view(), name='exerciceDetail'), 
    path('exercice_manager/<uuid:pk>/', ExerciceDetailManagerView.as_view(), name='exerciceDetailManager'), 
    path('exercice_update/<uuid:pk>/', ExerciceUpdateView.as_view(), name='exerciceUpdate'), 
    path('exercice_delete/<uuid:pk>/', ExerciceDeleteView.as_view(), name='exerciceDelete'),
    
    path('create_situation/<uuid:pk>/', CreateSituationView.as_view(), name='createSituation'),
    path('update_situation/<uuid:pk>/', UpdateSituationView.as_view(), name='updateSituation'),
    path('delete_situation/<uuid:pk>/', DeleteSituationView.as_view(), name='deleteSituation'),
    
    path('update_situation_coll/<uuid:pk>/', UpdateSituationViewColl.as_view(), name='updateSituationColl'),
    path('update_situation_section/<uuid:pk>/', UpdateSectionView.as_view(), name='updateSituationSection'),
    path('update_section_lead/<uuid:pk>/', UpdateSectionLeadView.as_view(), name='updateSectionLead'),
    path('update_data_situation_coll/<uuid:pk>/', UpdateDataSituationView.as_view(), name='updateDataOneSituation'),
    path('update_data_section/<uuid:pk>/', UpdateDataSectionView.as_view(), name='updateDataSection'),

    path('insert_situation/<uuid:pk>/', InsertSituationView.as_view(), name='insertSituation'),
    path('situationdata_update/<uuid:pk>/', UpdateSituationDataView.as_view(), name='SituationDataUpdate'),

    path('create_taxreturn/<uuid:pk>/', CreateTaxReturnView.as_view(), name='createTaxReturn'),
    path('update_taxreturn/<int:pk>/', UpdateTaxReturnView.as_view(), name='updateTaxReturn'),
    path('update_taxreturn_amount/<int:pk>/', UpdateTaxReturnAmountView.as_view(), name='updateTaxReturnAmount'),
    path('delete_taxreturn/<int:pk>/', DeleteTaxReturnView.as_view(), name='deleteTaxReturn'),   

    path('create_conclusion/<uuid:pk>/', CreateConclusionView.as_view(), name='createConclusion'),
    path('update_conclusion/<uuid:pk>/', UpdateConclusionView.as_view(), name='updateConclusion'),
    path('delete_conclusion/<uuid:pk>/', DeleteConclusionView.as_view(), name='deleteConclusion'),
    
    path('create_liasse_fiscal_table/<uuid:pk>/', CreateLiasseFiscalTableView.as_view(), name='createLiasseFiscalTable'),
    path('update_liasse_fiscal_table/<uuid:pk>/', UpdateLiasseFiscalTableView.as_view(), name='updateLiasseFiscalTable'),
    path('delete_liasse_fiscal_table/<uuid:pk>/', DeleteLiasseFiscalTableView.as_view(), name='deleteLiasseFiscalTable'),  
    path('update_data_liasse_fiscale/<uuid:pk>/', UpdateDataLiasseFiscaleView.as_view(), name='updateDataLiasseFiscale'),
    path('update_situation_liasse_fiscale/<uuid:pk>/', UpdateLiasseFiscaleView.as_view(), name='updateSituationLiasseFiscal'),

    path('exercice_das/<uuid:pk>/', ExerciceDASDetailView.as_view(), name='exerciceDASDetail'), 
    path('exercice_das_manager/<uuid:pk>/', ExerciceDASDetailManagerView.as_view(), name='exerciceDASDetailManager'), 
    path('create_das/<uuid:pk>/', CreateDASView.as_view(), name='createDAS'),
    path('update_das/<uuid:pk>/', UpdateDASView.as_view(), name='updateDAS'),
    path('delete_das/<uuid:pk>/', DeleteDASView.as_view(), name='deleteDAS'),
    path('update_dasdetail/<uuid:pk>/', UpdateDASDetailView.as_view(), name='updateDASDetail'),
    path('update_dasmatriculedetail/<uuid:pk>/', UpdateDASMatriculeDetailView.as_view(), name='updateDASMatriculeDetail'),
    path('update_dasexodetail/<uuid:pk>/', UpdateDASExoDetailView.as_view(), name='updateDASExoDetail'),
    path('update_dascssdetail/<uuid:pk>/', UpdateDASCSSDetailView.as_view(), name='updateDASCSSDetail'),
    path('update_dasfippdetail/<uuid:pk>/', UpdateDASFIPPDetailView.as_view(), name='updateDASFIPPDetail'),
    path('update_data_das_coll/<uuid:pk>/', UpdateDataDASView.as_view(), name='updateDataOneDAS'),
    path('update_data_das_mat_coll/<uuid:pk>/', UpdateDataDASMatriculeView.as_view(), name='updateDataOneDASMatricule'),
    path('update_data_das_exo_coll/<uuid:pk>/', UpdateDataDASExoView.as_view(), name='updateDataOneDASExo'),
    path('update_data_das_css_coll/<uuid:pk>/', UpdateDataDASCSSView.as_view(), name='updateDataOneDASCSS'),
    path('update_data_das_fipp_coll/<uuid:pk>/', UpdateDataDASFIPPView.as_view(), name='updateDataOneDASFIPP'),
    path('insert_das/<uuid:pk>/', InsertDASView.as_view(), name='insertDAS'),
    path('dasdata_update/<uuid:pk>/', UpdateDASDataView.as_view(), name='DASDataUpdate'),
    path('dasdata_update_att/<uuid:pk>/', UpdateDASDataAttenteView.as_view(), name='DASDataUpdateAttente'),

]