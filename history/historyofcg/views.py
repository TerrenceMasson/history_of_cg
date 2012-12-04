import json
from django import http
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponseRedirect, Http404, HttpResponse, HttpResponseNotFound
from django.shortcuts import render_to_response, render, redirect, get_object_or_404
from django.template import RequestContext
from django.views.decorators.http import require_safe
from base.decorators import render_to
from forms import PageForm, StoryForm
from models import *
from django.views.decorators.http import require_POST

# Create your views here.
@require_safe
def home(request):
    updated_entries = TextStory.objects.all()

    return render_to_response('default/home.html', locals())

@require_safe
def about(request):
    return render_to_response('default/about.html', locals())

@require_safe
@render_to('pages/entries.html')
def view_source_entries(request, s):
    image_stories = ImageStory.objects.filter(page__vanity_url = s)
    text_stories = TextStory.objects.filter(page__vanity_url = s)
    video_stories = VideoStory.objects.filter(page__vanity_url = s)
    all_stories = Story.objects.filter(page__vanity_url = s)

    page = Page.objects.get(vanity_url=s, user=request.user)

    return locals()

#@require_safe
#@require_POST
@render_to('pages/add.html')
def add_page(request):
    if request.method == 'POST':
        form = PageForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Create the Page
            page_type = form.cleaned_data['type']
            page_name = form.cleaned_data['name']
            page_description = form.cleaned_data['description']
            page_vanity_url = form.cleaned_data['vanity_url']
            page_tags = form.cleaned_data['tags']
            page_homepage = form.cleaned_data['homepage']
            page_date = form.cleaned_data['date_established']

            page = Page.objects.create(
                type = page_type,
                name = page_name,
                description = page_description,
                vanity_url = page_vanity_url,
                homepage = page_homepage,
                date_established = page_date
            )

            page.save()

            page.tags = page_tags
            page.save()

            print 'page saved'
            return redirect('/pages/{}'.format(page_vanity_url)) # Redirect after POST
        else:
            print 'invalid form'
    else:
        form = PageForm()

    return locals()

@require_safe
@render_to('pages/edit.html')
def edit_page(request, vanity_url):
    page = Page.objects.get(vanity_url = vanity_url)
    user_stories = Story.objects.filter(user__id = request.user.id)
    connections = Connection.objects.filter(page__vanity_url = vanity_url)

    if request.method == 'POST':
        form = PageForm(request.POST)
        if form.is_valid():

            return redirect('/pages/{}'.format(vanity_url))
    else:
        form = PageForm(instance=page)

    return locals()

def _tokens(query_set, keys=("id", "name")):
    return map(
        lambda v: dict(zip(keys, v)),
        query_set.values_list(*keys))

def search(req, app_label, model):
    content_type = get_object_or_404(ContentType, app_label=app_label, model=model)
    model = content_type.model_class()

    if hasattr(model, "search"):
        if "q" in req.GET:
            query_set = model.search(req.GET["q"])
            tokens = _tokens(query_set)

        else:
            tokens = []

        return http.HttpResponse(
            json.dumps(tokens),
            content_type="application/json")

    else:
        raise http.Http404

@require_POST
def unpublish_page(request, vanity_url):
    page = Page.objects.get(vanity_url = vanity_url)
    page.published = False
    page.save()

    return HttpResponse('')

@require_POST
def publish_page(request, vanity_url):
    page = Page.objects.get(vanity_url = vanity_url)
    page.published = True
    page.save()

    return HttpResponse('')

@require_safe
def share_story(request, vanity_url):
    page = Page.objects.get(vanity_url = vanity_url)
    if request.user.is_authenticated():
        form = StoryForm()

    return render_to_response('pages/add_story.html', locals(), context_instance=RequestContext(request))
