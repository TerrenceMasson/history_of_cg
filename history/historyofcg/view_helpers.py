from django.http import HttpResponse
from django.utils import simplejson
from django.core import serializers
from base.models import BaseModel

import logger

class JsonResponse(HttpResponse):
    """ JSON response """
    def __init__(self, content, mimetype='application/json', status=None, content_type=None):
        if isinstance(content, BaseModel):
            logger.log("content is of type BaseModel")
            content = serializers.serialize("json", [content])
        elif isinstance(content, dict):
            content = simplejson.dumps(content),
        else:
            logger.log("JsonResponse content is of unknown type.")
        super(JsonResponse, self).__init__(
            content=content,
            mimetype=mimetype,
            status=status,
            content_type=content_type,
        )


def save_story(form, story):
    logger.log("save_story called")
    data = form.cleaned_data
    story.title = data['title']
    story.date = data['date']
    story.source = data['source']
    story.text = data['text']
    # TODO: Need to finish this to work for Images/Video
    return story