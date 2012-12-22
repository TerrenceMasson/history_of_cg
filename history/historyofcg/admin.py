from django.contrib import admin
from models import *

class CategoryAdmin(admin.ModelAdmin):
    model = Category
    list_display = ('id', 'name', 'date_created', 'date_modified')

class TagAdmin(admin.ModelAdmin):
    model = Tag
    list_display = ('id', 'name', 'date_created', 'date_modified')

class LocationAdmin(admin.ModelAdmin):
    model = Location
    list_display = ('id', 'city', 'state', 'country', 'latitude', 'longitude', 'date_created', 'date_modified')

class EntryAdmin(admin.ModelAdmin):
    model = Entry
    list_display = ('id', 'name', 'category', 'description', 'user', 'date_1', 'date_2', 'location', 'published', 'date_created', 'date_modified')

class StoryAdmin(admin.ModelAdmin):
    model = Story
    list_display = ('id', 'title', 'page', 'date', 'user', 'date_created', 'date_modified')

class VideoStoryAdmin(StoryAdmin):
    model = VideoStory
    list_display = ('id', 'title', 'video', 'date_created', 'date_modified')

class ImageStoryAdmin(StoryAdmin):
    model = ImageStory
    list_display = ('id', 'title', 'image', 'date_created', 'date_modified')

class TextStoryAdmin(StoryAdmin):
    model = TextStory
    list_display = ('id', 'title', 'text', 'date_created', 'date_modified')

class PageAdmin(admin.ModelAdmin):
    model = Page
    list_display = ('id', 'name', 'vanity_url', 'published', 'type', 'user', 'date_created', 'date_modified')

class ConnectionAdmin(admin.ModelAdmin):
    model = Connection
    list_display = ('image',)

class ReviewAdmin(admin.ModelAdmin):
    model = Review
    list_display = ('type', 'user', 'story', 'page')

class UpcomingFeatureAdmin(admin.ModelAdmin):
    model = UpcomingFeature
    list_display = ('name', 'date_created', 'date_modified')

admin.site.register(Category, CategoryAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Entry, EntryAdmin)
admin.site.register(Story, StoryAdmin)
admin.site.register(VideoStory, VideoStoryAdmin)
admin.site.register(ImageStory, ImageStoryAdmin)
admin.site.register(TextStory, TextStoryAdmin)
admin.site.register(Page, PageAdmin)
admin.site.register(Connection, ConnectionAdmin)
admin.site.register(Review, ReviewAdmin)
admin.site.register(UpcomingFeature, UpcomingFeatureAdmin)

__author__ = 'Kyle'