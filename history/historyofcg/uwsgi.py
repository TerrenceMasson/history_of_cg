import os
import sys
import site

os.environ['DJANGO_SETTINGS_MODULE'] = 'historyofcg.settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
socket = '0.0.0.0:49152'