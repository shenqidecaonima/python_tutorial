# 自定义一个目录复制的函数
import os
# 
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


# 自定义目录复制函数
def copydd(dir1,dir2):
	#获取被复制目录中的所有文件信息
	dlist = os.listdir(dir1)
	#创建新目录
	os.mkdir(dir2)
	#遍历所有文件，并执行文件复制
	for f in dlist:
		#为遍历的文件添加目录路径
		file1 = os.path.join(dir1,f) #源
		file2 = os.path.join(dir2,f) #目标
		#判断是否是文件
		if os.path.isfile(file1):
			mycopy(file1,file2) #调用自定义文件复制函数来复制文件
		#判断是否是目录
		if os.path.isdir(file1):
			copydd(file1,file2) #递归调用自己，来实现子目录的复制

# 测试
copydd("./aa","./dd")