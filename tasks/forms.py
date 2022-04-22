

from bootstrap_datepicker_plus import DatePickerInput
from accounts.models import Portefolio
from django import forms
from django.db import models
from tasks.models import DAS, Claim, Exercice, LiasseFiscale, Period, Situation, Work, TaxReturn
from django.forms.models import ModelForm

class AdvancedModelForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(AdvancedModelForm, self).__init__(*args, **kwargs)
        for field in self.disabled_fields:
            self.fields[field].disabled = True



class PeriodForm(ModelForm):
    class Meta:
        model = Period
        fields = '__all__'
        widgets = {
            'echeance': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }
        
class WorkForm(AdvancedModelForm):
    disabled_fields = ('period', 'lettremission','task')
    class Meta:
        model = Work
        fields = '__all__'
        widgets = {
            'date_limit': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }
class WorkCollForm(AdvancedModelForm):

    disabled_fields = ('period', 'lettremission','task','date_limit', 'supervised')
    class Meta:
        model = Work
        fields = '__all__'
        widgets = {
            'date_limit': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }

class ClaimForm(ModelForm):
    class Meta:
        model = Claim
        fields = '__all__'
        exclude = ['lettremission']
        widgets = {
            'date_start': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
            'date_end': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }

class ExerciceForm(forms.ModelForm):
    class Meta:
        model = Exercice
        fields = '__all__'

class SituationForm(ModelForm):
    class Meta:
        model = Situation
        fields = '__all__'
        exclude=['exercice','supervised', 'statut']

class SituationCollForm(AdvancedModelForm):
    disabled_fields = ('exercice', 'lettremission', 'date_start','date_closing','numbre_month', 'date_ago','date_declaration',  'exempt_is' , 'date_exempt_is', 'exempt_cm' ,'date_exempt_cm','exempt_tp' , 'date_exempt_tp', 'supervised')  
    class Meta:
        model = Situation
        fields = '__all__'

class TaxReturnForm(ModelForm):
    class Meta:
        model = TaxReturn
        fields = '__all__'
        exclude=['situation','auto_genre','code_account']

class LiasseFiscaleForm(AdvancedModelForm):
    disabled_fields = ('tableliassefiscale','amount_1','amount_2')
    class Meta:
        model = LiasseFiscale
        fields = '__all__'
        exclude=['situation','auto_genre','code_table', 'ordre']

class TaxReturnCollForm(ModelForm):
    class Meta:
        model = TaxReturn
        fields = '__all__'
        exclude=['situation', 'auto_genre','code_account']
        
class TaxReturnAmountForm(AdvancedModelForm):
    disabled_fields = ('nature', 'rubrique', 'deduc_reint','taxreturn','ordre')
    class Meta:
        model = TaxReturn
        fields = '__all__'
        exclude=['situation', 'auto_genre','code_account']
 
class DASForm(ModelForm):
    class Meta:
        model = DAS
        fields = '__all__'
        exclude=['exercice', 'month','intermediate', 'supervised', 'statut']
        widgets = {
            'date_start': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
            'date_closing': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
            'date_declaration': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }
class DASCollForm(AdvancedModelForm):
    disabled_fields = ('exercice', 'month', 'lettremission', 'supervised','date_start', 'date_closing', 'date_declaration')  
    class Meta:
        model = DAS
        fields = '__all__'
