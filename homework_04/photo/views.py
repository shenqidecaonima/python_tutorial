from django.shortcuts import render
from django.http import HttpResponse
from photo.models import PhotoInfo
from datetime import datetime
# Create your views here.


def index(request):
    '''index Page'''
    return render(request, 'photo/index.html')

def indexPhoto(request):
    '''获取图片信息'''
    list = PhotoInfo.objects.all()
    context = {"photolist": list}
    return render(request, 'photo/photo.html',context)

def addPhoto(request):
    return render(request,'photo/addPhoto.html')

def insertPhoto(request):
    try:
        photo = PhotoInfo()
        photo.photoName = request.POST['name']
        photo.addtime = datetime.now()
        photo.save()
        context = {"info":"Success"}
    except:
        context = {"info":"Fail"}

    return render(request,'photo/insertPhoto.html',context)

def editPhoto(request):
    pass

def updatePhoto(request):
    pass

def delPhoto(request):
    pass
