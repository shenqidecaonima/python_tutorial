#删除stu表的数据信息
#
#导入pymsql模块
import pymysql

#获取数据库连接
db = pymysql.connect(host="localhost",user="root",password="",db="mydb",charset="utf8")

#创建游标对象
cursor = db.cursor()
#定义sql语句
sql = "delete from stu where id=%d"%(18)

try:
	#执行sql操作
	m = cursor.execute(sql)
	# 事务提交
	db.commit()
	print("成功删除条数：",m)
	
except Exception as err:
	#事务回滚
	db.rollback()
	print("SQL执行错误！原因：",err)

#关闭数据库连接
db.close()