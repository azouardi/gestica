

from bootstrap_datepicker_plus import DatePickerInput
from accounts.models import Portefolio
from django import forms
from django.db import models
from tasks.models import Claim, Exercice, Period, Situation, Work
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
        
class WorkForm(ModelForm):
    class Meta:
        model = Work
        fields = '__all__'
        exclude=['period']
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

class ExerciceForm(ModelForm):
    class Meta:
        model = Exercice
        fields = '__all__'
        widgets = {
            'echeance': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }

class SituationForm(ModelForm):
    class Meta:
        model = Situation
        fields = '__all__'
        exclude=['exercice']

class SituationCollForm(AdvancedModelForm):

    disabled_fields = ('exercice', 'lettremission', 'supervised')
    class Meta:
        model = Situation
        fields = '__all__'
