from django.db import models
from django.forms import forms
from base.models import BaseModel
from django.contrib.auth.models import User, UserManager
from random import choice

class UpcomingFeature(BaseModel):
    name = models.CharField(max_length=20)
    text = models.TextField()
    display = models.BooleanField()

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
    approved = models.BooleanField()
    old_id = models.PositiveIntegerField(blank=True, null=True)

    def __unicode__(self):
        return self.name

    @classmethod
    def search(cls, query):
        return cls.objects.filter(name__icontains=query)

class Location(BaseModel):
    city = models.CharField(max_length=50, unique=True)
    state = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    latitude = models.FloatField(blank=True, null=True, unique=True)
    longitude = models.FloatField(blank=True, null=True, unique=True)

    def __unicode__(self):
        return self.city

class Page(BaseModel):
    type = models.ForeignKey(Category)
    name = models.CharField(max_length=100, unique=True)
    vanity_url = models.CharField(max_length=100, unique=True)
    tags = models.ManyToManyField(Tag)
    description = models.TextField()
    homepage = models.URLField(blank=True, null=True)
    date_established = models.DateField(blank=True, null=True)
    published = models.BooleanField(default=False)
    user = models.ForeignKey(User)
    connections = models.ManyToManyField('self', related_name=name, blank=True, null=True)
    image = models.URLField(blank=True, null=True)
    old_id = models.PositiveIntegerField(blank=True, null=True)

    def __unicode__(self):
        return self.name

class Story(BaseModel):
    title = models.CharField(max_length=50)
    date = models.DateField(blank=True, null=True)
    page = models.ForeignKey(Page)
    user = models.ForeignKey(User)
    source = models.CharField(max_length=200, blank=True, null=True)
    published = models.BooleanField(default=False)
    old_id = models.PositiveIntegerField(blank=True, null=True)

    def __unicode__(self):
        return self.title

class Review(BaseModel):
    type = models.CharField(choices=(("UP","up"),("DOWN", 'down')), max_length=4)
    user = models.ForeignKey(User)
    story = models.ForeignKey(Story)
    page = models.ForeignKey(Page)

class VideoStory(Story):
    video = models.CharField(max_length=200)

    def save(self, *args, **kwargs):
        if "?v=" in self.video:
            self.video = self.video.split('?v=')[1]

        super(VideoStory, self).save(*args, **kwargs)

class ImageStory(Story):
    image = models.URLField()

class TextStory(Story):
    text = models.TextField()