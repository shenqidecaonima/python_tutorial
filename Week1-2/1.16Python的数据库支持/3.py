#添加stu表的数据信息
#
#导入pymsql模块
import pymysql

#获取数据库连接
db = pymysql.connect(host="localhost",user="root",password="",db="mydb",charset="utf8")

#创建游标对象
cursor = db.cursor()
#定义sql语句
data = ("uu101",20,'w','python04')
sql = "insert into stu(name,age,sex,classid) values('%s','%d','%s','%s')"%(data)

try:
	#执行sql操作
	m = cursor.execute(sql)
	# 事务提交
	db.commit()
	#print("成功添加条数：",cursor.rowcount)
	print("成功添加条数：",m)
	
except Exception as err:
	#事务回滚
	db.rollback()
	print("SQL执行错误！原因：",err)

#关闭数据库连接
db.close()