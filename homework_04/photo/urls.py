from django.urls import path
from . import views
urlpatterns = [
    #首页
    path('',views.index, name="index"),

    #浏览信息
    path('photo/<int:pIndex>',views.indexPhoto, name="indexPhoto"),
    #加载添加表单
    path('photo/add/',views.addPhoto, name="addPhoto"),
    #执行添加
    path('photo/insert',views.insertPhoto, name="insertPhoto"),
    #删除信息
    path('photo/del/<int:uid>',views.delPhoto, name="delPhoto"),
    #加载修改信息
    path('photo/edit/<int:uid>',views.editPhoto, name="editPhoto"),
    #执行修改信息
    path('photo/update',views.updatePhoto, name="updatePhoto"),

]
