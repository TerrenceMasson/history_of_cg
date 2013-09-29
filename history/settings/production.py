#########################
## PRODUCTION SETTINGS ##
#########################
from default import *

import sys
print >> sys.stderr, "*** RUNNING PRODUCTION SETTINGS ***"

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