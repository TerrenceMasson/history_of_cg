#####################
##   Base models   ##
#####################

from django.db import models

# Create your models here.
class BaseModel(models.Model):
    """
    Base abstract model
    """
    date_created = models.DateTimeField(auto_now_add=True)
    date_modified = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True