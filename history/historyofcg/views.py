import json
import datetime
from django import http
from django.contrib.contenttypes.models import ContentType
from django.db.models import Q
from django.http import HttpResponseRedirect, Http404, HttpResponse, HttpResponseNotFound
from django.shortcuts import render_to_response, render, redirect, get_object_or_404
from django.template import RequestContext
from django.template.response import TemplateResponse
from django.utils import simplejson
from django.views.decorators.http import require_safe
from history.base.decorators import render_to
from history.historyofcg.forms import PageForm, StoryForm
from history.historyofcg.models import Page, Review, UpcomingFeature, Story, Category
from django.views.decorators.http import require_POST
from view_helpers import update_story, JsonResponse
import itertools
import history.logger



# Create your views here.
#@require_safe
def home(request):
    updated_entries = Page.objects.filter(published=True).order_by('-date_modified')[:4]

    if request.user.is_authenticated():
        # TODO: This NEEDS to be pulled out to a helper.
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
    user_auth = False
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

        user_auth = True

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

## Page Views
##############

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
            page_vanity_url = form.cleaned_data['name'].replace(' ', '-').replace('_', '-').replace('(', '').replace(')', '').replace('.', '')
            if page_vanity_url[len(page_vanity_url) - 1] == "-":
                page_vanity_url = page_vanity_url[:len(page_vanity_url) - 1]
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
        # TODO: Need to pull this shit out to a method
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
        connections = page.connections

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
            story_form = StoryForm()
            story_types = Story.types()
            # Grab all of the existing stories and create a hash of 'title' => Form for editing.
            stories = Story.objects.filter(page=page)
            story_forms = []
            for story in stories:
                story_forms.append(StoryForm(instance=story))

    return locals()

# Publishing/Upublishing Pages
@require_POST
def unpublish_page(request, vanity_url):
    page = Page.objects.get(vanity_url=vanity_url)
    page.published = False
    page.save()
    return JsonResponse({ 'message': "Page was unpublished successfully" });


@require_POST
def publish_page(request, vanity_url):
    page = Page.objects.get(vanity_url=vanity_url)
    page.published = True
    page.save()
    return JsonResponse({ 'message': "Page was published successfully" });


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


## STORY VIEWS
###############

@require_POST
def delete_story(request, id):
    story = Story.objects.get(id=id)
    story.delete()
    return JsonResponse({ 'message': 'Story deleted successfully' }, 200)

@require_POST
def new_story(request, story_type, vanity_url):
    form = StoryForm(request.POST)
    story_user = request.user
    story_page = Page.objects.get(vanity_url=vanity_url)
    if form.is_valid():
        story = Story.objects.create(page=story_page, user=story_user)
        story = update_story(form, story)
        story.save()
        story_form = StoryForm(instance=story)
        # Return the edit_story template back to the AJAX call
        # so we can insert it into the DOM
        return render_to_response('pages/edit_story.html', { 'story_form': story_form, 'page': story_page }, context_instance=RequestContext(request))
    else:
        return JsonResponse(form.errors, status=400)


@require_POST
def edit_story(request, type, id):
    story = Story.objects.get(id=id)
    form = StoryForm(request.POST, instance=story)
    if form.is_valid():
        story = update_story(form, story)
        story.save()
        return JsonResponse({ 'message': "Story was saved successfully" }, 200)
    else:
        return JsonResponse(form.errors, status=400)


# TODO: Publishing/Unpublishing should be authenticated
@require_POST
def unpublish_story(request, id):
    story = Story.objects.get(id=id)
    story.published = False
    story.save()
    return JsonResponse({ 'message': "Story was unpublished successfully" });


@require_POST
def publish_story(request, id):
    story = Story.objects.get(id=id)
    story.published = True
    story.save()
    return JsonResponse({ 'message': "Story was published successfully" });


def get_pages(request):
    if request.is_ajax():
        q = request.GET.get('term', '')
        pages = Page.objects.filter(name__icontains=q)[0:20]
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
            type=Category.objects.get(id=1),
            name=to_connect_name,
            vanity_url=to_connect_vanity,
            description="",
            published=False,
            user=request.user,
            user_made=False,
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

