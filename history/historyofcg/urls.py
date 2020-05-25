from django.conf.urls import include, url
from django.conf import settings
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views import static
from django_jasmine import urls

from history.historyofcg import views

admin.autodiscover()

urlpatterns = [

    ## Overriding django password change views to include request,
    ## so this way templates will know that the user is authenticated
    url(r'^accounts/password/change/$', views.password_change),
    url(r'^accounts/password/change/done/$', views.password_change_done),

    # Top Level URLs
    url(r'^$', views.home, name="home"),
    url(r'^about/$', views.about),
    url(r'^user/(?P<i>\d+)/$', views.user_page),

    url(r'^timeline/$', views.timeline),
    url(r'^timeline/(?P<vanity_url>[-\w]+)/$', views.timeline_page),

    # Page URLs
    url(r'^pages/(?P<s>[-\w]+)/$', views.view_source_entries),
    url(r'^add/page/$', views.add_page, name="add_page"),
    url(r'^edit/page/(?P<vanity_url>[-\w]+)/$', views.edit_page),
    url(r'^unpublish/page/(?P<vanity_url>[-\w]+)/$', views.unpublish_page),
    url(r'^publish/page/(?P<vanity_url>[-\w]+)/$', views.publish_page),

    # Story URLs - AJAX
    url(r'^edit/story/(?P<type>[-\w]+)/(?P<id>\d+)/$', views.edit_story),
    url(r'^publish/story/(?P<id>\d+)/$', views.publish_story),
    url(r'^unpublish/story/(?P<id>\d+)/$', views.unpublish_story),
    url(r'^save/story/(?P<story_type>[-\w]+)/(?P<vanity_url>[-\w]+)/$', views.new_story),
    url(r'^delete/story/(?P<id>\d+)/$', views.delete_story),
    url(r'^gcp_upload/$', views.gcp_upload),


    url(r'^vote/up/(?P<story_id>\d+)/$', views.up_vote_story),
    url(r'^vote/down/(?P<story_id>\d+)/$', views.down_vote_story),
    url(r'^vote/none/(?P<story_id>\d+)/$', views.no_vote_story),

    url(r'^add/tag/$', views.add_tag, name="add_tag"),
    url(r'^tags/(?P<app_label>[-\w]+)/(?P<model>[-\w]+)/$', views.search, name="djtokeninput_search"),

    url(r'^get/pages/$', views.get_pages, name='get_pages'),

    # Connections
    url(r'^add/connection/(?P<connect_to>[-\w]+)/(?P<to_connect>[-\w]+)/$', views.add_connection, name='add_connection'),
    url(r'^remove/connection/(?P<remove_to>[-\w]+)/(?P<to_remove>[-\w]+)/$', views.remove_connection, name='remove_connection'),
]

urlpatterns += [
    # Admin URLs
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),

    url(r'^static/(?P<path>.*)$', static.serve, {'document_root': settings.STATIC_ROOT}),

    # Registration App URLS
    url(r'^accounts/', include('history.registration.backends.default.urls')),
]

urlpatterns += staticfiles_urlpatterns()

# Add the Jasmine Test Suite URL if we're in DEBUG mode
if settings.DEBUG == True:
    urlpatterns += [url(r'^jasmine/', include('django_jasmine.urls'))]
