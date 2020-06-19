#########################
## PRODUCTION SETTINGS ##
#########################
from .default import *
import dj_database_url
import sys

print("*** RUNNING PRODUCTION SETTINGS ***", file=sys.stderr)
print("*** STATICFILES DIRS: ***",  STATICFILES_DIRS, file=sys.stderr)
print("*** STATIC ROOT: ***", STATIC_ROOT, file=sys.stderr)

# These credentials have been changed by Heroku as part of rolling the database to a new instance on their side.
# TODO: Remove this config and update/confirm use of Heroku set DATABASE_URL var.
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'd9ed7eiaff0eij',
        'USER': 'olwqqhvokshkbc',
        'PASSWORD': '3HX2T9zzb0dwP3S36Do_mQIFFl',
        'HOST': 'ec2-54-235-134-222.compute-1.amazonaws.com',
        'PORT': '5432',
    }
}

db_from_env = dj_database_url.config()
DATABASES['default'].update(db_from_env)

SECURE_SSL_REDIRECT = True
