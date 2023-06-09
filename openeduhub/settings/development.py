from .base import *

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-$iag-5rh#klc1z452r4fkt-e!*e#e5cxqbe72bn6v4^aesz4$y'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'openeduhub',
        'USER': 'rashid',
        'PASSWORD': 'rashid',
        'HOST': 'db',
        'PORT': '5432',
    }
}

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.0/howto/static-files/

STATIC_URL = 'static/'
STATIC_ROOT = ROOT_DIR / 'root'
STATICFILES_DIRS = [
    ROOT_DIR / 'static',
]

MEDIA_URL = 'media/'
MEDIA_ROOT = ROOT_DIR / 'uploads'
