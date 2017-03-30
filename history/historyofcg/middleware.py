import sys
from django.http import HttpResponseRedirect

class HttpsRedirect(object):
    # Redirect http => https
    def process_request(self, request):
        if not request.is_secure():
            request_url = request.build_absolute_uri(request.get_full_path())
            secure_url = request_url.replace('http://', 'https://')
            return HttpResponseRedirect(secure_url)
        return None
