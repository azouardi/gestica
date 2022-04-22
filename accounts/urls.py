# accounts/urls.py
from django import views
from django.urls import path, reverse_lazy
from django.contrib.auth import views as auth_views
from accounts.views import *
from . import views



app_name= 'accounts'
urlpatterns = [
	path('register/', views.registerPage, name="register"),
	path('login/', views.loginPage, name="login"),  
	path('logout/', views.logoutUser, name="logout"),
 
    path('user_portefolio/', UserView.as_view(), name="userPortefolio"),
    path('user_portefolio_manager/', UserManagerView.as_view(), name="userPortefolioManager"),
    path('user_portefolio_situation/', UserSituationView.as_view(), name="userPortefolioSituation"),
    path('user_portefolio_das/', UserDASView.as_view(), name="userPortefolioDAS"),
    path('user_supervision_situation/', UserSupervisionView.as_view(), name="userSupervisionSituation"),
    path('user_supervision_das/', UserSupervisionDASView.as_view(), name="userSupervisionDAS"),
    path('user_validation/', UserValidationView.as_view(), name="userValidation"),
    path('user_portefolio_edition/', UserEditionView.as_view(), name="userPortefolioEdition"),
    path('user_portefolio_edition_manager/', UserManagerEditionView.as_view(), name="userPortefolioEditionManager"),
    path('account/', views.accountSettings, name="account"),
    path('company_tdb/<uuid:pk>/', CompanyTdbView.as_view(), name='companyTdb'),
    path('ldm_edition/<uuid:pk>/', LdmEditionView.as_view(), name='LdmEdition'),
    path('ldm_situation/<uuid:pk>/', LdmSituationView.as_view(), name='LdmSituation'),
    path('ldm_das/<uuid:pk>/', LdmDASView.as_view(), name='LdmDAS'),
    path('situation_rf/', SituationRFView.as_view(), name='situationRF'),

    path('password_reset/',
          auth_views.PasswordResetView.as_view(template_name='accounts/password_reset.html',success_url=reverse_lazy('accounts:password_reset_done')),
               name="password_reset"),

    path('password_reset_sent/',
          auth_views.PasswordResetDoneView.as_view(template_name='accounts/password_reset_sent.html'),
          name="password_reset_done"),

    path('reset/<uidb64>/<token>/',
          auth_views.PasswordResetConfirmView.as_view(template_name='accounts/password_reset_form.html',success_url=reverse_lazy('accounts:password_reset_complete')),
          name="password_reset_confirm"),

    path('password_reset_complete/',
          auth_views.PasswordResetCompleteView.as_view(template_name='accounts/password_reset_done.html'),
          name="password_reset_complete"),

      
]