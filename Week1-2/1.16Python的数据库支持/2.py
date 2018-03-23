#查询stu表的数据信息
#
#导入pymsql模块
import pymysql

#获取数据库连接
db = pymysql.connect(host="localhost",user="root",password="",db="mydb",charset="utf8")

#创建游标对象
cursor = db.cursor()
#定义sql语句
#sql = "select * from stu"
sql = "select * from stu where classid='%s'"%("python03")

try:
	#执行sql操作
	cursor.execute(sql)

	print("结果条数：",cursor.rowcount)
	#解析结果(遍历结果)
	'''
	# 使用fetchone（）
	while True:
		data = cursor.fetchone()
		if data == None:
			break;
		print(data)
	'''
	alist = cursor.fetchall()
	for vo in alist:
		print(vo)
except Exception as err:
	print("SQL执行错误！原因：",err)

#关闭数据库连接
db.close()