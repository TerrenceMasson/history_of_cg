from django.db import models
from django.forms import forms
from history.base.models import BaseModel
from django.contrib.auth.models import User, UserManager
from random import choice
from history import logger


class UpcomingFeature(BaseModel):
    name = models.CharField(max_length=20)
    text = models.TextField()
    display = models.BooleanField(default=False)

# TODO: If it's possible it be amazing to get rid of this waste of a model
#  Don't know who designed this schema, but they fucked up. 
#  Also, note that there is fixture data for these in fixtures/initial_data.json
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
    approved = models.BooleanField(default=False)
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
    ## TODO: This is a really bad data desgin and IT WILL CAUSE ISSUES IN THE FUTURE
    #  The type/Category field is simply a string representing if the page is a 
    #  person, event, organization, or project, but someone created a many-to-one relationship
    #  for some reason (I'm guessing easier querying? but that seems absurd). This should be
    #  changed to just have a CharField type and the category model can be done away with.
    type = models.ForeignKey(Category)
    location = models.CharField(max_length=20, null=True, blank=True)
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
    is_deceased = models.BooleanField(default=False)
    date_deceased = models.DateField(blank=True, null=True)
    user_made = models.BooleanField(default=True)

    def __unicode__(self):
        return "---> name: %s published: %s" % (self.name, self.published)


class Story(BaseModel):
    title = models.CharField(max_length=50)
    date = models.DateField(blank=True, null=True)
    page = models.ForeignKey(Page)
    user = models.ForeignKey(User)
    source = models.CharField(max_length=200, blank=True, null=True)
    source_url = models.URLField(blank=True, null=True)
    published = models.BooleanField(default=False)
    old_id = models.PositiveIntegerField(blank=True, null=True)
    video = models.CharField(max_length=200, blank=True, null=True)
    image = models.URLField(blank=True, null=True)
    text = models.TextField(blank=True, null=True)
    deleted = models.BooleanField(default=False)

    def __unicode__(self):
        return self.title

    def type(self):
        if self.text != None and self.text != "":
            return "text"
        elif self.video != None and self.video != "":
            return "video"
        elif self.image != None and self.image != "":
            return "image"
        else:
            logger.log_simple("NO TYPE FOR STORY: " + self.title)

    @classmethod
    def types(cls):
        return ["text", "image", "video"]

class Review(BaseModel):
    type = models.CharField(choices=(("UP", "up"), ("DOWN", 'down')), max_length=4)
    user = models.ForeignKey(User)
    story = models.ForeignKey(Story)
    page = models.ForeignKey(Page)