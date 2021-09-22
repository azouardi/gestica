# accounts/admin.py
from django.contrib import admin
from .models import Profile, Scope, Portefolio, PWSafe, Validator

admin.site.register(Profile)
admin.site.register(Scope)
admin.site.register(Portefolio)
admin.site.register(PWSafe)
admin.site.register(Validator)
