#######################
## DEFAULT SETTINGS ##
######################
import os
import sys

PROJECT_PATH           = os.path.realpath(os.path.dirname(__file__) + '/..')
PROJECT_CONTAINER_PATH = os.path.realpath(os.path.dirname(PROJECT_PATH))
# Not sure if I should be doing this or not, but it makes things work...
sys.path.append(PROJECT_CONTAINER_PATH)

TESTING = False
DEBUG = False
TEMPLATE_DEBUG = DEBUG


ADMINS = (
    ('hocg', 'thekylemontag@gmail.com'),
    ('gowie', 'gowie.matt@gmail.com')
)
MANAGERS = ADMINS

ACCOUNT_ACTIVATION_DAYS = 7
DEFAULT_FROM_EMAIL = 'History of CG <noreply@historyofcg.com>'
EMAIL_BACKEND = 'django_ses.SESBackend'
LOGIN_REDIRECT_URL = '/'

## TODO: Move these to environment variables on Heroku
AWS_ACCESS_KEY_ID = 'AKIAIMDAZASEZ652PKHA'
AWS_SECRET_ACCESS_KEY = '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'

# Empty DATABASES hash to be overridden by environment settings
DATABASES = {}

# Honor the 'X-Forwarded-Proto' header for request.is_secure()
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

# Allow all host headers
ALLOWED_HOSTS = ['*']

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# In a Windows environment this must be set to your system time zone.
TIME_ZONE = 'US/Eastern'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = False

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale.
USE_L10N = True

# If you set this to False, Django will not use timezone-aware datetimes.
USE_TZ = False

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = ''

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
MEDIA_URL = ''

# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/home/media/media.lawrence.com/static/"
STATIC_ROOT = os.path.join( PROJECT_PATH, 'staticfiles')

# URL prefix for static files.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/static/'

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.join( PROJECT_PATH, 'historyofcg/static'),
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = ')9d)j0btj_)tbxro8pw_vbt)$gv(m$#qth@f1jw&amp;yb$z=z3p%!'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
     'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    #'historyofcg.middleware.HttpResponseNotAllowedMiddleware',
    # Uncomment the next line for simple clickjacking protection:
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

TEMPLATE_DIRS = ('history/historyofcg/templates',)

INSTALLED_APPS = (
    # Django Apps
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.webdesign',

    # Our Apps
    'history.historyofcg',
    'history.base',

    # Helper Apps
    'history.registration',
    'south',

    # Testing Apps
    'django_jasmine',
    'discover_runner',

    # Admin
    'django.contrib.admin',

)

JASMINE_TEST_DIRECTORY = os.path.join(PROJECT_PATH, 'jasmine')

ROOT_URLCONF = 'history.historyofcg.urls'

# Python dotted path to the WSGI application used by Django's runserver.
WSGI_APPLICATION = 'history.wsgi.application'

# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
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