from django.db import models
from base.models import BaseModel
from django.contrib.auth.models import User, UserManager

# Create your models here.
class Category(BaseModel):
    # 1 -> person
    # 2 -> project
    # 3 -> organization
    # 4 -> event
    name = models.CharField(max_length=15)

class Tag(BaseModel):
    name = models.CharField(max_length=20)

class Location(BaseModel):
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    latitude = models.FloatField()
    longitude = models.FloatField()

class Source(BaseModel):
    name = models.CharField(max_length=50)
    url = models.URLField()

class Entry(BaseModel):
    name = models.CharField(max_length=50)
    category = models.ForeignKey(Category)
    description = models.TextField()
    user = models.ForeignKey(User)
    date_1 = models.DateTimeField()
    date_2 = models.DateTimeField()
    location = models.ForeignKey(Location)
    published = models.BooleanField()
    source = models.ForeignKey(Source)

class Story(Entry):
    title = models.CharField(max_length=50)
    date = models.DateTimeField()
    url = models.URLField()

class VideoStory(Story):
    video = models.URLField()

class ImageStory(Story):
    image = models.URLField()

class TextStory(Story):
    story = models.TextField()