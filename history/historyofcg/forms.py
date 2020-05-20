from django.forms import ModelForm, Select, Textarea, DateField, DateInput, CharField
from django.forms.extras.widgets import SelectDateWidget
from fields import TokenField
from widgets import TokenWidget
from models import Page, Tag, Story
from datetime import date

CURRENT_YEAR = date.today().year
YEARS_RANGE = range(1900, CURRENT_YEAR + 8)

class PageForm(ModelForm):
    tags = TokenField(Tag, required=True, widget=TokenWidget(
        theme='hcg',
        allowCustomEntry=True,
        preventDuplicates=True,
        hintText='Enter tags to describe this entry'
    ))

    class Meta:
        model = Page
        widgets = {
            'type': Select(attrs={'class': 'entry-type-select none', 'id': 'EntryCategoryId'}),
        }
        fields = ['type', 'location', 'name', 'tags', 'description', 'homepage', 'date_established', 'old_id', 'is_deceased', 'date_deceased', 'user_made']

    def __init__(self, *args, **kwargs):
        super(ModelForm, self).__init__(*args, **kwargs)

        # Setup Date Select fields
        self.fields['date_established'].widget = SelectDateWidget(years=YEARS_RANGE)
        self.fields['date_deceased'].widget = SelectDateWidget(years=YEARS_RANGE)

        # Apply classes to fields
        for f in self.fields:
            self.fields[f].widget.attrs = {'class': 'need-helper organization'}

        self.fields['type'].widget.attrs = {'class': 'entry-type-select organization'}

        self.fields['date_established'].widget.attrs = { 'class': 'chosen-select' }
        self.fields['date_deceased'].widget.attrs = { 'class': 'chosen-select' }

class StoryForm(ModelForm):
    class Meta:
        model = Story
        widgets = {
            'text': Textarea(attrs={'style': 'width:340px;'})
        }
        fields = ['title', 'date', 'source', 'source_url', 'old_id', 'video', 'image', 'text', 'deleted']

    def __init__(self, *args, **kwargs):
        super(ModelForm, self).__init__(*args, **kwargs)
        self.fields['date'].widget = SelectDateWidget(years=YEARS_RANGE)
        self.fields['date'].widget.attrs = { 'class': 'chosen-select' }
