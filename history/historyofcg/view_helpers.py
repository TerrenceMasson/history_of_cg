from django.http import HttpResponse
from django.utils import simplejson
from django.core import serializers
from history.base.models import BaseModel
import history.logger

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


def update_story(form, story):
    logger.log("save_story called")
    data = form.cleaned_data
    story.title = data['title']
    story.date = data['date']
    story.source = data['source']
    story.text = data['text']
    story.image = data['image']
    story.video = data['video']
    return story