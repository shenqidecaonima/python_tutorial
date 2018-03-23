#Python的面向对象

#1. 面向对象概述：
#=========================================================================
'''
Python从设计之初就已经是一门面向对象的语言，正因为如此，在Python中创建一个类和对象是很容易的.

面向对象技术简介:

	类(Class): 用来描述具有相同的属性和方法的对象的集合。它定义了该集合中每个对象所共有的属性和方法。对象是类的实例。
	类变量：   类变量在整个实例化的对象中是公用的。类变量定义在类中且在函数体之外。类变量通常不作为实例变量使用。
	数据成员： 类变量或者实例变量用于处理类及其实例对象的相关的数据。
	方法重写： 如果从父类继承的方法不能满足子类的需求，可以对其进行改写，这个过程叫方法的覆盖（override），也称为方法的重写。
	实例变量： 定义在方法中的变量，只作用于当前实例的类。
	继承：     即一个派生类（derived class）继承基类（base class）的字段和方法。继承也允许把一个派生类的对象作为一个基类对象对待。例如，有这样一个设计：一个Dog类型的对象派生自Animal类，这是模拟"是一个（is-a）"关系（例图，Dog是一个Animal）。
	实例化：   创建一个类的实例，类的具体对象。
	方法：     类中定义的函数。
	对象：     通过类定义的数据结构实例。对象包括两个数据成员（类变量和实例变量）和方法。
'''

#2.	 类和对象	：
#=========================================================================
'''
#2.1 类的定义格式：
	class ClassName:
    	<statement-1>
    	...
    	...
    	...	
    	<statement-N>
'''

#定义一个Person1人这个类
class Person1:
	name = "zhangsan"	# 类成员(类变量)定义
	age = 20

	def getInfo(self):  #类方法定义，
		return self.name+":"+str(self.age)

# 类实例化成对象
p = Person1()	
print(Person1)	# <class '__main__.Person1'>
print(p)		# <__main__.Person1 object at 0x0000000002183630>

# 调用自己的属性和方法，使用的是点.
print(p.name)	# zhangsan
print(p.getInfo()) # zhangsan:20
p.age = 30	# 修改属性信息
print(p.getInfo()) # zhangsan:30
print("="*40)

# self关键字：
# 	self 代表的是类的实例，代表当前对象的地址，而 self.class 则指向类。
# 	self 不是 python 关键字，我们可以换成其他变量名


#3. 构造函数：__init__()
#=============================================================================
# 类定义了 init() 方法的话，类的实例化操作会自动调用 init() 方法。
# init() 方法可以有参数，参数通过 init() 传递到类的实例化操作上。

class Person2:

	def __init__(self,name,age):
		self.name = name
		self.age = age

	def say(self):
		print("我的名字：{}; 年龄：{}".format(self.name,self.age))

# 实例化的通知自动调用初始化方法init，并将值传入
p2 = Person2("lisi",23)
p2.say()
p2.age=20
p2.say()
print("="*40)


#4. 属性(类变量)和方法
#===========================================================================
# 使用 def 关键字来定义一个方法.与一般函数定义不同，类方法必须包含参数 self, 且为第一个参数，self 代表的是类的实例
# self 的名字并不是规定死的，也可以使用 this，但是最好还是按照约定是用 self

# 类的私有属性：private_attrs
# 	两个下划线开头，声明该属性为私有，不能在类地外部被使用或直接访问。在类内部的方法中使用self调用

# 类的私有方法：private_method
# 	两个下划线开头，声明该方法为私有方法，只能在类的内部调用（self） ，不能在类地外部调用
# 	

class Person3:
	
	name = ''  #基本属性
	__age = 0  #私有属性

	def __init__(self,name,age):
		self.name = name
		self.__age = age

	def __say(self):
		print("我的名字：{}; 年龄：{}".format(self.name,self.__age))

	def getInfo(self):
		self.__say()

#测试
p3 = Person3('wangwu',22)
print(p3.name)
p3.getInfo()
# 对象中私有属性和方法在外边是不可访问
#print(p3.__age) #AttributeError: 'Person3' object has no attribute '__age'
#Person3.__say()
print("="*40)


#5. 继承与重写:
#=======================================================================
#Python 同样支持类的继承，如果一种语言不支持继承，类就没有什么意义。派生类的定义如下所示:
#方法重写（重载）：如果你的父类方法的功能不能满足你的需求，你可以在子类重写你父类的方法

# 定义基类
class Person:
	def __init__(self,name,age):
		self.name = name
		self.age = age

	def say(self):
		print("我的姓名：{} ；年龄 {}".format(self.name,self.age))

# 定义子类Stu，继承父类Person
class Stu(Person):
	def __init__(self,name,age,school):
		Person.__init__(self,name,age) #初始化父类
		self.school = school

	def say(self): #方法覆盖（重写）
		print("我的姓名：{} ；年龄 {} ; 学校：{}".format(self.name,self.age,self.school))

# 测试
s = Stu("张三丰",20,'北京大学')
s.say()
super(Stu,s).say() #用子类对象调用父类已被覆盖的方法


# 多继承:
#----------------------------------------------------------------------------
# 需要注意圆括号中父类的顺序，若是父类中有相同的方法名，而在子类使用时未指定，
# python从左至右搜索 即方法在子类中未找到时，从左到右查找父类中是否包含方法。
# 
# Python同样有限的支持多继承形式。多继承的类定义形如下例:
class A:
	def fun(self):
		print("Class A....")

class B:
	def fun(self):
		print("class B.....")

class C(A,B):
	pass

c = C()
c.fun() #Class A....

print("="*40)



#6. 其他扩展:
#=============================================================================
'''
#类的专有方法：
	__init__: 构造函数，在生成对象时调用
	__del__: 析构函数，释放对象时使用
	__repr__: 打印，转换
	__setitem__ : 按照索引赋值
	__getitem__: 按照索引获取值
	__len__: 获得长度
	__cmp__: 比较运算
	__call__: 函数调用
	__add__: 加运算
	__sub__: 减运算
	__mul__: 乘运算
	__div__: 除运算
	__mod__: 求余运算
	__pow__: 乘方
'''
#Python同样支持运算符重载，我们可以对类的专有方法进行重载，实例如下：
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
print (v1 + v2) #Vector(7,8)

