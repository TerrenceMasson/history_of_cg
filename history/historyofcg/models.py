from django.db import models
from history.base.models import BaseModel
from django.contrib.auth.models import User, UserManager

# Create your models here.
class Category(BaseModel):
    # 1 -> person
    # 2 -> project
    # 3 -> organization
    # 4 -> event
    name = models.CharField(max_length=15)

    def __unicode__(self):
        return self.name

class Tag(BaseModel):
    name = models.CharField(max_length=20)

    def __unicode__(self):
        return self.name

class Location(BaseModel):
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)

    def __unicode__(self):
        return self.city

class Page(BaseModel):
    title = models.CharField(max_length=20)
    description = models.TextField(null=True)

    def __unicode__(self):
        return self.title

class Source(BaseModel):
    name = models.CharField(max_length=50)
    url = models.URLField()

    def __unicode__(self):
        return self.name

class Entry(BaseModel):
    name = models.CharField(max_length=50)
    category = models.ForeignKey(Category)
    description = models.TextField()
    user = models.ForeignKey(User)
    date_1 = models.DateTimeField(blank=True, null=True)
    date_2 = models.DateTimeField(blank=True, null=True)
    location = models.ForeignKey(Location)
    published = models.BooleanField()
    source = models.ForeignKey(Source)
    page = models.ForeignKey(Page)
    tags = models.ManyToManyField(Tag)
    url = models.URLField()

    def __unicode__(self):
        return self.name

class Story(Entry):
    title = models.CharField(max_length=50)
    date = models.DateTimeField(blank=True, null=True)

    def __unicode__(self):
        return self.title

class VideoStory(Story):
    video = models.CharField(max_length=40)

    def save(self, *args, **kwargs):
        if "?v=" in self.video:
            video = self.video.split('?v=')[1].__unicode__()

        super(VideoStory, self).save(*args, **kwargs)

class ImageStory(Story):
    image = models.URLField()

class TextStory(Story):
    text = models.TextField()

class Connection(Entry):
    image = models.URLField()