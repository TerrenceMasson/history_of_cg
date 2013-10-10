from django.core.urlresolvers import reverse
from django.test import TestCase

from historyofcg.models import Page
from factories import *
from history import logger

class ViewTests(TestCase):

    def setUp(self):
        tag1 = TagFactory.create()
        tag2 = TagFactory.create()
        self.page = PageFactory.create(tags=(tag1, tag2))

    def test_home_includes_entries(self):
        url = reverse("home")
        response = self.client.get(url)
        self.assertContains(response, self.page.name)

