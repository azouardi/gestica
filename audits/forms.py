from django.forms import ModelForm
from bootstrap_datepicker_plus import DatePickerInput
from tasks.forms import AdvancedModelForm
from .models import Conclusion, Section


class SectionForm(ModelForm):
    class Meta:
        model = Section
        fields = '__all__'
        exclude = ['section', 'situation']
        widgets = {
            'date_generation': DatePickerInput(format='%d/%m/%Y'), # default date-format %m/%d/%Y will be used
        }

class ConclusionForm(ModelForm):
    class Meta:
        model = Conclusion
        fields = '__all__'
        exclude=['section']