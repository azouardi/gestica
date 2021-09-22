from django.contrib import admin
from .models import BankAcount, Company, Office, BankAcount, LegalForm, Currency, RepresentativeCompany, RepresentativeLink, RoleRepresentative, Shareholder,Representative, Nationality, Country, City, Person, Contact, ShareholderCompany, ShareholderLink

class CompanyAdmin(admin.ModelAdmin):
    list_display = ("name", "ice", "identifiant_fiscal","rc", "adresse", "create_date", "fiscal_year", "legal_form")


admin.site.register(Company, CompanyAdmin)
admin.site.register(Office)
admin.site.register(BankAcount)
admin.site.register(LegalForm)
admin.site.register(Currency)
admin.site.register(Shareholder)
admin.site.register(ShareholderLink)
admin.site.register(ShareholderCompany)
admin.site.register(Representative)
admin.site.register(RepresentativeLink)
admin.site.register(Contact)
admin.site.register(Nationality)
admin.site.register(Country)
admin.site.register(City)
admin.site.register(Person)
admin.site.register(RepresentativeCompany)
admin.site.register(RoleRepresentative)