##########################
## DEVELOPMENT SETTINGS ##
##########################
import os
import dj_database_url # Parse database configuration from $DATABASE_URL
from default import *

import sys
print >> sys.stderr, "*** RUNNING DEVELOPMENT SETTINGS ***"

DEBUG = True
TEMPLATES[0]['OPTIONS']['debug'] = DEBUG

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'development',
        # 'HOST': 'postgres',
        # 'HOST': 'localhost',
        'HOST': 'hocg-postgres',
        'PORT': '5432',
    }
}

# Custom logging for development
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s %(process)d %(thread)d %(message)s'
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'console': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'formatter': 'simple'
        },
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': os.path.join( PROJECT_PATH, 'log/debug_log.txt'),
            'formatter': 'verbose'
        },
    },
    'loggers': {
        '': {
             'handlers': ['console'],
             'level': 'DEBUG',
             'propagate': True,
        },
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    }
}

print >> sys.stderr, "*** FINISHED LOADING DEVELOPMENT SETTINGS ***"
