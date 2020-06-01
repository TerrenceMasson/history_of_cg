from django.contrib import admin
from .models import *


class CategoryAdmin(admin.ModelAdmin):
    model = Category
    list_display = ('id', 'name', 'date_created', 'date_modified')


class TagAdmin(admin.ModelAdmin):
    model = Tag
    list_display = ('id', 'name', 'approved', 'date_created', 'date_modified')


class LocationAdmin(admin.ModelAdmin):
    model = Location
    list_display = ('id', 'city', 'state', 'country', 'latitude', 'longitude', 'date_created', 'date_modified')


class StoryAdmin(admin.ModelAdmin):
    model = Story
    list_display = ('id', 'title', 'page', 'published', 'date', 'user', 'date_created', 'date_modified')


class PageAdmin(admin.ModelAdmin):
    model = Page
    list_display = ('id', 'name', 'vanity_url', 'published', 'type', 'user', 'date_created', 'date_modified')


class ReviewAdmin(admin.ModelAdmin):
    model = Review
    list_display = ('type', 'user', 'story', 'page')


class UpcomingFeatureAdmin(admin.ModelAdmin):
    model = UpcomingFeature
    list_display = ('name', 'date_created', 'date_modified')


admin.site.register(Category, CategoryAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Story, StoryAdmin)
admin.site.register(Page, PageAdmin)
admin.site.register(Review, ReviewAdmin)
admin.site.register(UpcomingFeature, UpcomingFeatureAdmin)

__author__ = 'Kyle'