from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'base.views.home', name='home'),
    # url(r'^base/', include('base.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'historyofcg.views.home'),
    url(r'^about/', 'historyofcg.views.about'),
    url(r'^accounts/', include('registration.urls')),
    url(r'^pages/(?P<s>\w+)/', 'historyofcg.views.view_source_entries'),
    url(r'^add/page/$', 'historyofcg.views.add_page'),
    url(r'^edit/page/(?P<vanity_url>\w+)/$', 'historyofcg.views.edit_page'),
)

urlpatterns += staticfiles_urlpatterns()