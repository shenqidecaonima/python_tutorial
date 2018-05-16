from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name="index"),

    url(r'^demo1$', views.demo1, name="demo1"),
    #url(r'^demo2$', views.demo2, name="demo2"),
    url(r'^demo3$', views.demo3, name="demo3"),
    #url(r'^demo4$', views.demo4, name="demo4"),
    url(r'^demo5$', views.demo5, name="demo5"),
]