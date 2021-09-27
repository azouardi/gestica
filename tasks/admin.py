from django.contrib import admin

from .models import Situation, Task, Work, Benefit, BenefitLink,Claim,VATRequested,BenefitRequested, Period, BenefitItem, Account, Exercice,TaxReturn

admin.site.register(Work)
admin.site.register(Task)
admin.site.register(Benefit)
admin.site.register(BenefitLink)
admin.site.register(Claim)
admin.site.register(VATRequested)
admin.site.register(BenefitRequested)
admin.site.register(Period)
admin.site.register(BenefitItem)
admin.site.register(Account)
admin.site.register(Exercice)
admin.site.register(Situation)
admin.site.register(TaxReturn)


