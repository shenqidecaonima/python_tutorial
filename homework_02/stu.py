# 学员信息在线管理
import pymysql
db = pymysql.connect(host='localhost',user='root',password='0923',db='stu',charset='utf8')

cursor = db.cursor()

#define SQL command
#show all the data SQL command
def sqlShowAll():
	sql = "select * from stu"
	try:
		cursor.execute(sql)
		alist = cursor.fetchall()
		for vo in alist:
			print(vo)
	except Exception as err:
		db.rollback()
		print("SQL执行错误！原因：",err)

#Insert SQL command
def sqlInsert(data):
	sql = "insert into stu(name,age,classid) values('%s','%d','%s')"%(data)
	try:
		cursor.execute(sql)
		print("添加成功!")
		db.commit()
	except Exception as err:
		db.rollback()
		print("SQL执行错误！原因：",err)

#Delete SQL command
def sqlDelete(data):
	sql = "delete from stu where name='%s'"%(data)
	try:
		cursor.execute(sql)
		print('删除成功!')
		db.commit()
	except Exception as err:
		db.rollback()
		print("SQL执行错误！原因：",err)

#sqlUpdate = "update stu set name='%s',age='%d',classid='%s' where id=%d"%(data)


# 定义一个用于存放学员信息的列表变量
stulist=[
	{'name':'zhangsan','age':20,'classid':'python02'},
	{'name':'lisi','age':22,'classid':'python03'},
	{'name':'wangwu','age':25,'classid':'python04'}]

#定义一个学生信息的输出函数
def showStu(stulist):
	'''
	学生信息的输出函数
	'''
	if len(stulist)==0:
		print("========== 没有学员信息可以输出！=============")
		return
	print("|{0:<5}| {1:<10}| {2:<5}| {3:<10}|".format("sid","name","age","classid"))
	print("-"*40)
	for i in range(len(stulist)):
		print("|{0:<5}| {1:<10}| {2:<5}| {3:<10}|".format(i+1,stulist[i]['name'],stulist[i]['age'],stulist[i]['classid']))


while True:
	# 输出初始界面
	print("="*12,"学员管理系统","="*14)
	print("{0:1} {1:13} {2:15}".format(" ","1. 查看学员信息","2. 添加学员信息"))
	print("{0:1} {1:13} {2:15}".format(" ","3. 删除学员信息","4. 退出系统"))
	print("="*40)
	key = input("请输入对应的选择：")
	# 根据键盘值，判断并执行对应的操作
	if key == "1":
		print("="*12,"学员信息浏览","="*14)
		sqlShowAll()
		input("按回车键继续：")
	elif key == "2":
		print("="*12,"学员信息添加","="*14)
		#导入输入的信息
		stuName=input("请输入要添加的姓名：")
		stuAge=int(input("请输入要添加的年龄："))
		stuClassid=input("请输入要添加的班级号：")
		data = (stuName,stuAge,stuClassid)
		print('======')
		sqlInsert(data)#call SQL command
		input("按回车键继续：")
	elif key == "3":
		print("="*12,"学员信息删除","="*14)
		sid = input("请输入你要删除的学生姓名：")
		#SQL command
		sqlDelete(sid)

		input("按回车键继续：")
	elif key == "4":
		print("="*12,"再见","="*14)
		break
	else:
		print("======== 无效的键盘输入！ ==========")

#关闭数据库链接
db.close()
