####################
## TEST SETTINGS ##
###################
from default import *

import sys
print >> sys.stderr, "*** RUNNING TEST SETTINGS ***"

TESTING = True
DEBUG = True
TEMPLATES[0]['OPTIONS']['debug'] = DEBUG

## In-Memory Test Database
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": ":memory:",
        "USER": "",
        "PASSWORD": "",
        "HOST": "",
        "PORT": ""
    }
}

# Custom logging for testing
LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s %(process)d %(thread)d %(message)s'
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'null': {
            'level': 'DEBUG',
            'class': 'django.utils.log.NullHandler',
        },
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'simple'
        },
    },
    'loggers': {
        'history': {
             'handlers': ['console'],
             'level': 'DEBUG',
             'propagate': True,
        }, 
        'django.db': {
            'handlers': ['null'], 
            'propagate': False, 
            'level': 'DEBUG',
        }
    }
}


