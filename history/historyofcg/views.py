from django.shortcuts import render_to_response
from django.views.decorators.http import require_safe
from models import *
# Create your views here.
@require_safe
def home(request):
    updated_entries = TextStory.objects.all()

    return render_to_response('default/home.html', locals())

@require_safe
def about(request):
    return render_to_response('default/about.html', locals())

@require_safe
def view_source_entries(request, s):
    image_stories = ImageStory.objects.filter(page__title = s)
    text_stories = TextStory.objects.filter(page__title = s)
    video_stories = VideoStory.objects.filter(page__title = s)

    page = Page.objects.get(title=s)

    return render_to_response('pages/entries.html', locals())

@require_safe
def add_entry(request):
    pass