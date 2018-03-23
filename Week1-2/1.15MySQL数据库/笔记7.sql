-- 多表联查操作
--=================================================================

--进入数据
C:\Users\张涛>mysql -u root -p mydb
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 25
Server version: 10.1.30-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

--查看当前数据库下所有表
MariaDB [mydb]> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| grade          |
| stu            |
| tt2            |
| type           |
+----------------+
4 rows in set (0.00 sec)

MariaDB [mydb]> select * from stu;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  4 | zhaoliu  |  19 | w   | python04 |
|  5 | qq01     |  20 | m   | python03 |
|  6 | qq02     |  21 | w   | python04 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  21 | w   | python04 |
|  9 | uu02     |  20 | m   | python05 |
| 10 | aa       |  29 | w   | python03 |
| 11 | bb       |  20 | m   | python04 |
+----+----------+-----+-----+----------+
11 rows in set (0.00 sec)

-- 查看年龄最大的一条信息
MariaDB [mydb]> select * from stu order by age desc limit 1;
+----+------+-----+-----+----------+
| id | name | age | sex | classid  |
+----+------+-----+-----+----------+
| 10 | aa   |  29 | w   | python03 |
+----+------+-----+-----+----------+
1 row in set (0.00 sec)

--获取年龄最大的值
MariaDB [mydb]> select max(age) from stu;
+----------+
| max(age) |
+----------+
|       29 |
+----------+
1 row in set (0.00 sec)

--查询年龄为29的信息
MariaDB [mydb]> select * from stu where age=29;
+----+------+-----+-----+----------+
| id | name | age | sex | classid  |
+----+------+-----+-----+----------+
| 10 | aa   |  29 | w   | python03 |
+----+------+-----+-----+----------+
1 row in set (0.00 sec)

-- 嵌套查询年龄最大的所有信息
MariaDB [mydb]> select * from stu where age=(select max(age) from stu);
+----+------+-----+-----+----------+
| id | name | age | sex | classid  |
+----+------+-----+-----+----------+
| 10 | aa   |  29 | w   | python03 |
+----+------+-----+-----+----------+
1 row in set (0.00 sec)

-- 查看成绩信息
MariaDB [mydb]> select * from grade;
+----+------+---------+-------+
| id | sid  | subject | score |
+----+------+---------+-------+
|  1 |    3 | python  |    87 |
|  2 |    4 | python  |    90 |
|  3 |    2 | python  |    58 |
|  4 |    7 | python  |    98 |
|  5 |    5 | python  |    78 |
|  6 |    9 | python  |    86 |
|  7 |   11 | python  |    88 |
|  8 |   10 | python  |    76 |
|  9 |    1 | python  |    69 |
+----+------+---------+-------+
9 rows in set (0.00 sec)

--查看姓名为qq01的成绩信息
MariaDB [mydb]> select * from grade where sid=(select id from stu where name='qq01');
+----+------+---------+-------+
| id | sid  | subject | score |
+----+------+---------+-------+
|  5 |    5 | python  |    78 |
+----+------+---------+-------+
1 row in set (0.00 sec)

-- 查看zhangsan的成绩信息
MariaDB [mydb]> select * from grade where sid=(select id from stu where name='zhangsan');
+----+------+---------+-------+
| id | sid  | subject | score |
+----+------+---------+-------+
|  9 |    1 | python  |    69 |
+----+------+---------+-------+
1 row in set (0.00 sec)

MariaDB [mydb]> select  * from stu;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  4 | zhaoliu  |  19 | w   | python04 |
|  5 | qq01     |  20 | m   | python03 |
|  6 | qq02     |  21 | w   | python04 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  21 | w   | python04 |
|  9 | uu02     |  20 | m   | python05 |
| 10 | aa       |  29 | w   | python03 |
| 11 | bb       |  20 | m   | python04 |
+----+----------+-----+-----+----------+
11 rows in set (0.00 sec)

MariaDB [mydb]> select * from grade;
+----+------+---------+-------+
| id | sid  | subject | score |
+----+------+---------+-------+
|  1 |    3 | python  |    87 |
|  2 |    4 | python  |    90 |
|  3 |    2 | python  |    58 |
|  4 |    7 | python  |    98 |
|  5 |    5 | python  |    78 |
|  6 |    9 | python  |    86 |
|  7 |   11 | python  |    88 |
|  8 |   10 | python  |    76 |
|  9 |    1 | python  |    69 |
+----+------+---------+-------+
9 rows in set (0.00 sec)

--使用where关联查询学员和成绩表的信息
MariaDB [mydb]> select s.id,s.name,g.subject,g.score from stu s,grade g where s.id=g.sid;
+----+----------+---------+-------+
| id | name     | subject | score |
+----+----------+---------+-------+
|  3 | wangwu   | python  |    87 |
|  4 | zhaoliu  | python  |    90 |
|  2 | lisi     | python  |    58 |
|  7 | qq03     | python  |    98 |
|  5 | qq01     | python  |    78 |
|  9 | uu02     | python  |    86 |
| 11 | bb       | python  |    88 |
| 10 | aa       | python  |    76 |
|  1 | zhangsan | python  |    69 |
+----+----------+---------+-------+
9 rows in set (0.00 sec)

