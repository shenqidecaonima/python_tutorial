#Python模块实战

'''
import time,random

print("当前时间戳：",time.time()) #1519877291.541042
print("当前时间元组：",time.localtime())
#当前时间元组： time.struct_time(tm_year=2018, tm_mon=3, tm_mday=1, tm_hour=12, tm_min=8, tm_sec=11, tm_wday=3, tm_yday=60, tm_isdst=0)
#print("当前时间元组：",time.localtime(时间戳))

print(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())) #2018-03-01 12:08:11
print("当前时间",time.strftime("%Y-%m-%d %H:%M:%S")) #2018-03-01 12:08:11

print("随机数：",random.random())  #0.4355021226141407

#from…import 语句:
#Python的from语句让你从模块中导入一个指定的部分到当前命名空间中，语法如下：
#格式：from modname import name1[, name2[, ... nameN]]

from random import random,randrange

print("当前时间戳：",random())
print("随机一个1~10的值：",randrange(1,11))
'''

#测试使用自定义模块
from mylib import demo
from mylib.demo  import sum

print("50的累加：",demo.sum(50))
print("100的累加：",sum(100))


#每个模块都有一个__name__属性，当其值是'__main__'时，表明该模块自身在运行，否则是被引入
print(__name__)
print(demo.__name__)

#内置的函数 dir() 可以找到模块内定义的所有名称。以一个字符串列表的形式返回:
print(dir())
print(dir(demo))

