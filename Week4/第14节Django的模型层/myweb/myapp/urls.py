from django.conf.urls import url
from . import views

urlpatterns = [
    #首页
    url(r'^$',views.index,name="index"),

    #用户信息管理路由
    url(r'^users$',views.indexUsers,name="users"),#浏览信息
    url(r'^users/add$',views.addUsers,name="addusers"),#加载添加表单
    url(r'^users/insert$',views.insertUsers,name="insertusers"),#执行信息添加
    url(r'^users/del/(?P<uid>[0-9]+)$',views.delUsers,name="delusers"),#删除信息
    url(r'^users/edit/(?P<uid>[0-9]+)$',views.editUsers,name="editusers"),#加载修改信息
    url(r'^users/update$',views.updateUsers,name="updateusers"),#执行信息修改
]