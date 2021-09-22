from .base import *
DEBUG = Falsegit
ADMINS = (
('Admin', 'azouardi@gmail.com'),
)
ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'https://gestica.herokuapp.com/']
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