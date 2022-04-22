from bootstrap_datepicker_plus import DatePickerInput
from django.forms import ModelForm
from .models import BankAcount, Company, CompanyTemps, Contact, Office, Person, Prospect, Representative, RepresentativeCompany, RepresentativeLink, Shareholder, ShareholderCompany, ShareholderLink
from ordres.models import LettreMissionLink


class PersonForm(ModelForm):
    class Meta:
        model = Person
        fields = '__all__'     
        widgets = {
            'birth_date': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }


class CompanyForm(ModelForm):
    class Meta:
        model = Company
        fields = '__all__'
        widgets = {
            'create_date': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
            'terminate_date': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
            'liquidation_date': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }
        
class OfficeForm(ModelForm):
    class Meta:
        model = Office
        fields = '__all__'
        

class ShareholderForm(ModelForm):
    class Meta:
        model = Shareholder
        fields = '__all__'
        exclude = ['company']

class BankAcountForm(ModelForm):
    class Meta:
        model = BankAcount
        fields = '__all__'
        exclude = ['company']

class ShareholderCompanyForm(ModelForm):
    class Meta:
        model = ShareholderCompany 
        fields = '__all__'
        exclude = ['shareholderlink']

class ShareholderLinkForm(ModelForm):
    class Meta:
        model = ShareholderLink 
        fields = '__all__'
        exclude = ['company']


class RepresentativeForm(ModelForm):
    class Meta:
        model = Representative 
        fields = '__all__'
        exclude = ['company']
        
class RepresentativeCompanyForm(ModelForm):
    class Meta:
        model = RepresentativeCompany 
        fields = '__all__'
        exclude = ['representativelink']

        

class RepresentativeLinkForm(ModelForm):
    class Meta:
        model = RepresentativeLink 
        fields = '__all__'
        exclude = ['company']


class ShareholderLinkForm(ModelForm):
    class Meta:
        model = ShareholderLink 
        fields = '__all__'
        exclude = ['company']
        

class ContactForm(ModelForm):
    class Meta:
        model = Contact
        fields = '__all__'    
        


class ProspectForm(ModelForm):
    class Meta:
        model = Prospect
        fields = '__all__'   
        widgets = {
            'date_contact': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }        

class LettreMissionLinkForm(ModelForm):
    class Meta:
        model = LettreMissionLink
        fields = '__all__'
        exclude = ['prospect']
        