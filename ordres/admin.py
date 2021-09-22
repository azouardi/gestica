import csv
import datetime
from django.http import HttpResponse
from django.urls.base import reverse
from django.utils.safestring import mark_safe
from django.contrib import admin
from .models import ModuleService, Outlay, Service, LettreMission, Ordre, ServiceItem, OutlayItem

def export_to_csv(modeladmin, request, queryset):
    opts = modeladmin.model._meta
    content_disposition = 'attachment; filename={opts.verbose_name}.csv'
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = content_disposition
    writer = csv.writer(response)
    fields = [field for field in opts.get_fields() if not \
    field.many_to_many and not field.one_to_many]
    # Write a first row with header information
    writer.writerow([field.verbose_name for field in fields])
    # Write data rows
    for obj in queryset:
        data_row = []
        for field in fields:
            value = getattr(obj, field.name)
            if isinstance(value, datetime.datetime):
                value = value.strftime('%d/%m/%Y')
            data_row.append(value)
        writer.writerow(data_row)
    return response
export_to_csv.short_description = 'Export to CSV' 

def order_detail(obj):
    url = reverse('ordres:admin_ordre_detail', args=[obj.id])
    return mark_safe(f'<a href="{url}">View</a>')

def ordre_pdf(obj):
    url = reverse('ordres:admin_ordre_pdf', args=[obj.id])
    return mark_safe(f'<a href="{url}">PDF</a>')
ordre_pdf.short_description = 'Devis'
    
class ServiceItemInline(admin.TabularInline):
    model = ServiceItem
    raw_id_fields = ['ordre']

class OutlayItemInline(admin.TabularInline):
    model = OutlayItem
    raw_id_fields = ['ordre']

@admin.register(Ordre)
class OrdreAdmin(admin.ModelAdmin):
    list_display = ['company', 'office', 'ordre_date','comment', 'statut', order_detail, ordre_pdf]
    list_filter = ['statut']
    inlines = [ServiceItemInline, OutlayItemInline]
    actions = [export_to_csv]

class ServiceInline(admin.TabularInline):
    model = Service
    raw_id_fields = ['moduleservice']

class OutlayInline(admin.TabularInline):
    model = Outlay
    raw_id_fields = ['moduleservice']

@admin.register(ModuleService)
class ModuleServiceAdmin(admin.ModelAdmin):
    list_display = ['moduleservice']
    inlines = [ServiceInline, OutlayInline]
    actions = [export_to_csv]
    
admin.site.register(Service)
admin.site.register(LettreMission)
admin.site.register(ServiceItem)
admin.site.register(OutlayItem)
admin.site.register(Outlay)
