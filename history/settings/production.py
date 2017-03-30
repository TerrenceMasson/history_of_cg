#########################
## PRODUCTION SETTINGS ##
#########################
from default import *
import dj_database_url
import sys

print >> sys.stderr, "*** RUNNING PRODUCTION SETTINGS ***"
print >> sys.stderr, "*** STATICFILES DIRS: ***",  STATICFILES_DIRS
print >> sys.stderr, "*** STATIC ROOT: ***", STATIC_ROOT

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'd9ed7eiaff0eij',
        'USER': 'olwqqhvokshkbc',
        'PASSWORD': '3HX2T9zzb0dwP3S36Do_mQIFFl',
        'HOST': 'ec2-54-235-134-222.compute-1.amazonaws.com',
        'PORT': '5432',
    }
}

db_from_env = dj_database_url.config()
DATABASES['default'].update(db_from_env)

middleware = list(MIDDLEWARE_CLASSES)
middleware.append('historyofcg.middleware.HttpsRedirect')
MIDDLEWARE_CLASSES = tuple(middleware)
