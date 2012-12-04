from django.forms import ModelForm
from django import forms
from fields import TokenField
from widgets import TokenWidget
from models import *

class PageForm(ModelForm):

    tags = TokenField(Tag, required=False, widget=TokenWidget(
        theme= 'hcg',
        allowCustomEntry= True,
        preventDuplicates= True,
        hintText= 'Enter tags to describe this entry'
    ))

    class Meta:
        model = Page
        widgets = {
            'type': forms.Select(attrs={'class': 'entry-type-select none', 'id': 'EntryCategoryId'}),
        }

class StoryForm(ModelForm):

    class Meta:
        model = Story


__author__ = 'Kyle'