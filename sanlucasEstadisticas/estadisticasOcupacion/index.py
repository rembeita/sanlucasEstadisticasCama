from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse
from django.template import RequestContext, loader
from django.views.generic import RedirectView

from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect

#from inicio import *

def index(request):
       template = loader.get_template('estadisticasOcupacion/index.html')
       STATIC_URL_ROD = '/static/'
       context = locals()
       context['STATIC_URL_ROD'] = STATIC_URL_ROD

       context_instance = RequestContext(request)
       return render(request, 'estadisticasOcupacion/index.html', context)

