from django.forms import ModelForm, Select, Textarea, DateField, DateInput, CharField
from fields import TokenField
from widgets import TokenWidget
from models import *
import datetime

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
            'type': Select(attrs={'class': 'entry-type-select none', 'id': 'EntryCategoryId'}),
        }
        exclude = ('user', 'published', 'connections', 'published', 'vanity_url', 'image')

    def __init__(self, *args, **kwargs):
        super(ModelForm, self).__init__(*args, **kwargs)

        self.fields['date_established'].initial = "MM/DD/YYYY or YYYY"
        self.fields['date_established'].widget.format = '%m/%d/%Y'
        # at the same time, set the input format on the date field like you want it:
        self.fields['date_established'].input_formats = ('%Y-%m-%d',              # '2006-10-25'
                                                         '%m/%d/%Y',              # '10/25/2006'
                                                         '%m/%d/%y',              # '10/25/06'
                                                         '%Y', '%y',)
        for f in self.fields:
            self.fields[f].widget.attrs = {'class': 'organization'}

        self.fields['type'].widget.attrs = {'class' : 'entry-type-select organization'}

class TextStoryForm(ModelForm):

    class Meta:
        model = TextStory
        widgets = {
            'text': Textarea(attrs={'style':'width:340px;'})
        }
        exclude = ('user', 'published', 'page')

    def __init__(self, *args, **kwargs):
        super(ModelForm, self).__init__(*args, **kwargs)
        self.fields['date'].widget.format = '%m/%d/%Y'

        # at the same time, set the input format on the date field like you want it:
        self.fields['date'].input_formats = ['%m/%d/%Y', '%Y']

class ImageStoryForm(ModelForm):

    class Meta:
        model = ImageStory
        exclude = ('user', 'published', 'page')

    def __init__(self, *args, **kwargs):
        super(ModelForm, self).__init__(*args, **kwargs)
        self.fields['date'].widget.format = '%d/%m/%Y'

        # at the same time, set the input format on the date field like you want it:
        self.fields['date'].input_formats = ['%d/%m/%Y', '%Y']

class VideoStoryForm(ModelForm):

    class Meta:
        model = VideoStory
        exclude = ('user', 'published', 'page')

    def __init__(self, *args, **kwargs):
        super(ModelForm, self).__init__(*args, **kwargs)
        self.fields['date'].widget.format = '%d/%m/%Y'

        # at the same time, set the input format on the date field like you want it:
        self.fields['date'].input_formats = ['%d/%m/%Y', '%Y']

__author__ = 'Kyle'