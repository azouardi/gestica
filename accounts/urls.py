# accounts/urls.py
from django import views
from django.urls import path
from accounts.views import *
from . import views


app_name= 'accounts'
urlpatterns = [
    #path('portefolio/', PortefolioListView.as_view(), name='portefolio_list'),
	path('register/', views.registerPage, name="register"),
	path('login/', views.loginPage, name="login"),  
	path('logout/', views.logoutUser, name="logout"),
    path('user_portefolio/', UserView.as_view(), name="userPortefolio"),
    path('user_portefolio_situation/', UserSituationView.as_view(), name="userPortefolioSituation"),
    path('user_validation/', UserValidationView.as_view(), name="userValidation"),
    path('user_portefolio_edition/', UserEditionView.as_view(), name="userPortefolioEdition"),
    path('account/', views.accountSettings, name="account"),
    path('company_tdb/<uuid:pk>/', CompanyTdbView.as_view(), name='companyTdb'),
    # path('company_edition/<uuid:pk>/', CompanyEditionView.as_view(), name='companyEdition'),
    path('ldm_edition/<uuid:pk>/', LdmEditionView.as_view(), name='LdmEdition'),
    path('ldm_situation/<uuid:pk>/', LdmSituationView.as_view(), name='LdmSituation'),
    #path('accounts/', AccountSetting.as_view(), name='account'),
    #path('accounts/<int:pk>/', AccountSettingView.as_view(), name='account'),

    #path('lettremission_tdb/<uuid:pk>/', LettreMissionTdbView.as_view(), name='lettremissionTdb'),

]