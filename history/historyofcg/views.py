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
from forms import PageForm, StoryForm
from models import *
from django.views.decorators.http import require_POST
import itertools

# Create your views here.
#@require_safe
def home(request):
    updated_entries = Page.objects.filter(published=True).order_by('-date_modified')[:4]

    if request.user.is_authenticated():
        if len(Review.objects.filter(type="UP", user__id=request.user.id)) == 1:
            show_badge1 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 2:
            show_badge2 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 3:
            show_badge3 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 4:
            show_badge4 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) >= 5:
            show_badge5 = True

    upcoming_features = UpcomingFeature.objects.filter(display=True)

    return render_to_response('default/home.html', locals())

#@require_safe
def about(request):
    if request.user.is_authenticated():
        if len(Review.objects.filter(type="UP", user__id=request.user.id)) == 1:
            show_badge1 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 2:
            show_badge2 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 3:
            show_badge3 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 4:
            show_badge4 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) >= 5:
            show_badge5 = True
    return render_to_response('default/about.html', locals())

#@require_safe
@render_to('pages/entries.html')
def view_source_entries(request, s):
    if request.user.is_authenticated():
        if len(Review.objects.filter(type="UP", user__id=request.user.id)) == 1:
            show_badge1 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 2:
            show_badge2 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 3:
            show_badge3 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 4:
            show_badge4 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) >= 5:
            show_badge5 = True

    if Page.objects.filter(published=True, vanity_url=s):
        page = Page.objects.get(published=True, vanity_url=s)
    else:
        return render_to_response('errors/entry_does_not_exist.html', locals())

    all_stories = Story.objects.filter(page__vanity_url=s, published=True)

    connections = page.connections

    tag_dict = []
    __present_values = []
    for c in connections.all():
        for tag in c.tags.all():
            if tag.name not in __present_values:
                tag_dict.append([c.type.name, tag.name])
                __present_values.append(tag.name)
    print tag_dict

    return locals()

#@require_safe
#@require_POST
@render_to('pages/add.html')
def add_page(request):
    if request.user.is_authenticated():
        if len(Review.objects.filter(type="UP", user__id=request.user.id)) == 1:
            show_badge1 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 2:
            show_badge2 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 3:
            show_badge3 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 4:
            show_badge4 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) >= 5:
            show_badge5 = True

    if request.method == 'POST':
        form = PageForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Create the Page
            page_type = form.cleaned_data['type']
            page_name = form.cleaned_data['name']
            page_description = form.cleaned_data['description']
            page_vanity_url = form.cleaned_data['name'].replace(' ', '-').replace('_', '-')
            page_tags = form.cleaned_data['tags']
            page_homepage = form.cleaned_data['homepage']
            page_date = form.cleaned_data['date_established']

            page = Page.objects.create(
                type=page_type,
                name=page_name,
                description=page_description,
                vanity_url=page_vanity_url,
                homepage=page_homepage,
                date_established=page_date,
                user=request.user
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
    if request.user.is_authenticated():
        if len(Review.objects.filter(type="UP", user__id=request.user.id)) == 1:
            show_badge1 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 2:
            show_badge2 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 3:
            show_badge3 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 4:
            show_badge4 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) >= 5:
            show_badge5 = True

    page = Page.objects.get(vanity_url=vanity_url)
    user_stories = Story.objects.filter(page=page)
    connections = page.connections
    user_text_stories = Story.objects.filter(page=page, image__isnull=True, video__isnull=True)
    user_image_stories = Story.objects.filter(page=page, text__isnull=True, video__isnull=True)
    user_video_stories = Story.objects.filter(page=page, text__isnull=True, image__isnull=True)
    print len(user_stories)

    if request.method == 'POST':
        form = PageForm(request.POST, instance=page)
        if form.is_valid():
            page.type = form.cleaned_data['type']
            page.name = form.cleaned_data['name']
            page.tags = form.cleaned_data['tags']
            page.description = form.cleaned_data['description']
            page.homepage = form.cleaned_data['homepage']
            page.date_established = form.cleaned_data['date_established']

            page.save()
            print 'saved'
            print page.date_established
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
    page = Page.objects.get(vanity_url=vanity_url)
    page.published = False
    page.save()

    return HttpResponse('')


@require_POST
def publish_page(request, vanity_url):
    page = Page.objects.get(vanity_url=vanity_url)
    page.published = True
    page.save()

    return HttpResponse('')


@require_safe
def share_story(request, vanity_url):
    page = Page.objects.get(vanity_url=vanity_url)
    if request.user.is_authenticated():
        form = StoryForm()

    return render_to_response('pages/add_story.html', locals(), context_instance=RequestContext(request))