-- where关联查询并排序
MariaDB [mydb]> select s.id,s.name,g.subject,g.score from stu s,grade g 
             -> where s.id=g.sid order by g.score desc;
+----+----------+---------+-------+
| id | name     | subject | score |
+----+----------+---------+-------+
|  7 | qq03     | python  |    98 |
|  4 | zhaoliu  | python  |    90 |
| 11 | bb       | python  |    88 |
|  3 | wangwu   | python  |    87 |
|  9 | uu02     | python  |    86 |
|  5 | qq01     | python  |    78 |
| 10 | aa       | python  |    76 |
|  1 | zhangsan | python  |    69 |
|  2 | lisi     | python  |    58 |
+----+----------+---------+-------+
9 rows in set (0.00 sec)


-- 查询python03期的关联信息
MariaDB [mydb]> select s.id,s.name,s.classid,g.subject,g.score from stu s,grade g
			 -> where s.id=g.sid and s.classid="python03";
+----+----------+----------+---------+-------+
| id | name     | classid  | subject | score |
+----+----------+----------+---------+-------+
|  3 | wangwu   | python03 | python  |    87 |
|  5 | qq01     | python03 | python  |    78 |
| 10 | aa       | python03 | python  |    76 |
|  1 | zhangsan | python03 | python  |    69 |
+----+----------+----------+---------+-------+
4 rows in set (0.00 sec)

-- 查询python03期的学员信息
MariaDB [mydb]> select * from stu where classid="python03";
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  3 | wangwu   |  20 | m   | python03 |
|  5 | qq01     |  20 | m   | python03 |
| 10 | aa       |  29 | w   | python03 |
+----+----------+-----+-----+----------+
4 rows in set (0.00 sec)

-- where关联查询python04期的学员及成绩信息（交集）
MariaDB [mydb]> select s.id,s.name,s.classid,g.subject,g.score from stu s,grade g
    		 -> where s.id=g.sid and s.classid="python04";
+----+---------+----------+---------+-------+
| id | name    | classid  | subject | score |
+----+---------+----------+---------+-------+
|  4 | zhaoliu | python04 | python  |    90 |
|  2 | lisi    | python04 | python  |    58 |
| 11 | bb      | python04 | python  |    88 |
+----+---------+----------+---------+-------+
3 rows in set (0.00 sec)

-- 查询python04学员信息5条，比上面多了两条。也就是上面少了学员信息
MariaDB [mydb]> select * from stu where classid="python04";
+----+---------+-----+-----+----------+
| id | name    | age | sex | classid  |
+----+---------+-----+-----+----------+
|  2 | lisi    |  25 | w   | python04 |
|  4 | zhaoliu |  19 | w   | python04 |
|  6 | qq02    |  21 | w   | python04 |
|  8 | uu01    |  21 | w   | python04 |
| 11 | bb      |  20 | m   | python04 |
+----+---------+-----+-----+----------+
5 rows in set (0.00 sec)

MariaDB [mydb]>


--使用left join左联查询，以stu表为主的查询。没有的成绩信息补空
MariaDB [mydb]> select s.id,s.name,s.classid,g.subject,g.score from stu s
    -> left join grade g on s.id=g.sid where s.classid="python04";
+----+---------+----------+---------+-------+
| id | name    | classid  | subject | score |
+----+---------+----------+---------+-------+
|  4 | zhaoliu | python04 | python  |    90 |
|  2 | lisi    | python04 | python  |    58 |
| 11 | bb      | python04 | python  |    88 |
|  6 | qq02    | python04 | NULL    |  NULL |
|  8 | uu01    | python04 | NULL    |  NULL |
+----+---------+----------+---------+-------+
5 rows in set (0.00 sec)

-- 内联查询，结果等价于where关联查询。
MariaDB [mydb]> select s.id,s.name,s.classid,g.subject,g.score from stu s
    -> inner join grade g on s.id=g.sid where s.classid="python04";
+----+---------+----------+---------+-------+
| id | name    | classid  | subject | score |
+----+---------+----------+---------+-------+
|  4 | zhaoliu | python04 | python  |    90 |
|  2 | lisi    | python04 | python  |    58 |
| 11 | bb      | python04 | python  |    88 |
+----+---------+----------+---------+-------+
3 rows in set (0.00 sec)


--使用right join右联查询，以stu表为主的查询。没有的成绩信息补空
MariaDB [mydb]> select s.id,s.name,s.classid,g.subject,g.score from grade g
    -> right join stu s on s.id=g.sid where s.classid="python04";
+----+---------+----------+---------+-------+
| id | name    | classid  | subject | score |
+----+---------+----------+---------+-------+
|  4 | zhaoliu | python04 | python  |    90 |
|  2 | lisi    | python04 | python  |    58 |
| 11 | bb      | python04 | python  |    88 |
|  6 | qq02    | python04 | NULL    |  NULL |
|  8 | uu01    | python04 | NULL    |  NULL |
+----+---------+----------+---------+-------+
5 rows in set (0.00 sec)

MariaDB [mydb]>


