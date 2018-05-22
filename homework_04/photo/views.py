from django.shortcuts import render
from django.http import HttpResponse
from photo.models import PhotoInfo
from datetime import datetime
import time,os
from PIL import Image

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
        '''执行图片的上传'''
        myfile = request.FILES.get("mypic",None)
        if not myfile:
            return HttpResponse("没有上传文件信息")
        filename = str(time.time())+"."+myfile.name.split('.').pop()
        destination = open("./static/pics/"+filename,"wb+")
        for chunk in myfile.chunks():      # 分块写入文件
            destination.write(chunk)
        destination.close()
        # 执行图片缩放
        im = Image.open("./static/pics/"+filename)
        # 缩放到75*75(缩放后的宽高比例不变):
        im.thumbnail((75, 75))
        # 把缩放后的图像用jpeg格式保存:
        im.save("./static/pics/s_"+filename,None)
        #储存名字进数据库
        photo = PhotoInfo()
        photo.photoName = filename
        photo.addtime = datetime.now()
        photo.save()
        context = {"info":"Success"}
    except Exception as err:
        context = {"info":"Fail"}
    return render(request,"photo/info.html",context)

def editPhoto(request,uid):
    try:
        ob = PhotoInfo.objects.get(id=uid)
        os.remove("./static/pics/"+ob.photoName)
        os.remove("./static/pics/s_"+ob.photoName)
        ob.delete()
        context={"photo":ob}
        return render(request,"photo/edit.html",context)
    except:
        context = {"info":"没有找到要修改的信息！"}
        return render(request,"photo/info.html",context)

def updatePhoto(request):
        try:
            '''执行图片的上传'''
            myfile = request.FILES.get("mypic",None)
            print(myfile)
            if not myfile:
                return HttpResponse("没有上传文件信息")
            filename = str(time.time())+"."+myfile.name.split('.').pop()
            destination = open("./static/pics/"+filename,"wb+")
            for chunk in myfile.chunks():      # 分块写入文件
                destination.write(chunk)
            destination.close()
            # 执行图片缩放
            im = Image.open("./static/pics/"+filename)
            # 缩放到75*75(缩放后的宽高比例不变):
            im.thumbnail((75, 75))
            # 把缩放后的图像用jpeg格式保存:
            im.save("./static/pics/s_"+filename,None)
            #储存名字进数据库
            photo = PhotoInfo.objects.get(id=request.POST['id'])
            photo.photoName = filename
            photo.addtime = datetime.now()
            photo.save()
            context = {"info":"修改成功！"}
        except Exception as err:
            print(err)
            context = {"info":"修改失败！"}
        return render(request,"photo/info.html",context)

def delPhoto(request,uid):
    try:
        ob = PhotoInfo.objects.get(id=uid)
        os.remove("./static/pics/"+ob.photoName)
        os.remove("./static/pics/s_"+ob.photoName)
        ob.delete()
        context = {"info":"删除成功！"}
    except:
        context = {"info":"删除失败！"}
    return render(request,'photo/info.html',context)
