# custmers/urls.py
from django.urls import path
from .views import CompanyDeleteView, CompanyView, CompanyDetailView, CompanyCreateView, ContactCreateView, ContactDeleteView, ContactDetailView, ContactView, CreateBankAcountView, CreateLettreMissionLinkView, CreateRepresentativeCompanyView, CreateRepresentativeLinkView, CreateRepresentativeView, CreateShareholderCompanyView, CreateShareholderLinkView, CreateShareholderView, DeleteBankAcountView, DeleteLettreMissionLinkView, DeleteRepresentativeCompanyView, DeleteRepresentativeView, DeleteShareholderCompanyView, DeleteShareholderView, DeleteRepresentativelinkView, DeleteshareholderlinkView, IntegrationDataView, PersonCreateView, PersonDeleteView, PersonDetailView, PersonView, ProspectCreateView, ProspectDeleteView, ProspectDetailView, ProspectView, UpdateBankAcountView, UpdateLettreMissionLinkView, UpdateRepresentativeCompanyView, UpdateRepresentativeLinkView, UpdateRepresentativeView, UpdateShareholderCompanyView, UpdateShareholderLinkView, UpdateShareholderView


app_name= 'customers'
urlpatterns = [
    path('integration_data/', IntegrationDataView.as_view(), name='integrationData'),

    path('companies/', CompanyView.as_view(), name='companyList'),
    path('company/<uuid:pk>/', CompanyDetailView.as_view(), name='companyDetail'), 
    path('company/create/', CompanyCreateView.as_view(), name='companyCreate'), 
    path('company/<uuid:pk>/', CompanyDeleteView.as_view(), name='companyDelete'),

    path('contacts/', ContactView.as_view(), name='contactList'),
    path('contact/<uuid:pk>/', ContactDetailView.as_view(), name='contactDetail'), 
    path('contact/create/', ContactCreateView.as_view(), name='contactCreate'), 
    path('contact/<uuid:pk>/', ContactDeleteView.as_view(), name='contactDelete'),

    path('prospects/', ProspectView.as_view(), name='prospectList'),
    path('prospect/<uuid:pk>/', ProspectDetailView.as_view(), name='prospectDetail'), 
    path('prospect/create/', ProspectCreateView.as_view(), name='prospectCreate'), 
    path('prospect/<uuid:pk>/', ProspectDeleteView.as_view(), name='prospectDelete'),

    path('persons/', PersonView.as_view(), name='personList'),
    path('person/<uuid:pk>/', PersonDetailView.as_view(), name='personDetail'), 
    path('person/create/', PersonCreateView.as_view(), name='personCreate'), 
    path('person/<uuid:pk>/', PersonDeleteView.as_view(), name='personDelete'),


    path('create_bankacount/<uuid:pk>/', CreateBankAcountView.as_view(), name='createBankAcount'),
    path('update_bankacount/<uuid:pk>/', UpdateBankAcountView.as_view(), name='updateBankAcount'),
    path('delete_bankacount/<uuid:pk>/', DeleteBankAcountView.as_view(), name='deleteBankAcount'),
    
    path('create_shareholder/<uuid:pk>/', CreateShareholderView.as_view(), name='createShareholder'),
    path('update_shareholder/<uuid:pk>/', UpdateShareholderView.as_view(), name='updateShareholder'),
    path('delete_shareholder/<uuid:pk>/', DeleteShareholderView.as_view(), name='deleteShareholder'),
    
    path('create_shareholdercompany/<uuid:pk>/', CreateShareholderCompanyView.as_view(), name='createShareholderCompany'),
    path('update_shareholdercompany/<uuid:pk>/', UpdateShareholderCompanyView.as_view(), name='updateShareholderCompany'),
    path('delete_shareholderompany/<uuid:pk>/', DeleteShareholderCompanyView.as_view(), name='deleteShareholderCompany'),

    path('create_shareholderlink/<uuid:pk>/', CreateShareholderLinkView.as_view(), name='createShareholderLink'),
    path('update_shareholderlink/<uuid:pk>/', UpdateShareholderLinkView.as_view(), name='updateShareholderLink'),
    path('delete_shareholderlink/<uuid:pk>/', DeleteshareholderlinkView.as_view(), name='deleteShareholderLink'),
    
    path('create_representative/<uuid:pk>/', CreateRepresentativeView.as_view(), name='createRepresentative'),
    path('update_representative/<uuid:pk>/', UpdateRepresentativeView.as_view(), name='updateRepresentative'),
    path('delete_representative/<uuid:pk>/', DeleteRepresentativeView.as_view(), name='deleteRepresentative'),
    
    path('create_representativelink/<uuid:pk>/', CreateRepresentativeLinkView.as_view(), name='createRepresentativeLink'),
    path('update_representativelink/<uuid:pk>/', UpdateRepresentativeLinkView.as_view(), name='updateRepresentativeLink'),
    path('delete_representativelink/<uuid:pk>/', DeleteRepresentativelinkView.as_view(), name='deleteRepresentativeLink'),
    
    path('create_representativecompany/<uuid:pk>/', CreateRepresentativeCompanyView.as_view(), name='createRepresentativeCompany'),
    path('update_representativecompany/<uuid:pk>/', UpdateRepresentativeCompanyView.as_view(), name='updateRepresentativeCompany'),
    path('delete_representativecompany/<uuid:pk>/', DeleteRepresentativeCompanyView.as_view(), name='deleteRepresentativeCompany'),
    
    path('create_lettremissionlink/<uuid:pk>/', CreateLettreMissionLinkView.as_view(), name='createLettreMissionLink'),
    path('update_lettremissionlink/<uuid:pk>/', UpdateLettreMissionLinkView.as_view(), name='updateLettreMissionLink'),
    path('delete_lettremissionlink/<uuid:pk>/', DeleteLettreMissionLinkView.as_view(), name='deleteLettreMissionLink'),
 
]