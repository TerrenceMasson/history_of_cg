######################
## STAGING SETTINGS ##
######################
import os
from default import *

import sys
print >> sys.stderr, "*** RUNNING STAGING SETTINGS ***"

DEBUG = True
TEMPLATES[0]['OPTIONS']['debug'] = DEBUG

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'd35h42qdt5qleh',
        'USER': 'aujjmjyfaootpi',
        'PASSWORD': 'XFmOBtt7djazOBDp2P0tSQrfvA',
        'HOST': 'ec2-23-21-196-147.compute-1.amazonaws.com',
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