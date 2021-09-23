from .base import *
import dj_database_url

DEBUG = False
ADMINS = (
('Admin', 'azouardi@gmail.com'),
)
ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'gestica.herokuapp.com', 'gestica-go.herokuapp.com']
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'Office',
        'USER': 'postgres',
        'PASSWORD': 'Sami3AOEC09',
        # 'HOST': '192.168.1.101',
        'HOST': 'localhost',
        'PORT': 5432
    }
}
dj_from_env = dj_database_url.config(conn_max_age=600)
DATABASES['default'].update(dj_from_env)

# Heroku settings.
import django_heroku
django_heroku.settings(locals())