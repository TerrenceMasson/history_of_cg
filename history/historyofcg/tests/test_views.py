from django.urls import reverse
from django.test import TestCase

from .factories import TagFactory, PageFactory
from history import logger

class ViewTests(TestCase):

    def setUp(self):
        tag1 = TagFactory.create()
        tag2 = TagFactory.create()
        self.page1 = PageFactory.create(tags=(tag1, tag2))
        self.page2 = PageFactory.create(tags=(tag2,))

    def test_home_includes_entries(self):
        url = reverse("home")
        response = self.client.get(url)
        self.assertContains(response, self.page1.name)

    def test_add_connection_with_bad_vanity(self):
        url = reverse("add_connection", args=(self.page1.vanity_url, "bad-vanity"))
        response = self.client.post(url)
        self.assertFalse(self.page1.connections.exists())

    def test_add_connection_with_good_vanitys(self):
        url = reverse("add_connection", args=(self.page1.vanity_url, self.page2.vanity_url))
        response = self.client.post(url)
        self.assertIn(self.page2, self.page1.connections.all())
        

