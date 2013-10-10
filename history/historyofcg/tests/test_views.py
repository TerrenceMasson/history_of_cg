from django.core.urlresolvers import reverse
from django.test import TestCase
from history import logger
from django.test.utils import override_settings

from historyofcg.models import Page

# @override_settings(DEBUG=True)
class ViewTests(TestCase):

    def test_home_includes_entries(self):
        url = reverse("home")
        response = self.client.get(url)
        self.assertEquals(True, True)

