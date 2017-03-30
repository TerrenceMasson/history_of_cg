from django.http import HttpResponseNotAllowed
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.template import loader
from django.http import HttpResponseRedirect


class HttpResponseNotAllowedMiddleware(object):
    def process_response(self, request, response):
        if isinstance(response, HttpResponseNotAllowed):
            context = RequestContext(request)
            return render_to_response('errors/405.html', locals())


class HttpsRedirect(object):
    # Redirect http => https
    def process_request(self, request):
        if request.scheme != 'https':
            request_url = request.build_absolute_uri(request.get_full_path())
            secure_url = request_url.replace('http://', 'https://')
            return HttpResponseRedirect(secure_url)
        else:
            return None
