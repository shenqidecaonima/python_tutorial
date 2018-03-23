# Python的异常处理


'''
print("Start.....")
try:
    #捕获异常
    a = int(input("请输入一个数值："))
    print("你输入的值：",a)
except:
    #处理异常
    print("Error！....")
    
print("End.....")
'''

'''
# 多层except处理
print("Start.....")
try:
    #捕获异常
    a = int(input("请输入一个数值："))
    print("你输入的值：",a)
    print(100/a)
except ValueError:
    #处理异常
    print("值错误。。。")
except ZeroDivisionError:
    print("除数为0错误！")
except:
    print("未知错误!")
    
print("End.....")
'''



# 多层except处理
print("Start.....")
try:
    #捕获异常
    a = int(input("请输入一个数值："))
    print("你输入的值：",a)
    print(100/a)
except (ValueError,ZeroDivisionError) as info:
    print("错误！原因：",info)
    #raise #再次将当前错误抛出
except:
    print("未知错误!")
    
print("End.....")
