from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response, render, redirect
from django.views.decorators.http import require_safe
from forms import PageForm
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
    image_stories = ImageStory.objects.filter(page__vanity_url = s)
    text_stories = TextStory.objects.filter(page__vanity_url = s)
    video_stories = VideoStory.objects.filter(page__vanity_url = s)
    all_stories = Story.objects.filter(page__vanity_url = s)

    page = Page.objects.get(vanity_url=s)

    return render_to_response('pages/entries.html', locals())

@require_safe
def add_page(request):
    if request.method == 'POST': # If the form has been submitted...
        form = PageForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Create the Page
            page_name = form.cleaned_data['name']
            page_description = form.cleaned_data['description']
            page_vanity_url = form.cleaned_data['vanity_url']

            Page.objects.create(
                name = page_name,
                description = page_description,
                vanity_url = page_vanity_url
            ).save()

            return redirect('/pages/{}'.format(page_vanity_url)) # Redirect after POST
    else:
        form = PageForm() # An unbound form

    return render(request, 'pages/add.html', locals())

@require_safe
def edit_page(request, vanity_url):
    page = Page.objects.get(vanity_url = vanity_url)
    user_stories = Story.objects.filter(user__id = request.user.id)
    connections = Connection.objects.filter(page__vanity_url = vanity_url)
    if request.method == 'POST':
        form = PageForm(request.POST)
        if form.is_valid():

            return redirect('/pages/{}'.format(vanity_url))

    return render(request, 'pages/edit.html', locals())