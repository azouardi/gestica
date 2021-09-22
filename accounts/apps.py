from django.apps import AppConfig
from accounts import *

class AccountsConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'accounts'  
    
    def ready(self):
        import accounts.signals
