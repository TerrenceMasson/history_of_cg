from django.shortcuts import render_to_response
from django.views.decorators.http import require_safe

# Create your views here.
@require_safe
def home(request):
    return render_to_response('default/home.html')