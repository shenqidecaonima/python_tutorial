#Count the child dir
import os

number = 0#设置起始数值

#输入文件名
fileInput = input('输入计算的文件路径: ')

def countDir(filePath):
    global number

    #获取计算目录中的文件信息
    dlist = os.listdir(filePath)
    #遍历所有文件，并计算目录数量
    for i in dlist:
        file = os.path.join(filePath,i)
        if os.path.isdir(file):
            countDir(file)
        if os.path.isfile(file):
            number = os.stat(file).st_size + number
            print(number)

    #输出目录数量
    return number

print('目录大小是： {}'.format(countDir(fileInput)))
