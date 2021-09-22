# pages/urls.py
from django.urls import path
from .views import HomePageView, AboutPageView # new
from . import views

urlpatterns = [
    path('', HomePageView.as_view(), name='home'),
    path('about/', AboutPageView.as_view(), name='about'),
    path('about/', views.about, name='about'),
    path('', views.home, name='home'),
]
