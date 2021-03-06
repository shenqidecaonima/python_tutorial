from django.conf.urls import url

from myadmin.views import index,users,type

urlpatterns = [
    # 后台首页
    url(r'^$', index.index, name="myadmin_index"),

    # 后台管理员路由
    url(r'^login$', index.login, name="myadmin_login"),
    url(r'^dologin$', index.dologin, name="myadmin_dologin"),
    url(r'^logout$', index.logout, name="myadmin_logout"),
    url(r'^verify$', index.verify, name="myadmin_verify"), #验证码

    # 会员信息管理路由
    url(r'^users$', users.index, name="myadmin_users_index"),
    url(r'^users/add$', users.add, name="myadmin_users_add"),
    url(r'^users/insert$', users.insert, name="myadmin_users_insert"),
    url(r'^users/del/(?P<uid>[0-9]+)$', users.delete, name="myadmin_users_del"),
    url(r'^users/edit/(?P<uid>[0-9]+)$', users.edit, name="myadmin_users_edit"),
    url(r'^users/update/(?P<uid>[0-9]+)$', users.update, name="myadmin_users_update"),

     # 商品类别信息管理路由
    url(r'^type$', type.index, name="myadmin_type_index"),
    url(r'^type/add/(?P<tid>[0-9]+)$', type.add, name="myadmin_type_add"),
    url(r'^type/insert$', type.insert, name="myadmin_type_insert"),
    url(r'^type/del/(?P<tid>[0-9]+)$', type.delete, name="myadmin_type_del"),
    url(r'^type/edit/(?P<tid>[0-9]+)$', type.edit, name="myadmin_type_edit"),
    url(r'^type/update/(?P<tid>[0-9]+)$', type.update, name="myadmin_type_update"),
]
