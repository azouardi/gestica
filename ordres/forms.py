from bootstrap_datepicker_plus import DatePickerInput
from tasks.models import BenefitItem, BenefitLink
from accounts.models import Portefolio, Validator, Manager
from django.forms import ModelForm
from .models import Ordre, ServiceItem, OutlayItem, LettreMission

class OrdreForm(ModelForm):
    class Meta:
        model = Ordre
        fields = '__all__'
        widgets = {
            'ordre_date': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }

class ServiceItemForm(ModelForm):
    class Meta:
        model = ServiceItem
        fields = '__all__'
        exclude = ['ordre']

class OutlayItemForm(ModelForm):
    class Meta:
        model = OutlayItem
        fields = '__all__'
        exclude = ['ordre']
            

class LettreMissionForm(ModelForm):
    class Meta:
        model = LettreMission
        fields = '__all__'
        widgets = {
            'entry_date': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
            'leave_date': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }        


class PortefolioForm(ModelForm):
    class Meta:
        model = Portefolio
        fields = '__all__'
        exclude = ['lettremission']
        
class ValidatorForm(ModelForm):
    class Meta:
        model = Validator
        fields = '__all__'
        exclude = ['lettremission']



class ManagerForm(ModelForm):
    class Meta:
        model = Manager
        fields = '__all__'
        exclude = ['lettremission']        
class BenefitLinkForm(ModelForm):
    class Meta:
        model = BenefitLink
        fields = '__all__'
        exclude = ['lettremission']
        
class BenefitItemForm(ModelForm):
    class Meta:
        model = BenefitItem
        fields = '__all__'
        exclude = ['benefitlink']