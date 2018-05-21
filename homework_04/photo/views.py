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
        context = {"info":"Success!"}
    except:
        context = {"info":"Fail!"}

    return render(request,'photo/insertPhoto.html',context)

def editPhoto(request,uid):
	try:
		ob = PhotoInfo.objects.get(id=uid)
		context={"photo":ob}
		return render(request,"photo/edit.html",context)
	except Exception as err:
		print(err)
		context = {"info":"没有找到要修改的信息！"}
		return render(request,"photo/info.html",context)

def updatePhoto(request):
    try:
        photo = PhotoInfo.objects.get(id=request.POST['id'])
        photo.photoName = request.POST['name']
        photo.addtime = datetime.now()
        photo.save()
        context = {"info":"修改成功！"}
    except:
        context = {"info":"修改失败！"}
    return render(request,"photo/info.html",context)

def delPhoto(request,uid):
    try:
        ob = PhotoInfo.objects.get(id=uid)
        ob.delete()
        context = {"info":"删除成功！"}
    except:
        context = {"info":"删除失败！"}
    return render(request,'photo/info.html',context)
