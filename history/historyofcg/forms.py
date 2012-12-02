from django.forms import ModelForm
from django import forms
from historyofcg.models import *

class PageForm(ModelForm):
    class Meta:
        model = Page
        widgets = {
            'tags': forms.SelectMultiple(attrs={'class': 'entry-tags fields'}),
            'type': forms.Select(attrs={'class': 'entry-type-select none', 'id': 'EntryCategoryId'})
        }

__author__ = 'Kyle'