@require_POST
def new_story(request, story_type, vanity_url):
    form = StoryForm(request.POST)
    if story_type == 'text':
        print 'made form text'
        # MAKE STORY
        if form.is_valid():
            story_title = request.POST['title']
            story_text = request.POST['text']
            story_user = request.user
            story_page = Page.objects.get(vanity_url=vanity_url)
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) == 3:
                    d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                    story_date = d.strftime('%Y-%m-%d')
                    Story.objects.create(
                        title=story_title,
                        date=story_date,
                        text=story_text,
                        user=story_user,
                        page=story_page
                    ).save()
                elif len(d) == 1:
                    d = datetime.date(int(request.POST['date']), 1, 1)
                    story_date = d.strftime('%Y-%m-%d')
                    Story.objects.create(
                        title=story_title,
                        date=story_date,
                        text=story_text,
                        user=story_user,
                        page=story_page
                    ).save()
            else:
                Story.objects.create(
                    title=story_title,
                    text=story_text,
                    user=story_user,
                    page=story_page
                ).save()

    if story_type == 'image':
        print 'made form image'
        if form.is_valid():
            story_title = request.POST['title']
            story_image = request.POST['image']
            story_page = Page.objects.get(vanity_url=vanity_url)
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) == 3:
                    d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                    story_date = d.strftime('%Y-%m-%d')

                    Story.objects.create(
                        title=story_title,
                        date=story_date,
                        image=story_image,
                        page=story_page,
                        user=request.user,
                    ).save()

                elif len(d) == 1:
                    d = datetime.date(int(request.POST['date']), 1, 1)
                    story_date = d.strftime('%Y-%m-%d')
                    Story.objects.create(
                        title=story_title,
                        date=story_date,
                        image=story_image,
                        user=story_user,
                        page=story_page
                    ).save()
            else:
                Story.objects.create(
                    title=story_title,
                    image=story_image,
                    page=story_page,
                    user=request.user,
                ).save()

    if story_type == 'video':
        print 'made form image'
        if form.is_valid():
            story_title = request.POST['title']
            story_video = request.POST['video']
            story_page = Page.objects.get(vanity_url=vanity_url)

            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) == 3:
                    d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                    story_date = d.strftime('%Y-%m-%d')

                    Story.objects.create(
                        title=story_title,
                        date=story_date,
                        video=story_video,
                        page=story_page,
                        user=request.user,
                    ).save()
                elif len(d) == 1:
                    d = datetime.date(int(request.POST['date']), 1, 1)
                    story_date = d.strftime('%Y-%m-%d')
                    Story.objects.create(
                        title=story_title,
                        date=story_date,
                        video=story_video,
                        user=story_user,
                        page=story_page
                    ).save()
            else:
                Story.objects.create(
                    title=story_title,
                    video=story_video,
                    page=story_page,
                    user=request.user,
                ).save()

    return redirect('/edit/page/{}'.format(vanity_url), locals())


@require_POST
def edit_story(request, type, id):
    story = Story.objects.get(id=id)
    form = StoryForm(request.POST, instance=story)
    print request.POST
    if type == 'text':
        print 'text form'
        if form.is_valid():
            print 'valid form'
            story.title = request.POST['title'].encode('ascii', 'replace')
            story.source = request.POST['source'].encode('ascii', 'replace') if request.POST['source'] else None
            story.text = request.POST['text'].encode('ascii', 'replace')
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) == 3:
                    d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                    story_date = d.strftime('%Y-%m-%d')
                    story.date = story_date
                elif len(d) == 1:
                    d = datetime.date(int(request.POST['date']), 1, 1)
                    story_date = d.strftime('%Y-%m-%d')
                    story.date = story_date

    if type == 'image':
        if form.is_valid():
            print 'valid form'
            story.title = request.POST['title'].encode('ascii', 'replace')
            story.image = request.POST['image'].encode('ascii', 'replace')
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) == 3:
                    d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                    story_date = d.strftime('%Y-%m-%d')
                    story.date = story_date
                elif len(d) == 1:
                    d = datetime.date(int(request.POST['date']), 1, 1)
                    story_date = d.strftime('%Y-%m-%d')
                    story.date = story_date

    if type == 'video':
        if form.is_valid():
            print 'valid form'
            story.title = request.POST['title'].encode('ascii', 'replace')
            story.video = request.POST['video'].encode('ascii', 'replace')
            if request.POST['date']:
                d = request.POST['date'].split('/')
                if len(d) == 3:
                    d = datetime.date(int(d[2]), int(d[0]), int(d[1]))
                    story_date = d.strftime('%Y-%m-%d')
                    story.date = story_date
                elif len(d) == 1:
                    d = datetime.date(int(request.POST['date']), 1, 1)
                    story_date = d.strftime('%Y-%m-%d')
                    story.date = story_date

    story.save()

    return redirect('/edit/page/{}'.format(story.page.vanity_url), locals())


