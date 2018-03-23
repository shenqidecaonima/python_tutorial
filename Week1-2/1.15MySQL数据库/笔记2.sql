--2. MySQL的基础操作：
--==================================================================

-- 使用mysql命令连接当前mysql数据库服务（登录连接）
C:\Users\张涛>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.1.30-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

--第一部分： 数据库操作
--================================================================================

-- 查看当前下所有可见的数据库
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
5 rows in set (0.00 sec)

--创建数据库mydb
MariaDB [(none)]> create database mydb;
Query OK, 1 row affected (0.00 sec)

--再次创建数据库报错误
MariaDB [(none)]> create database mydb;
ERROR 1007 (HY000): Can''t create database 'mydb'; database exists

-- 使用if not exists先判断是否不存在，再创建数据库，可以不报错误
MariaDB [(none)]> create database if not exists mydb;
Query OK, 0 rows affected, 1 warning (0.00 sec)

-- 尝试创建mydemo数据库
MariaDB [(none)]> create database if not exists mydemo;
Query OK, 1 row affected (0.00 sec)

--查看所有数据库
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mydb               |
| mydemo             |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
7 rows in set (0.00 sec)

--选择进入mydb数据库
MariaDB [(none)]> use mydb;
Database changed

--查看当前在哪个数据库下
MariaDB [mydb]> select database();
+------------+
| database() |
+------------+
| mydb       |
+------------+
1 row in set (0.00 sec)

--选择进入mydemo数据库
MariaDB [mydb]> use mydemo;
Database changed

-- 查看mydemo的建库sql语句
MariaDB [mydemo]> show create database mydemo;
+----------+-------------------------------------------------------------------+

| Database | Create Database                                                   |

+----------+-------------------------------------------------------------------+

| mydemo   | CREATE DATABASE `mydemo` /*!40100 DEFAULT CHARACTER SET latin1 */ |

+----------+-------------------------------------------------------------------+

1 row in set (0.00 sec)

-- 使用文本方式查看建库语句
MariaDB [mydemo]> show create database mydemo\G
*************************** 1. row ***************************
       Database: mydemo
Create Database: CREATE DATABASE `mydemo` /*!40100 DEFAULT CHARACTER SET latin1
*/
1 row in set (0.00 sec)

--选择进入mydb数据库
MariaDB [mydemo]> use mydb;
Database changed

--尝试删除mydemo数据库
MariaDB [mydb]> drop database if exists mydemo;
Query OK, 0 rows affected (0.01 sec)

MariaDB [mydb]> drop database if exists mydemo;
Query OK, 0 rows affected, 1 warning (0.00 sec)

-- 直接删除mydemo数据库，报错
MariaDB [mydb]> drop database mydemo;
ERROR 1008 (HY000): Can't drop database 'mydemo'; database doesn't exist
MariaDB [mydb]>


--第二部分： 数据表操作
--==========================================================================

--创建数据表demo（要在某个数据库中执行），内有三个字段
MariaDB [mydb]> create table demo(
    -> name varchar(16),
    -> age int,
    -> sex enum('w','m'));
Query OK, 0 rows affected (0.01 sec)

--查看当前库下数据表
MariaDB [mydb]> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| demo           |
+----------------+
1 row in set (0.00 sec)

--查看数据表demo的表结构
MariaDB [mydb]> desc demo;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| name  | varchar(16)   | YES  |     | NULL    |       |
| age   | int(11)       | YES  |     | NULL    |       |
| sex   | enum('w','m') | YES  |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

--查看建表sql语句
MariaDB [mydb]> show create table demo;
+-------+-----------------------------------------------------------------------
--------------------------------------------------------------------------------
-----------+
| Table | Create Table

           |
+-------+-----------------------------------------------------------------------
--------------------------------------------------------------------------------
-----------+
| demo  | CREATE TABLE `demo` (
  `name` varchar(16) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` enum('w','m') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+-------+-----------------------------------------------------------------------
--------------------------------------------------------------------------------
-----------+
1 row in set (0.00 sec)

--格式化查看建表语句
MariaDB [mydb]> show create table demo\G
*************************** 1. row ***************************
       Table: demo
Create Table: CREATE TABLE `demo` (
  `name` varchar(16) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` enum('w','m') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)


