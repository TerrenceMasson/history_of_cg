import sys
from django.http import HttpResponseRedirect

class HttpsRedirect(object):
    # Redirect http => https
    def process_request(self, request):
        print >> sys.stderr, "SCHEME: " + request.scheme
        if request.scheme != 'https':
            print >> sys.stderr, "TRYING TO REDIRECT"
            request_url = request.build_absolute_uri(request.get_full_path())
            secure_url = request_url.replace('http://', 'https://')
            print >> sys.stderr, "RETURNING REDIRECT WITH URL " + secure_url
            return HttpResponseRedirect(secure_url)
        else:
            print >> sys.stderr, "RETURNING NONE"
            return None
