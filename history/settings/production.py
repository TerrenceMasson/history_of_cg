#########################
## PRODUCTION SETTINGS ##
#########################
from default import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'd9ed7eiaff0eij',                      # Or path to database file if using sqlite3.
        'USER': 'olwqqhvokshkbc',                      # Not used with sqlite3.
        'PASSWORD': '3HX2T9zzb0dwP3S36Do_mQIFFl',                  # Not used with sqlite3.
        'HOST': 'ec2-54-235-134-222.compute-1.amazonaws.com',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '5432',                      # Set to empty string for default. Not used with sqlite3.
    }
}