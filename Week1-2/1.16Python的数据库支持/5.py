#修改stu表的数据信息
#
#导入pymsql模块
import pymysql

#获取数据库连接
db = pymysql.connect(host="localhost",user="root",password="",db="mydb",charset="utf8")

#创建游标对象
cursor = db.cursor()
#定义sql语句
data = ("uu200",25,'m','python05',16)
sql = "update stu set name='%s',age='%d',sex='%s',classid='%s' where id=%d"%(data)

try:
	#执行sql操作
	m = cursor.execute(sql)
	# 事务提交
	db.commit()
	
	print("成功修改条数：",m)
	
except Exception as err:
	#事务回滚
	db.rollback()
	print("SQL执行错误！原因：",err)

#关闭数据库连接
db.close()