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

class SourceAdmin(admin.ModelAdmin):
    model = Source
    list_display = ('id', 'name', 'url', 'date_created', 'date_modified')

class EntryAdmin(admin.ModelAdmin):
    model = Entry
    list_display = ('id', 'name', 'category', 'description', 'user', 'date_1', 'date_2', 'location', 'published', 'source', 'date_created', 'date_modified')

class StoryAdmin(admin.ModelAdmin):
    model = Story
    list_display = ('id', 'title', 'page', 'date', 'url', 'date_created', 'date_modified')

class VideoStoryAdmin(admin.ModelAdmin):
    model = VideoStory
    list_display = ('id', 'video', 'date_created', 'date_modified')

class ImageStoryAdmin(admin.ModelAdmin):
    model = ImageStory
    list_display = ('id', 'image', 'date_created', 'date_modified')

class TextStoryAdmin(admin.ModelAdmin):
    model = TextStory
    list_display = ('id', 'story', 'date_created', 'date_modified')

class PageAdmin(admin.ModelAdmin):
    model = Page
    list_display = ('title', 'date_created', 'date_modified')

class ConnectionAdmin(admin.ModelAdmin):
    model = Connection
    list_display = ('image',)

admin.site.register(Category, CategoryAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Source, SourceAdmin)
admin.site.register(Entry, EntryAdmin)
admin.site.register(Story, StoryAdmin)
admin.site.register(VideoStory, VideoStoryAdmin)
admin.site.register(ImageStory, ImageStoryAdmin)
admin.site.register(TextStory, TextStoryAdmin)
admin.site.register(Page, PageAdmin)
admin.site.register(Connection, ConnectionAdmin)

__author__ = 'Kyle'