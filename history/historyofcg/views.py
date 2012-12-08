import json
import datetime
from django import http
from django.contrib.contenttypes.models import ContentType
from django.db.models import Q
from django.http import HttpResponseRedirect, Http404, HttpResponse, HttpResponseNotFound
from django.shortcuts import render_to_response, render, redirect, get_object_or_404
from django.template import RequestContext
from django.utils import simplejson
from django.views.decorators.http import require_safe
from base.decorators import render_to
from forms import PageForm, TextStoryForm, ImageStoryForm, VideoStoryForm
from models import *
from django.views.decorators.http import require_POST

# Create your views here.
#@require_safe
def home(request):
    updated_entries = TextStory.objects.all()

    return render_to_response('default/home.html', locals())

#@require_safe
def about(request):
    return render_to_response('default/about.html', locals())

#@require_safe
@render_to('pages/entries.html')
def view_source_entries(request, s):
    if request.user.is_authenticated():
        page = Page.objects.get(user__id = request.user.id, vanity_url=s)
    else:
        page = Page.objects.get(published = True, vanity_url = s)

    image_stories = ImageStory.objects.filter(page__vanity_url = s, published = True)
    text_stories = TextStory.objects.filter(page__vanity_url = s, published = True)
    video_stories = VideoStory.objects.filter(page__vanity_url = s, published = True)
    all_stories = Story.objects.filter(page__vanity_url = s, published = True)

    connections = page.connections

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
            page_image = form.cleaned_data['image']
            page_date = form.cleaned_data['date_established']

            page = Page.objects.create(
                type = page_type,
                name = page_name,
                description = page_description,
                vanity_url = page_vanity_url,
                homepage = page_homepage,
                date_established = page_date,
                user = request.user,
                image = page_image
            )
            page.save()

            page.tags = page_tags
            page.save()

            print 'page saved'
            return redirect('/edit/page/{}'.format(page_vanity_url)) # Redirect after POST
        else:
            print 'invalid form'
    else:
        form = PageForm()

    return locals()

#@require_safe
@render_to('pages/edit.html')
def edit_page(request, vanity_url):
    page = Page.objects.get(vanity_url = vanity_url, user__id = request.user.id)
    user_stories = Story.objects.filter(user__id = request.user.id, page = page)
    connections = page.connections
    user_text_stories = TextStory.objects.filter(user__id = request.user.id, page = page)
    user_image_stories = ImageStory.objects.filter(user__id = request.user.id, page = page)
    user_video_stories = VideoStory.objects.filter(user__id = request.user.id, page = page)

    if request.method == 'POST':
        form = PageForm(request.POST, instance=page)
        if form.is_valid():

            page.type = form.cleaned_data['type']
            page.name = form.cleaned_data['name']
            page.vanity_url = form.cleaned_data['vanity_url']
            page.tags = form.cleaned_data['tags']
            page.description = form.cleaned_data['description']
            page.homepage = form.cleaned_data['homepage']
            page.date = form.cleaned_data['date_established']
            page.image = form.cleaned_data['image']

            page.save()
            print 'saved'
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
        form = TextStoryForm()

    return render_to_response('pages/add_story.html', locals(), context_instance=RequestContext(request))

