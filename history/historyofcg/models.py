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

    def __unicode__(self):
        return self.name

class Tag(BaseModel):
    name = models.CharField(max_length=20)

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
    name = models.CharField(max_length=40, unique=True)
    vanity_url = models.CharField(max_length=20, unique=True)
    tags = models.ManyToManyField(Tag)
    description = models.TextField()
    homepage = models.URLField(blank=True, null=True)
    date_established = models.DateField(blank=True, null=True)
    published = models.BooleanField(default=False)
    user = models.ForeignKey(User)
    connections = models.ManyToManyField('self', related_name=name, blank=True, null=True)

    def __unicode__(self):
        return self.name

class Source(BaseModel):
    name = models.CharField(max_length=50, unique=True)
    url = models.URLField()

    def __unicode__(self):
        return self.name

class Entry(BaseModel):
    name = models.CharField(max_length=50, unique=True)
    category = models.ForeignKey(Category)
    description = models.TextField()
    user = models.ForeignKey(User)
    date_1 = models.DateField(blank=True, null=True)
    date_2 = models.DateField(blank=True, null=True)
    location = models.ForeignKey(Location)
    published = models.BooleanField()
    source = models.ForeignKey(Source)
    page = models.ForeignKey(Page)
    tags = models.ManyToManyField(Tag)
    url = models.URLField()

    def __unicode__(self):
        return self.name

class Story(BaseModel):
    title = models.CharField(max_length=50, unique=True)
    date = models.DateTimeField(blank=True, null=True)
    page = models.ForeignKey(Page)
    tags = models.ManyToManyField(Tag)
    source = models.ForeignKey(Source)
    user = models.ForeignKey(User)

    def __unicode__(self):
        return self.title

class VideoStory(Story):
    video = models.CharField(max_length=200, unique=True)

    def save(self, *args, **kwargs):
        if "?v=" in self.video:
            self.video = self.video.split('?v=')[1]

        super(VideoStory, self).save(*args, **kwargs)

class ImageStory(Story):
    image = models.URLField(unique=True)

class TextStory(Story):
    text = models.TextField(unique=True)

class Connection(Entry):
    image = models.URLField(unique=True)