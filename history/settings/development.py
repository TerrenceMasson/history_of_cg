##########################
## DEVELOPMENT SETTINGS ##
##########################
import os
import dj_database_url # Parse database configuration from $DATABASE_URL
from default import *

DEBUG = True
TEMPLATE_DEBUG = DEBUG

DATABASES['default'] = dj_database_url.config(default='postgres://localhost/hocg')

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
            'level': 'DEBUG',
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

