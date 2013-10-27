from django.http import HttpResponse
from django.utils import simplejson
from django.core import serializers
from history.base.models import BaseModel
from models import Page
from history import logger
import re

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

def create_page(form, request):
    ## Required fields: Name, type, description, vanity_url
    page_name = form.cleaned_data['name']
    page_type = form.cleaned_data['type']
    page_description = form.cleaned_data['description']
    ## Replace anything but A-Z, a-z, 0-9 with hyphens for vanity url
    page_vanity_url = re.sub(r"[^A-Za-z0-9]+", '-', form.cleaned_data['name']).lower()
    ## If the last character is a hyphen then remove it
    if page_vanity_url[len(page_vanity_url) - 1] == "-":
        page_vanity_url = page_vanity_url[:len(page_vanity_url) - 1]

    page = Page.objects.create(name=page_name, type=page_type, vanity_url=page_vanity_url, description=page_description, user=request.user)

    ## Non Required: tags, homepage, established date, deceased date
    page.tags = form.cleaned_data['tags']
    page.homepage = form.cleaned_data['homepage']
    page.date_established = form.cleaned_data['date_established']
    page.is_deceased = form.cleaned_data['is_deceased']
    page.date_deceased = form.cleaned_data['date_deceased']

    return page