from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
	return render(request,"myapp/index.html")

def demo1(request):
	'''静态文件'''
	return render(request,"myapp/demo1.html")


def demo3(request):
	'''状态保持'''
	#session设置
	request.session['username'] = 'lisi'

	#session获取
	name = request.session.get("username",default=None)
	print(name)
	#session删除

	# 删除单个key 不存在时报错
	#del request.session['a'] 

	#清除所有会话,但不会删除数据
	#request.session.clear() 

	#删除当前的会话数据
	#request.session.flush()
	return HttpResponse("测试状态保持")

def demo5(request):
	'''密码管理'''
	from django.contrib.auth.hashers import make_password, check_password

	# 对密码进行加密操作
	upass = make_password("123456", None, 'pbkdf2_sha256')
	print(upass)
	b = check_password('1234567','pbkdf2_sha256$36000$NBJc8BrjcijI$5+d8pSTjL5IvqEdMidHNc9ie4Gt05eUgP2tCAKUi5g0=')
	print(b)

	import hashlib
	m = hashlib.md5() 
	m.update(bytes("123456",encoding="utf8"))
	str = m.hexdigest()
	return HttpResponse("执行123456的md5是："+str)