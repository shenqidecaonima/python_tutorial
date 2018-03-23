#测试

#导入pymsql模块
import pymysql

#获取数据库连接
db = pymysql.connect(host="localhost",user="root",password="",db="mydb",charset="utf8")

#创建游标对象
cursor = db.cursor()

#执行sql操作
cursor.execute("select version()")

#解析结果
data = cursor.fetchone()
print(data)

#关闭数据库连接
db.close()