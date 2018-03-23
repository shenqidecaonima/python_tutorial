#魔术方法、属性和迭代器
#=================================

#1. 魔术方法：
#============================================
#在Python中的面向对象中有很多魔术方法如：
'''
	__init__: 构造函数，在生成对象时调用
	__del__: 析构函数，释放对象时使用
	__str__: 使用print(对象)或者str(对象)的时候触发
	__repr__: 在使用repr(对象)的时候触发
	__setitem__ : 按照索引赋值:每当属性被赋值的时候都会调用该方法:self.__dict__[name] = value
	__getitem__: 按照索引获取值:当访问不存在的属性时会调用该方法
	_delitem__(self,name): 当删除属性时调用该方法
	__len__: 获得长度
	__cmp__: 比较运算
	__call__: 函数调用
	__add__: 加运算
	__sub__: 减运算
	__mul__: 乘运算
	__div__: 除运算
	__mod__: 求余运算
	__pow__: 乘方
	...
'''
# __setitem__: 每当属性被赋值的时候都会调用该方法，因此不能再该方法内赋值 self.name = value 会死循环

'''
#__str__函数用于处理打印实例本身的时候的输出内容。如果没有覆写该函数，则默认输出一个对象名称和内存地址。
class Stu:
	name= '张三'
	age = 20
	def __str__(self):
		return "姓名：%s; 年龄：%d"%(self.name,self.age)

s = Stu()
print(s)
'''

'''
# 析构魔术方法，当对象从内存被释放前调用的方法，目的是做一些释放销毁工作。
class Demo:
	def __init__(self,x):
		self.x = x;
		print("create demo...",self.x)
	def __del__(self):
		print("del demo....",self.x)

d1 = Demo(1)
d2 = Demo(2)
d3 = Demo(3)
del d3
'''

# __add__: 加运算
class Vector:
   def __init__(self, a, b):
      self.a = a
      self.b = b

   def __str__(self):
      return 'Vector (%d, %d)' % (self.a, self.b)

   def __add__(self,other):
      return Vector(self.a + other.a, self.b + other.b)

v1 = Vector(2,10)
v2 = Vector(5,-2)
print (v1 + v2)

# 以上代码执行结果如下所示:
# Vector(7,8)

#2. 属性：
#============================================
# 定义一个矩形类，假象有一个size特性访问器方法
# property() 函数的作用是在新式类中返回属性值	
# class property([fget[, fset[, fdel[, doc]]]])
#fget -- 获取属性值的函数
#fset -- 设置属性值的函数(可选)
#fdel -- 删除属性值函数（可选）
# doc -- 属性描述信息（可选）

'''
class Rectangle:
	def __init__(self):
		self.width = 0
		self.height = 0
	def setSize(self,size):
		self.width,self.height=size
	def getSize(self):
		return self.width,self.height
#测试		
rt = Rectangle()
#rt.width=100
#rt.height=50
rt.setSize((200,100)) #赋值
print(rt.getSize())  #(200,100)
'''

'''
#对应上面的实例，
class Rectangle:
	def __init__(self):
		self.width = 0
		self.height = 0
	def setSize(self,size):
		self.width,self.height=size
	def getSize(self):
		return self.width,self.height

	size = property(getSize,setSize,fdel)

rt = Rectangle()
#rt.width=100
#rt.height=50
rt.setSize((200,100))
print(rt.getSize())


rt.size = 10,5
print(rt.size)
'''

'''
#静态方法和类成员方法（区别是有无带参数）
#使用staticmethod()和classmethod()函数 或使用@staticmethod和@classmethod装饰器
class MyClass1:
	def smeth():
		print('这是一个静态方法')
	smeth = staticmethod(smeth)

	def cmeth(cls):
		print("这是一个类成员方法",cls)
	cmeth = classmethod(cmeth)

MyClass1.smeth()
MyClass1.cmeth()
#或使用使用@staticmethod和@classmethod装饰器
class MyClass2:
	@staticmethod
	def smeth():
		print('这是一个静态方法')

	@classmethod
	def cmeth(cls):
		print("这是一个类成员方法",cls)

MyClass2.smeth()
MyClass2.cmeth()
'''

"""
# 使用hasattr()函数判读对象中是否存在指定的非私有属性和方法：
class B:
	name="zhangsan"
	__age=20
	def bb(self):
		print("bbbbb")
	def __cc(self):
		print("cccc")

b = B()
print(hasattr(b,"name"))	#True
print(hasattr(b,"__age"))	#False
print(hasattr(b,"sex"))		#False
print(hasattr(b,"bb"))		#True
print(hasattr(b,"__cc"))	#False
print()
"""


'''
# 迭代器：
# =========================================
#指定数据创建迭代器（使用iter()和next() ） 
x = [1, 2, 3] #定义一个列表：<class 'list'>
y = iter(x)	  #创建一个可迭代对象：<class 'list_iterator'>
#print(next(y)) # 1
#print(next(y)) # 2
#print(next(y)) # 3
#print(next(y)) # 迭代结束会后返回异常StopIteration错误
for i in y:
	print(i,end=" ")
print()
# 1  2  3


# 迭代对象：定义魔术方法：__next__()和__iter__()
# 
class A:
	def __init__(self):
		self.x=0
	def __next__(self):
		self.x += 1
		if self.x>10:
			raise StopIteration
		return self.x
	def __iter__(self):
		return self

a = A()
print(list(a))
#for i in a:
#	print(i)
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
'''