####################
## TEST SETTINGS ##
###################
from default import *

import sys
print >> sys.stderr, "*** RUNNING TEST SETTINGS ***"

TESTING = True
DEBUG = True
TEMPLATE_DEBUG = DEBUG


## Test Settings
TEST_RUNNER = "discover_runner.DiscoverRunner"
TEST_DISCOVER_TOP_LEVEL = PROJECT_PATH
TEST_DISCOVER_ROOT = PROJECT_PATH
TEST_DISCOVER_PATTERN = "test_*"

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


