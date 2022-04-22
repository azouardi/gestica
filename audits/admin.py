from django.contrib import admin
from .models import GeneralLedger, GLVersion, SectionModel, Section, Conclusion, AccountLead, Lead
# Register your models here.

admin.site.register(GeneralLedger)
admin.site.register(GLVersion)
admin.site.register(SectionModel)
admin.site.register(Section)
admin.site.register(Conclusion)
admin.site.register(AccountLead)
admin.site.register(Lead)

# admin.site.register()
# admin.site.register()
# admin.site.register()
# admin.site.register()
# admin.site.register()