from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django_jasmine import urls

admin.autodiscover()

urlpatterns = patterns('',

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'history.historyofcg.views.home'),
    url(r'^about/$', 'history.historyofcg.views.about'),
    url(r'^accounts/', include('history.registration.backends.default.urls')),

    url(r'^pages/(?P<s>[-\w]+)/$', 'history.historyofcg.views.view_source_entries'),
    url(r'^add/page/$', 'history.historyofcg.views.add_page', name="add_page"),
    url(r'^edit/page/(?P<vanity_url>[-\w]+)/$', 'history.historyofcg.views.edit_page'),
    url(r'^unpublish/page/(?P<vanity_url>[-\w]+)/$', 'history.historyofcg.views.unpublish_page'),
    url(r'^publish/page/(?P<vanity_url>[-\w]+)/$', 'history.historyofcg.views.publish_page'),

    url(r'^edit/story/(?P<type>[-\w]+)/(?P<id>\d+)/$', 'history.historyofcg.views.edit_story'),
    url(r'^publish/story/(?P<id>\d+)/$', 'history.historyofcg.views.publish_story'),
    url(r'^unpublish/story/(?P<id>\d+)/$', 'history.historyofcg.views.unpublish_story'),
    url(r'^save/story/(?P<story_type>[-\w]+)/(?P<vanity_url>[-\w]+)/$', 'history.historyofcg.views.new_story'),
    url(r'^delete/story/(?P<id>\d+)/$', 'history.historyofcg.views.delete_story'),
    url(r'^vote/up/(?P<story_id>\d+)/$', 'history.historyofcg.views.up_vote_story'),
    url(r'^vote/down/(?P<story_id>\d+)/$', 'history.historyofcg.views.down_vote_story'),
    url(r'^vote/none/(?P<story_id>\d+)/$', 'history.historyofcg.views.no_vote_story'),

    url(r'^tags/(?P<app_label>[-\w]+)/(?P<model>[-\w]+)$', "history.historyofcg.views.search", name="djtokeninput_search"),
    url(r'^get/pages/$', 'history.historyofcg.views.get_pages', name='get_pages'),

    url(r'^add/connection/(?P<connect_to>[-\w]+)/(?P<to_connect>[-\w]+)/$', 'history.historyofcg.views.add_connection', name='add_connection'),
    url(r'^remove/connection/(?P<remove_to>[-\w]+)/(?P<to_remove>[-\w]+)/$', 'history.historyofcg.views.remove_connection', name='remove_connection'),

    url(r'^user/(?P<i>\d+)/$', 'history.historyofcg.views.user_page')
)

urlpatterns += staticfiles_urlpatterns()

# Add the Jasmine Test Suite URL if we're in DEBUG mode 
if settings.DEBUG == True:
    urlpatterns += patterns('',  url(r'^jasmine/', include('django_jasmine.urls')))
