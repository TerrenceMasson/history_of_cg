######################
## STAGING SETTINGS ##
######################
import os
from .default import *

import sys
print("*** RUNNING STAGING SETTINGS ***", file=sys.stderr)

DEBUG = True
TEMPLATES[0]['OPTIONS']['debug'] = DEBUG

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'dfkn4o32i0mhkr',
        'USER': 'crbgynglqugddq',
        'PASSWORD': '8bfced0fc50a210f5ac6a0611c0a43bbbc64909fcf0f04abd1c1efc98102565d',
        'HOST': 'ec2-54-83-49-44.compute-1.amazonaws.com',
        'PORT': '5432'
    }
}

# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}