import os
import sys
import site

site.addsitedir('/path/to/your/virtualenv/lib/python2.6/site-packages')

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()