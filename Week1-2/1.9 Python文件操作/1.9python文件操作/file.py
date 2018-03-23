# Python的文件操作

'''
#1. 简单的文件信息读取
# 打开文件
f = open("./a.txt","r") 
# 读取文件内容并输出
content = f.read(5)
print(content)
content = f.read(5)
print(content)
content = f.read()
print(content)
# 关闭文件
f.close()
'''
'''
#2. readline() 读取一行
f= open("./a.txt","r")
content = f.readline()
while len(content)>0:
	print(content,end="")
	content = f.readline()
f.close()

print()
print("="*60)

#3. readlines() 一次性读取所有行
f = open("./a.txt","r")
flist = f.readlines()
for line in flist:
	print(line,end="")
f.close()

'''

'''
# 文件写入操作
f = open("./b.txt","w")
f.write("Hello Python!\n")
f.write("Hello MysQL!\n")

a = ["Hello World!\n","Hello HTML!\n","Hello PHP!\n"]
f.writelines(a)

f.close()
'''

# 自定义文件复制函数
def mycopy(file1,file2):
	'''
	文件复制函数
	'''
	#打开文件源和目标文件
	f1 = open(file1,"rb")
	f2 = open(file2,"wb")
	#循环读取并写入，实现复制内容
	content = f1.readline()
	while len(content)>0:
		f2.write(content)
		content = f1.readline()
	#关闭源和目标文件
	f1.close()
	f2.close()

#测试
mycopy("./a.jpg","./b.jpg")








