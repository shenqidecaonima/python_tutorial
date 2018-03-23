#类的定义和实例化使用

#定义一个人person类
class Person:
    #定义属性
    name="zhangsan"
    age=20
    #定义方法
    def fun(self):
        print("class Person....")
    def getInfo(self):
        print("my name:%s; age: %d"%(self.name,self.age))
    
#print(Person)
#类的实例化
p = Person()

print(p)

#使用
print(p.name)
print(p.age)
p.fun()
p.getInfo()
p.age=30
p.getInfo()


