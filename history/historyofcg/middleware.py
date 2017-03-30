import sys
from django.http import HttpResponseRedirect

class HttpsRedirect(object):
    # Redirect http => https
    def process_request(self, request):
        print >> sys.stderr, "TEST"
        if True:
            # print >> sys.stderr, "TRYING TO REDIRECT"
            # request_url = request.build_absolute_uri(request.get_full_path())
            # secure_url = request_url.replace('http://', 'https://')
            # print >> sys.stderr, "RETURNING REDIRECT WITH URL " + secure_url
            secure_url = "https://google.com"
            return HttpResponseRedirect(secure_url)
        print >> sys.stderr, "RETURNING NONE"
        return None