@require_POST
def unpublish_story(request, id):
    story = Story.objects.get(id=id)
    story.published = False
    story.save()

    return HttpResponse('')


@require_POST
def publish_story(request, id):
    story = Story.objects.get(id=id)
    story.published = True
    story.save()

    return HttpResponse('')


def get_pages(request):
    if request.is_ajax():
        q = request.GET.get('term', '')
        pages = Page.objects.filter(name__icontains=q, published=True)[0:20]
        results = []
        for page in pages:
            page_json = {
                "name": str(page.name),
                "type": str(page.type.name),
                "vanity": str(page.vanity_url)
            }
            results.append(page_json)
        data = simplejson.dumps(results)
    else:
        data = 'fail'
    mimetype = 'application/json'
    return HttpResponse(data, mimetype=mimetype)


@require_POST
def add_connection(request, connect_to, to_connect):
    to_connect_vanity = to_connect.lower()
    to_connect_name = to_connect.replace("-", " ")
    if Page.objects.filter(vanity_url=to_connect_vanity):
        page_connect_to = Page.objects.get(vanity_url=connect_to)
        page_to_connect = Page.objects.get(vanity_url=to_connect_vanity)

        page_connect_to.connections.add(page_to_connect)
        page_connect_to.save()

    else:
        page_connect_to = Page.objects.get(vanity_url=connect_to)
        page_to_connect = Page.objects.create(
            type = Category.objects.get(id=1),
            name = to_connect_name,
            vanity_url = to_connect_vanity,
            description = "",
            published = False,
            user = request.user,
            user_made = False,
        )
        page_to_connect.save()

        page_connect_to.connections.add(page_to_connect)
        page_connect_to.save()

    return HttpResponse('')


@require_POST
def remove_connection(request, remove_to, to_remove):
    page_remove_to = Page.objects.get(vanity_url=remove_to)
    page_to_remove = Page.objects.get(vanity_url=to_remove)

    page_remove_to.connections.remove(page_to_remove)
    page_remove_to.save()

    if page_to_remove.user_made == False:
        page_to_remove.delete()

    return HttpResponse('')


@require_POST
def up_vote_story(request, story_id):
    if request.is_ajax() & request.user.is_authenticated():
        if not Review.objects.filter(story__id=story_id, type="UP"):

            if Review.objects.filter(story__id=story_id, type="DOWN"):
                Review.objects.get(story__id=story_id, type="DOWN").delete()

            _story = Story.objects.get(id=story_id)

            Review.objects.create(
                type="UP",
                user=request.user,
                story=_story,
                page=_story.page
            ).save()

            return HttpResponse('')

        return HttpResponse('')


@require_POST
def down_vote_story(request, story_id):
    if request.is_ajax() & request.user.is_authenticated():
        if not Review.objects.filter(story__id=story_id, type="DOWN"):

            if Review.objects.filter(story__id=story_id, type="UP"):
                Review.objects.get(story__id=story_id, type="UP").delete()

            _story = Story.objects.get(id=story_id)

            Review.objects.create(
                type="DOWN",
                user=request.user,
                story=_story,
                page=_story.page
            ).save()

            return HttpResponse('')

        return HttpResponse('')


@require_POST
def no_vote_story(request, story_id):
    if request.is_ajax() & request.user.is_authenticated():
        if Review.objects.filter(story__id=story_id, type="DOWN"):
            vote = Review.objects.get(story__id=story_id, type="DOWN")
            vote.delete()

            return HttpResponse('')

        return HttpResponse('')


@render_to('pages/user.html')
def user_page(request, i):
    if request.user.is_authenticated():
        if len(Review.objects.filter(type="UP", user__id=request.user.id)) == 1:
            show_badge1 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 2:
            show_badge2 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 3:
            show_badge3 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) == 4:
            show_badge4 = True

        elif len(Review.objects.filter(type="UP", user__id=request.user.id)) >= 5:
            show_badge5 = True

    if request.user.id == int(i):
        user = request.user
        user_pages = Page.objects.filter(user__id=user.id)

        return locals()
    else:
        return HttpResponseNotFound()


@require_POST
def delete_story(request, id):
    story = Story.objects.get(id=id)

    story.delete()

    return HttpResponse('')