--创建数据表dd
MariaDB [mydb]> create table dd(
    -> name varchar(10),
    -> age int);
Query OK, 0 rows affected (0.00 sec)

--查看当前库下所有表
MariaDB [mydb]> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| dd             |
| demo           |
+----------------+
2 rows in set (0.00 sec)

-- 查看dd表结构
MariaDB [mydb]> desc dd;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(10) | YES  |     | NULL    |       |
| age   | int(11)     | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

--查看demo表结构
MariaDB [mydb]> desc demo;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| name  | varchar(16)   | YES  |     | NULL    |       |
| age   | int(11)       | YES  |     | NULL    |       |
| sex   | enum('w','m') | YES  |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

--另外一个查看表结构语句
MariaDB [mydb]> show columns from demo;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| name  | varchar(16)   | YES  |     | NULL    |       |
| age   | int(11)       | YES  |     | NULL    |       |
| sex   | enum('w','m') | YES  |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

-- 尝试删除数据表aa
MariaDB [mydb]> drop table if exists aa;
Query OK, 0 rows affected, 1 warning (0.00 sec)

--尝试删除数据表dd
MariaDB [mydb]> drop table if exists dd;
Query OK, 0 rows affected (0.01 sec)

--查看所有数据表
MariaDB [mydb]> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| demo           |
+----------------+
1 row in set (0.00 sec)

-- 第三部分：数据的增删改查操作
--=================================================================

--查看表结构
MariaDB [mydb]> desc demo;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| name  | varchar(16)   | YES  |     | NULL    |       |
| age   | int(11)       | YES  |     | NULL    |       |
| sex   | enum('w','m') | YES  |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

--添加数据一个
MariaDB [mydb]> insert into demo(name,age,sex) values('zhangsan',20,'m');
Query OK, 1 row affected (0.00 sec)

MariaDB [mydb]> insert into demo(name,age,sex) values('wangwu',22,'w');
Query OK, 1 row affected (0.00 sec)

-- 少指定一个值添加报错
MariaDB [mydb]> insert into demo(name,age,sex) values('wangwu',22);
ERROR 1136 (21S01): Column count doesn''t match value count at row 1

-- 数据添加
MariaDB [mydb]> insert into demo(name,age,sex) values('lisi',25,'w');
Query OK, 1 row affected (0.00 sec)

--查看demo表的所有数据
MariaDB [mydb]> select * from demo;
+----------+------+------+
| name     | age  | sex  |
+----------+------+------+
| zhangsan |   20 | m    |
| wangwu   |   22 | w    |
| lisi     |   25 | w    |
+----------+------+------+
3 rows in set (0.00 sec)

--修改：将年龄改为30，所有数据都会被修改
MariaDB [mydb]> update demo set age=30;
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

--查看数据
MariaDB [mydb]> select * from demo;
+----------+------+------+
| name     | age  | sex  |
+----------+------+------+
| zhangsan |   30 | m    |
| wangwu   |   30 | w    |
| lisi     |   30 | w    |
+----------+------+------+
3 rows in set (0.00 sec)

-- 将zhangsan的年龄age改为35
MariaDB [mydb]> update demo set age=35 where name='zhangsan';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

--查看数据
MariaDB [mydb]> select * from demo;
+----------+------+------+
| name     | age  | sex  |
+----------+------+------+
| zhangsan |   35 | m    |
| wangwu   |   30 | w    |
| lisi     |   30 | w    |
+----------+------+------+
3 rows in set (0.00 sec)

--删除age年龄为30的所有数据
MariaDB [mydb]> delete from demo where age=30;
Query OK, 2 rows affected (0.00 sec)

--查看数据
MariaDB [mydb]> select * from demo;
+----------+------+------+
| name     | age  | sex  |
+----------+------+------+
| zhangsan |   35 | m    |
+----------+------+------+
1 row in set (0.00 sec)

MariaDB [mydb]>

