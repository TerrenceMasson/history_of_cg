from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django_jasmine import urls

admin.autodiscover()

urlpatterns = patterns('history.historyofcg.views',

    ## Overriding django password change views to include request, 
    ## so this way templates will know that the user is authenticated
    url(r'^accounts/password/change/$', 'password_change'),
    url(r'^accounts/password/change/done/$', 'password_change_done'),

    # Top Level URLs
    url(r'^$', 'home', name="home"),
    url(r'^about/$', 'about'),
    url(r'^user/(?P<i>\d+)/$', 'user_page'),

    # Page URLs
    url(r'^pages/(?P<s>[-\w]+)/$', 'view_source_entries'),
    url(r'^add/page/$', 'add_page', name="add_page"),
    url(r'^edit/page/(?P<vanity_url>[-\w]+)/$', 'edit_page'),
    url(r'^unpublish/page/(?P<vanity_url>[-\w]+)/$', 'unpublish_page'),
    url(r'^publish/page/(?P<vanity_url>[-\w]+)/$', 'publish_page'),

    # Story URLs - AJAX 
    url(r'^edit/story/(?P<type>[-\w]+)/(?P<id>\d+)/$', 'edit_story'),
    url(r'^publish/story/(?P<id>\d+)/$', 'publish_story'),
    url(r'^unpublish/story/(?P<id>\d+)/$', 'unpublish_story'),
    url(r'^save/story/(?P<story_type>[-\w]+)/(?P<vanity_url>[-\w]+)/$', 'new_story'),
    url(r'^delete/story/(?P<id>\d+)/$', 'delete_story'),


    url(r'^vote/up/(?P<story_id>\d+)/$', 'up_vote_story'),
    url(r'^vote/down/(?P<story_id>\d+)/$', 'down_vote_story'),
    url(r'^vote/none/(?P<story_id>\d+)/$', 'no_vote_story'),

    url(r'^add/tag/$', "add_tag", name="add_tag"),
    url(r'^tags/(?P<app_label>[-\w]+)/(?P<model>[-\w]+)$', "search", name="djtokeninput_search"),

    url(r'^get/pages/$', 'get_pages', name='get_pages'),

    # Connections
    url(r'^add/connection/(?P<connect_to>[-\w]+)/(?P<to_connect>[-\w]+)/$', 'add_connection', name='add_connection'),
    url(r'^remove/connection/(?P<remove_to>[-\w]+)/(?P<to_remove>[-\w]+)/$', 'remove_connection', name='remove_connection'),
)

urlpatterns += patterns('', 
    # Admin URLs
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),

    (r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT}),

    # Registration App URLS
    url(r'^accounts/', include('history.registration.backends.default.urls')),
)

urlpatterns += staticfiles_urlpatterns()

# Add the Jasmine Test Suite URL if we're in DEBUG mode 
if settings.DEBUG == True:
    urlpatterns += patterns('',  url(r'^jasmine/', include('django_jasmine.urls')))
