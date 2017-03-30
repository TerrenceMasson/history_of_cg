from django.http import HttpResponseRedirect

class HttpsRedirect(object):
    # Redirect http => https
    def process_request(self, request):
        if request.scheme != 'https':
            request_url = request.build_absolute_uri(request.get_full_path())
            secure_url = request_url.replace('http://', 'https://')
            return HttpResponseRedirect(secure_url)
        else:
            return None
