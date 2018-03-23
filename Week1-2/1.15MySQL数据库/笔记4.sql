--##4.数据的DML操作：数据的添加，修改与删除
--==================================================


--登录mysql数据库
C:\Users\张涛>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 11
Server version: 10.1.30-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

--创建数据库
MariaDB [(none)]> create database mydemo;
Query OK, 1 row affected (0.00 sec)

--进入数据库mydemo
MariaDB [(none)]> use mydemo;
Database changed

--创建数据表stu
MariaDB [mydemo]> create table stu(
    -> id int unsigned not null auto_increment primary key,
    -> name varchar(16) not null unique,
    -> age tinyint unsigned not null default 20,
    -> sex enum('w','m') not null default 'm',
    -> classid char(8)
    -> );
Query OK, 0 rows affected (0.01 sec)

--查看stu表结构
MariaDB [mydemo]> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | NO   |     | 20      |                |
| sex     | enum('w','m')       | NO   |     | m       |                |
| classid | char(8)             | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.02 sec)

--查看stu表的建表语句
MariaDB [mydemo]> show create table stu\G
*************************** 1. row ***************************
       Table: stu
Create Table: CREATE TABLE `stu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `sex` enum('w','m') NOT NULL DEFAULT 'm',
  `classid` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

--查看当前库下所有的表
MariaDB [mydemo]> show tables;
+------------------+
| Tables_in_mydemo |
+------------------+
| stu              |
+------------------+
1 row in set (0.00 sec)

--添加一个条数据（标准的，给定所有字段和值）
MariaDB [mydemo]> insert into stu(id,name,age,sex,classid)
    -> values(1,"zhangsan",22,'m','python03');
Query OK, 1 row affected (0.00 sec)

--查看表结构
MariaDB [mydemo]> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | NO   |     | 20      |                |
| sex     | enum('w','m')       | NO   |     | m       |                |
| classid | char(8)             | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

--插入一个数据（不指定字段添加值）
MariaDB [mydemo]> insert into stu values(null,'lisi',25,'w','python04');
Query OK, 1 row affected (0.00 sec)

--插入一条数据（指定部分字段添加值）
MariaDB [mydemo]> insert into stu(name,classid) values("wangwu",'python03');
Query OK, 1 row affected (0.00 sec)

MariaDB [mydemo]> select * from stu;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
+----+----------+-----+-----+----------+
3 rows in set (0.00 sec)

-- 批量添加信息
MariaDB [mydemo]> insert into stu(name,classid) values("zhaoliu",'python04'),
    -> ('qq01','python03'),
    -> ('qq02','python04'),
    -> ('qq03','python05'),
    -> ('uu01','python04'),
    -> ('uu02','python05');
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0


--查看stu表信息
MariaDB [mydemo]> select * from stu;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  4 | zhaoliu  |  20 | m   | python04 |
|  5 | qq01     |  20 | m   | python03 |
|  6 | qq02     |  20 | m   | python04 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  20 | m   | python04 |
|  9 | uu02     |  20 | m   | python05 |
+----+----------+-----+-----+----------+
9 rows in set (0.00 sec)

--再添加2条
MariaDB [mydemo]> insert into stu(name,classid) values("aa",'python03'),
    -> ('bb','python04');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

--查看数据
MariaDB [mydemo]> select * from stu;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  4 | zhaoliu  |  20 | m   | python04 |
|  5 | qq01     |  20 | m   | python03 |
|  6 | qq02     |  20 | m   | python04 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  20 | m   | python04 |
|  9 | uu02     |  20 | m   | python05 |
| 10 | aa       |  20 | m   | python03 |
| 11 | bb       |  20 | m   | python04 |
+----+----------+-----+-----+----------+
11 rows in set (0.00 sec)

--修改
MariaDB [mydemo]> update stu set age=21,sex='w' where id in(6,8);
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

-- 查看
MariaDB [mydemo]> select * from stu;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  4 | zhaoliu  |  20 | m   | python04 |
|  5 | qq01     |  20 | m   | python03 |
|  6 | qq02     |  21 | w   | python04 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  21 | w   | python04 |
|  9 | uu02     |  20 | m   | python05 |
| 10 | aa       |  20 | m   | python03 |
| 11 | bb       |  20 | m   | python04 |
+----+----------+-----+-----+----------+
11 rows in set (0.00 sec)

-- 修改
MariaDB [mydemo]> update stu set age=29,sex="w" where id=10;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [mydemo]> update stu set age=19,sex="w" where id=4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
--查询
MariaDB [mydemo]> select * from stu;
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
--修改数据
MariaDB [mydemo]> update stu set age=29,sex="w" where id=100;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

--删除数据
MariaDB [mydemo]> delete from stu where id in(100,200);
Query OK, 0 rows affected (0.00 sec)

MariaDB [mydemo]> delete from stu where id>100;
Query OK, 0 rows affected (0.00 sec)

MariaDB [mydemo]> delete from stu where id between 100 and 200;
Query OK, 0 rows affected (0.00 sec)

MariaDB [mydemo]>


