from hashlib import sha1
import json, base64, hmac, urllib, time, os, datetime, itertools, uuid, mimetypes

from django import http
from django.core import serializers
from django.contrib.contenttypes.models import ContentType
from django.db.models import Q
from django.http import HttpResponseRedirect, Http404, HttpResponse, HttpResponseNotFound
from django.shortcuts import render_to_response, render, redirect, get_object_or_404
from django.template import RequestContext
from django.template.response import TemplateResponse
from django.utils import simplejson
from django.views.decorators.http import require_safe, require_POST
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.views import password_change as django_password_change
from django.contrib.auth.views import password_change_done as django_password_change_done


from history.base.decorators import render_to
from history.historyofcg.forms import PageForm, StoryForm
from history.historyofcg.models import Page, Review, UpcomingFeature, Story, Category, Tag
from view_helpers import create_page, update_story, JsonResponse
from history import logger



# Create your views here.
#@require_safe
def home(request):
    updated_entries = Page.objects.filter(published=True).order_by('-date_modified')[:4]
    rendering_home = True # Not a great idea, but better than not extending from base
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

def about(request):
    return render_to_response('default/about.html', locals())

def timeline(request):
    pages = Page.objects.filter(published=True)
    pages_json = serializers.serialize("json", pages)
    logger.log("pages_json: ", pages_json)
    return JsonResponse(pages_json);

def timeline_page(request, vanity_url):
    page = Page.objects.get(published=True, vanity_url=vanity_url)
    result = list(page.connections.all())
    result.append(page)
    return JsonResponse(result)

@render_to('pages/entries.html')
def view_source_entries(request, s):
    user_auth = request.user.is_authenticated()
    if Page.objects.filter(published=True, vanity_url=s):
        page = Page.objects.get(published=True, vanity_url=s)
    else:
        return render_to_response('errors/entry_does_not_exist.html', locals())

    all_stories = Story.objects.filter(page__vanity_url=s, published=True, deleted=False)

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

@render_to('pages/add.html')
def add_page(request):
    if not request.user.is_authenticated():
        return redirect('/accounts/login/')
    if request.method == 'POST':
        form = PageForm(request.POST)
        if form.is_valid():
            # Create the Page
            page = create_page(form, request)
            page.save()
            return redirect('/edit/page/{}'.format(page.vanity_url))
        else:
            logger.log("Form Errors: ", form.errors)
    else:
        form = PageForm()

    return locals()

@render_to('pages/edit.html')
def edit_page(request, vanity_url):
    if request.user.is_authenticated():
        page = Page.objects.get(vanity_url=vanity_url)
        connections = page.connections

        if request.method == 'POST':
            form = PageForm(request.POST, instance=page)
            if form.is_valid():
                page.location = form.cleaned_data['location']
                page.type = form.cleaned_data['type']
                page.name = form.cleaned_data['name']
                page.tags = form.cleaned_data['tags']
                page.description = form.cleaned_data['description']
                page.homepage = form.cleaned_data['homepage']
                page.date_established = form.cleaned_data['date_established']
                page.save()
        else:
            form = PageForm(instance=page)

        # Setup for the stories
        story_form = StoryForm()
        story_types = Story.types()
        # Grab all of the existing stories and create a hash of 'title' => Form for editing.
        stories = Story.objects.filter(page=page, deleted=False)
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

## TAGS
########

@require_POST
def add_tag(request):
    new_tag, created = Tag.objects.get_or_create(name=request.POST.get('tag_name'))
    return JsonResponse(new_tag)


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
    story.deleted = True
    story.save()
    return JsonResponse({ 'message': 'Story deleted successfully' }, 200)

@require_POST
def new_story(request, story_type, vanity_url):
    form = StoryForm(request.POST)
    story_user = request.user
    story_page = Page.objects.get(vanity_url=vanity_url)
    if form.is_valid():
        story = Story.objects.create(page=story_page, user=story_user, published=True)
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
                "id": str(page.id),
                "name": page.name.encode('utf-8'),
                "type": str(page.type.name),
                "vanity": str(page.vanity_url)
            }
            results.append(page_json)
        data = simplejson.dumps(results)
    else:
        data = 'fail'
    mimetype = 'application/json'
    return HttpResponse(data, mimetype=mimetype)

def sign_gcp_upload(request):
    GCP_ACCESS_KEY = os.environ.get('HIST_GCP_ACCESS_KEY_ID')
    GCP_SECRET_KEY = os.environ.get('HIST_GCP_SECRET_ACCESS_KEY')
    GCP_BUCKET = os.environ.get('GCP_BUCKET')

    mime_type = request.GET['gcp_object_type']
    inverse_type_lookup = dict((v, k) for k, v in mimetypes.types_map.items())
    extension = inverse_type_lookup[mime_type]
    new_file_name = str(request.user.pk) + "-" + str(uuid.uuid1()) + extension

    expires = int(time.time()+10)
    amz_headers = "x-amz-acl:public-read"

    put_request = "PUT\n\n%s\n%d\n%s\n/%s/%s" % (mime_type, expires, amz_headers, GCP_BUCKET, new_file_name)

    signature = base64.encodestring(hmac.new(GCP_SECRET_KEY, put_request, sha1).digest())

    # Gotta #quote_plus it twice: http://stackoverflow.com/a/20712482/1159410
    signature = urllib.quote_plus(signature.strip())
    signature = urllib.quote_plus(signature.strip())

    url = 'https://%s.storage.googleapis.com/%s' % (GCP_BUCKET, new_file_name)

    return JsonResponse({
        'signed_request': '%s?GCPAccessKeyId=%s&Expires=%d&Signature=%s' % (url, GCP_ACCESS_KEY, expires, signature),
         'url': url
      })


## Add/Remove Connections
##########################

## TODO: This should return an AJAX response.
## I'm getting tired of this send ajax and then return the full page bullshit.
@require_POST
def add_connection(request, connect_to, to_connect):
    if Page.objects.filter(pk=to_connect).exists() and Page.objects.filter(pk=connect_to).exists():
        page_connect_to = Page.objects.get(pk=connect_to)
        page_to_connect = Page.objects.get(pk=to_connect)
        page_connect_to.connections.add(page_to_connect)
        page_connect_to.save()
        return HttpResponse('')
    else:
        ## TODO: We should notify user of error finding the connection
        logger.log_simple("Failed to find one of the pages with the given vanity urls")
        raise Http404

@require_POST
def remove_connection(request, remove_to, to_remove):
    page_remove_to = Page.objects.get(pk=remove_to)
    page_to_remove = Page.objects.get(pk=to_remove)

    page_remove_to.connections.remove(page_to_remove)
    page_remove_to.save()

    return HttpResponse('')

## Registration Overrides
##########################
def password_change(request,
                    template_name='registration/password_change_form.html',
                    post_change_redirect=None,
                    password_change_form=PasswordChangeForm,
                    current_app=None, extra_context=None):
    extra_context = { "request": request }
    return django_password_change(request, extra_context=extra_context)

def password_change_done(request,
                         template_name='registration/password_change_done.html',
                         current_app=None, extra_context=None):
    extra_context = { "request": request }
    return django_password_change_done(request, extra_context=extra_context)



## Voting
##########

## Note: None of the following views are used on the frontend.

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

