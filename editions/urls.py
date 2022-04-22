from django.urls import path
from .views import *
from . import views
app_name= 'editions'
urlpatterns = [
        path('user_portefolio_edition/<uuid:pk>/<code_docmodel>/',  views.modelCommun, name="EditionCommun"),
        path('devis_edition/<uuid:pk>/',  views.modelDevis, name="EditionDevis"),
        path('notesynthese_edition/<uuid:pk>/',  views.modelNoteSynthese, name="EditionNoteSynthese"),

]
