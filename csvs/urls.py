from django.urls import path
from .views import *
from . import views


app_name= 'csvs'
urlpatterns = [
    path('csvs/csv/', views.upload_file_view, name='upload_view'),
]