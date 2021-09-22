# pages/views.py
from django.views.generic import TemplateView
from django.shortcuts import render, redirect


class HomePageView(TemplateView):
    template_name = 'home.html'
    pass   
   
class AboutPageView(TemplateView):
    template_name = 'about.html'
    pass 
    
def home(request):
    return render(request, 'home.html')

def about(request):
    return render(request, 'about.html')

