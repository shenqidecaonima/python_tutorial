from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse
# Create your views here.
def index(request):
	return HttpResponse("Hello Django!")

def fun(request):
	return redirect(reverse('index')) #重定向
	#return HttpResponse("fun()....")

def fun2(request,num,name):
	return HttpResponse("fun()....%s  %s"%(num,name))

def fun3(request,yy,name):
	return HttpResponse("fun()....%s  %s"%(yy,name))