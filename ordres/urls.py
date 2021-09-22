from django import views
from django.urls import path
from .views import *
from . import views

app_name= 'ordres'
urlpatterns = [
    path('', OrdreListView.as_view(), name='ordre_list'),
    path('ordre/<uuid:pk>/', OrdreDetailView.as_view(), name='ordreDetail'), 
    path('ordre/create/', OrdreCreateView.as_view(), name='ordreCreate'), 
    path('<uuid:pk>/delete/', OrdreDeleteView.as_view(), name='ordreDelete'), 
    path('ordres/', OrdreView.as_view(), name='ordres'),
    path('ordres_invoiced/', OrdresInvoicedView.as_view(), name='ordresInvoiced'),
    path('customer/<uuid:pk>/', CustomerView.as_view(), name='customer'),
    path('services/', ServicesView.as_view(), name='services'),
    
    path('create_serviceItem/<uuid:pk>/', CreateServiceItemView.as_view(), name='createServiceItem'),
    path('update_serviceItem/<uuid:pk>/', UpdateServiceItemView.as_view(), name='updateServiceItem'),
    path('delete_serviceItem/<uuid:pk>/', DeleteServiceItemView.as_view(), name='deleteServiceItem'),
    
    path('create_outlayItem/<uuid:pk>/', CreateOutlayItemView.as_view(), name='createOutlayItem'),
    path('update_outlayItem/<uuid:pk>/', UpdateOutlayItemView.as_view(), name='updateOutlayItem'),
    path('delete_outlayItem/<uuid:pk>/', DeleteOutlayItemView.as_view(), name='deleteOutlayItem'),
    
    path('ordre/<uuid:order_id>/', views.admin_ordre_detail, name='admin_ordre_detail'),
    path('order/<uuid:order_id>/pdf/',views.admin_ordre_pdf, name='admin_ordre_pdf'),
    
    path('lettremissions/', LettreMissionView.as_view(), name='lettremissionList'),
    path('lettremissions_orph/', LettreMissionOrphView.as_view(), name='lettremissionListOrph'),
    path('create_lettremission/create/', CreateLettreMissionView.as_view(), name='createLettreMission'),
    path('lettremission/<uuid:pk>/', LettreMissionDetailView.as_view(), name='lettremissionDetail'), 

    path('update_lettremission/<uuid:pk>/', UpdateLettreMissionView.as_view(), name='updateLettreMission'),
    path('delete_lettremission/<uuid:pk>/', DeleteLettreMissionView.as_view(), name='deleteLettreMission'),
    
    path('create_portefolio/<uuid:pk>/', CreatePortefolioView.as_view(), name='createPortefolio'),
    path('update_portefolio/<uuid:pk>/', UpdatePortefolioView.as_view(), name='updatePortefolio'),
    path('delete_portefolio/<uuid:pk>/', DeletePortefolioView.as_view(), name='deletePortefolio'),

    path('create_validator/<uuid:pk>/', CreateValidatorView.as_view(), name='createValidator'),
    path('update_validator/<uuid:pk>/', UpdateValidatorView.as_view(), name='updateValidator'),
    path('delete_validator/<uuid:pk>/', DeleteValidatorView.as_view(), name='deleteValidator'),


    path('create_pwsafe/<uuid:pk>/', CreatePWSafeView.as_view(), name='createPWSafe'),
    path('update_pwsafe/<uuid:pk>/', UpdatePWSafeView.as_view(), name='updatePWSafe'),
    path('delete_pwsafe/<uuid:pk>/', DeletePWSafeView.as_view(), name='deletePWSafe'),
        
    path('create_benefitlink/<uuid:pk>/', CreateBenefitLinkView.as_view(), name='createBenefitLink'),
    path('update_benefitlink/<uuid:pk>/', UpdateBenefitLinkView.as_view(), name='updateBenefitLink'),
    path('delete_benefitlink/<uuid:pk>/', DeleteBenefitLinkView.as_view(), name='deleteBenefitLink'),
    
    path('create_benefititem/<uuid:pk>/', CreateBenefitItemView.as_view(), name='createBenefitItem'),
    path('update_benefititem/<uuid:pk>/', UpdateBenefitItemView.as_view(), name='updateBenefitItem'),
    path('delete_benefititem/<uuid:pk>/', DeleteBenefitItemView.as_view(), name='deleteBenefitItem'),
]
