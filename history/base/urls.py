from django.conf.urls import include, url
from django.conf import settings

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from historyofcg import views

admin.autodiscover()

urlpatterns = [
    # Examples:
    # url(r'^$', 'base.views.home', name='home'),
    # url(r'^base/', include('base.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', views.home),
    url(r'^about/$', views.about),
    url(r'^accounts/', include('registration.backends.default.urls')),

    url(r'^pages/(?P<s>[-\w]+)/$', views.view_source_entries),
    url(r'^add/page/$', views.add_page, name="add_page"),
    url(r'^edit/page/(?P<vanity_url>[-\w]+)/$', views.edit_page),
    url(r'^unpublish/page/(?P<vanity_url>[-\w]+)/$', views.unpublish_page),
    url(r'^publish/page/(?P<vanity_url>[-\w]+)/$', views.publish_page),

    url(r'^edit/story/(?P<type>[-\w]+)/(?P<id>\d+)/$', views.edit_story),
    url(r'^publish/story/(?P<id>\d+)/$', views.publish_story),
    url(r'^unpublish/story/(?P<id>\d+)/$', views.unpublish_story),
    url(r'^save/story/(?P<story_type>[-\w]+)/(?P<vanity_url>[-\w]+)/$', views.new_story),
    url(r'^delete/story/(?P<id>\d+)/$', views.delete_story),
    url(r'^vote/up/(?P<story_id>\d+)/$', views.up_vote_story),
    url(r'^vote/down/(?P<story_id>\d+)/$', views.down_vote_story),
    url(r'^vote/none/(?P<story_id>\d+)/$', views.no_vote_story),

    url(r'^tags/(?P<app_label>[-\w]+)/(?P<model>[-\w]+)/$', views.search, name="djtokeninput_search"),
    url(r'^get/pages/$', views.get_pages, name='get_pages'),

    url(r'^add/connection/(?P<connect_to>[-\w]+)/(?P<to_connect>[-\w]+)/$', views.add_connection, name='add_connection'),
    url(r'^remove/connection/(?P<remove_to>[-\w]+)/(?P<to_remove>[-\w]+)/$', views.remove_connection, name='remove_connection'),

    url(r'^user/(?P<i>\d+)/$', views.user_page)
]

urlpatterns += staticfiles_urlpatterns()