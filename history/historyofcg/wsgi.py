from django.conf import settings
from django.core.wsgi import get_wsgi_application
from dj_static import Cling
import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "history.settings")
settings.configure()

application = Cling(get_wsgi_application())

__author__ = 'Kyle'