@require_POST
def new_story(request, story_type, vanity_url):
    if story_type == 'text':
        form = TextStoryForm(request.POST)
        print 'made form text'
        # MAKE STORY
        if form.is_valid():
            story_title = request.POST['title']
            story_text = request.POST['text']
            story_user = request.user
            story_page = Page.objects.get(vanity_url = vanity_url)
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) != 3 : return HttpResponse('')
                d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                story_date = d.strftime('%Y-%m-%d')
                TextStory.objects.create(
                        title = story_title,
                        date = story_date,
                        text = story_text,
                        user = story_user,
                        page = story_page
                    ).save()
            else :
                TextStory.objects.create(
                    title = story_title,
                    text = story_text,
                    user = story_user,
                    page = story_page
                ).save()

    if story_type == 'image':
        form = ImageStoryForm(request.POST)
        print 'made form image'
        if form.is_valid():
            story_title = request.POST['title']
            story_image = request.POST['image']
            story_page = Page.objects.get(vanity_url = vanity_url)
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) != 3 : return HttpResponse('')
                d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                story_date = d.strftime('%Y-%m-%d')

                ImageStory.objects.create(
                    title = story_title,
                    date = story_date,
                    image = story_image,
                    page = story_page,
                    user = request.user,
                ).save()
            else:
                ImageStory.objects.create(
                    title = story_title,
                    image = story_image,
                    page = story_page,
                    user = request.user,
                ).save()

    if story_type == 'video':
        form = VideoStoryForm(request.POST)
        print 'made form image'
        if form.is_valid():
            story_title = request.POST['title']
            story_video = request.POST['video']
            story_page = Page.objects.get(vanity_url = vanity_url)

            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) != 3 : return HttpResponse('')
                d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                story_date = d.strftime('%Y-%m-%d')

                VideoStory.objects.create(
                    title = story_title,
                    date = story_date,
                    video = story_video,
                    page = story_page,
                    user = request.user,
                ).save()
            else:
                VideoStory.objects.create(
                    title = story_title,
                    video = story_video,
                    page = story_page,
                    user = request.user,
                ).save()


    return redirect('/edit/page/{}'.format(vanity_url), locals())

@require_POST
def edit_story(request, type, id):
    if type == 'text':
        story = TextStory.objects.get(id = id)
        form = TextStoryForm(request.POST, instance = story)
        print 'text form'
        if form.is_valid():
            print 'valid form'
            story.title = form.cleaned_data['title']
            story.source = form.cleaned_data['source']
            story.text = form.cleaned_data['text']
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) != 3 : return HttpResponse('')
                d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                story.date = d.strftime('%Y-%m-%d')
                story.save()
            else :
                story.save()

    if type == 'image':
        story = ImageStory.objects.get(id = id)
        form = ImageStoryForm(request.POST, instance = story)
        if form.is_valid():
            print 'valid form'
            story.title = form.cleaned_data['title']
            story.source = form.cleaned_data['source']
            story.image = form.cleaned_data['image']
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) != 3 : return HttpResponse('')
                d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                story.date = d.strftime('%Y-%m-%d')
                story.save()
            else :
                story.save()

    if type == 'video':
        story = VideoStory.objects.get(id = id)
        form = VideoStoryForm(request.POST, instance = story)
        if form.is_valid():
            print 'valid form'
            story.title = form.cleaned_data['title']
            story.source = form.cleaned_data['source']
            story.video = form.cleaned_data['video']
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) != 3 : return HttpResponse('')
                d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                story.date = d.strftime('%Y-%m-%d')
                story.save()
            else :
                story.save()

    return redirect('/edit/page/{}'.format(story.page.vanity_url), locals())

@require_POST
def unpublish_story(request, id):
    story = Story.objects.get(id = id)
    story.published = False
    story.save()

    return HttpResponse('')

@require_POST
def publish_story(request, id):
    story = Story.objects.get(id = id)
    story.published = True
    story.save()

    return HttpResponse('')

def get_pages(request):
    if request.is_ajax():
        q = request.GET.get('term', '')
        pages = Page.objects.filter(name__icontains = q, published = True)[0:20]
        results = []
        for page in pages:
            page_json = {
                "name": str(page.name),
                "type": str(page.type.name),
                "vanity_url": str(page.vanity_url)
            }
            results.append(page_json)
        data = simplejson.dumps(results)
        print data
    else:
        data = 'fail'
    mimetype = 'application/json'
    return HttpResponse(data, mimetype=mimetype)

@require_POST
def add_connection(request, connect_to, to_connect):
    page_connect_to = Page.objects.get(vanity_url = connect_to, published = True)
    page_to_connect = Page.objects.get(vanity_url = to_connect, published = True)

    page_connect_to.connections.add(page_to_connect)
    page_connect_to.save()

    return HttpResponse('')

@require_POST
def remove_connection(request, remove_to, to_remove):
    page_remove_to = Page.objects.get(vanity_url = remove_to, published = True)
    page_to_remove = Page.objects.get(vanity_url = to_remove, published = True)

    page_remove_to.connections.remove(page_to_remove)
    page_remove_to.save()

    return HttpResponse('')

@require_POST
def up_vote_story(request, story):
    if request.is_ajax():
        pass