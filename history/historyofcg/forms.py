from django.forms import ModelForm
from django import forms
from historyofcg.models import *

class PageForm(ModelForm):
    class Meta:
        model = Page
        widgets = {
            'tags': forms.SelectMultiple()
        }

__author__ = 'Kyle'