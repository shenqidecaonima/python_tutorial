--### 3.MySQL数据类型与操作
--=============================================

-- 创建tt数据库表
MariaDB [mydb]> create table tt(
    -> name varchar(8) not null unique,
    -> age tinyint unsigned not null default 20,
    -> atime datetime);
Query OK, 0 rows affected (0.01 sec)

--查看表结构
MariaDB [mydb]> desc tt;
+-------+---------------------+------+-----+---------+-------+
| Field | Type                | Null | Key | Default | Extra |
+-------+---------------------+------+-----+---------+-------+
| name  | varchar(8)          | NO   | PRI | NULL    |       |
| age   | tinyint(3) unsigned | NO   |     | 20      |       |
| atime | datetime            | YES  |     | NULL    |       |
+-------+---------------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

--查看tt的建表语句
MariaDB [mydb]> show create table tt\G
*************************** 1. row ***************************
       Table: tt
Create Table: CREATE TABLE `tt` (
  `name` varchar(8) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `atime` datetime DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

-- 查看所有数据表
MariaDB [mydb]> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| demo           |
| tt             |
+----------------+
2 rows in set (0.00 sec)

-- 添加一个数据
MariaDB [mydb]> insert into tt(name,age,atime) values("zhangsan",30,'2018-3-8 12
:24:36');
Query OK, 1 row affected (0.00 sec)

--查看数据
MariaDB [mydb]> select * from tt;
+----------+-----+---------------------+
| name     | age | atime               |
+----------+-----+---------------------+
| zhangsan |  30 | 2018-03-08 12:24:36 |
+----------+-----+---------------------+
1 row in set (0.00 sec)

-- 指定部分字段添加数据
MariaDB [mydb]> insert into tt(name) values("lisi");
ERROR 1062 (23000): Duplicate entry 'lisi' for key 'name'

--查看数据
MariaDB [mydb]> select * from tt;
+----------+-----+---------------------+
| name     | age | atime               |
+----------+-----+---------------------+
| lisi     |  20 | NULL                |
| zhangsan |  30 | 2018-03-08 12:24:36 |
+----------+-----+---------------------+
2 rows in set (0.00 sec)

--添加数据（尝试age给负值）
MariaDB [mydb]> insert into tt(name,age,atime) values('wangwu',-30,'2018-3-8 12:
24:36');
Query OK, 1 row affected, 1 warning (0.00 sec)

--查看数据
MariaDB [mydb]> select * from tt;
+----------+-----+---------------------+
| name     | age | atime               |
+----------+-----+---------------------+
| lisi     |  20 | NULL                |
| wangwu   |   0 | 2018-03-08 12:24:36 |
| zhangsan |  30 | 2018-03-08 12:24:36 |
+----------+-----+---------------------+
3 rows in set (0.00 sec)

--查看demo表数据
MariaDB [mydb]> select * from demo;
+----------+------+------+
| name     | age  | sex  |
+----------+------+------+
| zhangsan |   35 | m    |
+----------+------+------+
1 row in set (0.00 sec)

-- 添加数据
MariaDB [mydb]> insert into demo(name,age,sex) values('zhangsan',-20,'w');
Query OK, 1 row affected (0.00 sec)

--查看数据，age字段没有正数约束，导致可以赋予负数
MariaDB [mydb]> select * from demo;
+----------+------+------+
| name     | age  | sex  |
+----------+------+------+
| zhangsan |   35 | m    |
| zhangsan |  -20 | w    |
+----------+------+------+
2 rows in set (0.00 sec)

--查看tt表
MariaDB [mydb]> select * from tt;
+----------+-----+---------------------+
| name     | age | atime               |
+----------+-----+---------------------+
| lisi     |  20 | NULL                |
| wangwu   |   0 | 2018-03-08 12:24:36 |
| zhangsan |  30 | 2018-03-08 12:24:36 |
+----------+-----+---------------------+
3 rows in set (0.00 sec)

--测试运算符
MariaDB [mydb]> select 10+20;
+-------+
| 10+20 |
+-------+
|    30 |
+-------+
1 row in set (0.00 sec)

--sql中没有布尔类型值，所有False假为0，True为1
MariaDB [mydb]> select 10>20;
+-------+
| 10>20 |
+-------+
|     0 |
+-------+
1 row in set (0.00 sec)

MariaDB [mydb]> select 100>20;
+--------+
| 100>20 |
+--------+
|      1 |
+--------+
1 row in set (0.00 sec)

--判断10在后面一组数值里面
MariaDB [mydb]> select 10 in (10,20,30);
+------------------+
| 10 in (10,20,30) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)

MariaDB [mydb]> select 50 in (10,20,30);
+------------------+
| 50 in (10,20,30) |
+------------------+
|                0 |
+------------------+
1 row in set (0.00 sec)

--判断10是否在1到100之中吗（包含1和100）
MariaDB [mydb]> select 10 between 1 and 100;
+----------------------+
| 10 between 1 and 100 |
+----------------------+
|                    1 |
+----------------------+
1 row in set (0.00 sec)

-- 两者之间判断
MariaDB [mydb]> select 110 between 1 and 100;
+-----------------------+
| 110 between 1 and 100 |
+-----------------------+
|                     0 |
+-----------------------+
1 row in set (0.00 sec)

--查看tt表结构
MariaDB [mydb]> desc tt;
+-------+---------------------+------+-----+---------+-------+
| Field | Type                | Null | Key | Default | Extra |
+-------+---------------------+------+-----+---------+-------+
| name  | varchar(8)          | NO   | PRI | NULL    |       |
| age   | tinyint(3) unsigned | NO   |     | 20      |       |
| atime | datetime            | YES  |     | NULL    |       |
+-------+---------------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

--为tt表添加一个字段num，默认添加到最后
MariaDB [mydb]> alter table tt add num int;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

--查看表结构
MariaDB [mydb]> desc tt;
+-------+---------------------+------+-----+---------+-------+
| Field | Type                | Null | Key | Default | Extra |
+-------+---------------------+------+-----+---------+-------+
| name  | varchar(8)          | NO   | PRI | NULL    |       |
| age   | tinyint(3) unsigned | NO   |     | 20      |       |
| atime | datetime            | YES  |     | NULL    |       |
| num   | int(11)             | YES  |     | NULL    |       |
+-------+---------------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

--删除字段num
MariaDB [mydb]> alter table tt drop num;
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

--查看表结构
MariaDB [mydb]> desc tt;
+-------+---------------------+------+-----+---------+-------+
| Field | Type                | Null | Key | Default | Extra |
+-------+---------------------+------+-----+---------+-------+
| name  | varchar(8)          | NO   | PRI | NULL    |       |
| age   | tinyint(3) unsigned | NO   |     | 20      |       |
| atime | datetime            | YES  |     | NULL    |       |
+-------+---------------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

--在表tt的age字段后添加一个num字段
MariaDB [mydb]> alter table tt add num int after age;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

--查看表结构
MariaDB [mydb]> desc tt;
+-------+---------------------+------+-----+---------+-------+
| Field | Type                | Null | Key | Default | Extra |
+-------+---------------------+------+-----+---------+-------+
| name  | varchar(8)          | NO   | PRI | NULL    |       |
| age   | tinyint(3) unsigned | NO   |     | 20      |       |
| num   | int(11)             | YES  |     | NULL    |       |
| atime | datetime            | YES  |     | NULL    |       |
+-------+---------------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

--在tt表的最前面添加一个字段
MariaDB [mydb]> alter table tt add id int first;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

--查看表结构
MariaDB [mydb]> desc tt;
+-------+---------------------+------+-----+---------+-------+
| Field | Type                | Null | Key | Default | Extra |
+-------+---------------------+------+-----+---------+-------+
| id    | int(11)             | YES  |     | NULL    |       |
| name  | varchar(8)          | NO   | PRI | NULL    |       |
| age   | tinyint(3) unsigned | NO   |     | 20      |       |
| num   | int(11)             | YES  |     | NULL    |       |
| atime | datetime            | YES  |     | NULL    |       |
+-------+---------------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

--查看数据
MariaDB [mydb]> select * from tt;
+------+----------+-----+------+---------------------+
| id   | name     | age | num  | atime               |
+------+----------+-----+------+---------------------+
| NULL | lisi     |  20 | NULL | NULL                |
| NULL | wangwu   |   0 | NULL | 2018-03-08 12:24:36 |
| NULL | zhangsan |  30 | NULL | 2018-03-08 12:24:36 |
+------+----------+-----+------+---------------------+
3 rows in set (0.00 sec)

--查看表结构
MariaDB [mydb]> desc tt;
+-------+---------------------+------+-----+---------+-------+
| Field | Type                | Null | Key | Default | Extra |
+-------+---------------------+------+-----+---------+-------+
| id    | int(11)             | YES  |     | NULL    |       |
| name  | varchar(8)          | NO   | PRI | NULL    |       |
| age   | tinyint(3) unsigned | NO   |     | 20      |       |
| num   | int(11)             | YES  |     | NULL    |       |
| atime | datetime            | YES  |     | NULL    |       |
+-------+---------------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

--修改表中字段
MariaDB [mydb]> alter table tt change atime addtime datetime;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

--查看表结构
MariaDB [mydb]> desc tt;
+---------+---------------------+------+-----+---------+-------+
| Field   | Type                | Null | Key | Default | Extra |
+---------+---------------------+------+-----+---------+-------+
| id      | int(11)             | YES  |     | NULL    |       |
| name    | varchar(8)          | NO   | PRI | NULL    |       |
| age     | tinyint(3) unsigned | NO   |     | 20      |       |
| num     | int(11)             | YES  |     | NULL    |       |
| addtime | datetime            | YES  |     | NULL    |       |
+---------+---------------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

--修改字段num的信息
MariaDB [mydb]> alter table tt modify num tinyint unsigned;
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [mydb]> desc tt;
+---------+---------------------+------+-----+---------+-------+
| Field   | Type                | Null | Key | Default | Extra |
+---------+---------------------+------+-----+---------+-------+
| id      | int(11)             | YES  |     | NULL    |       |
| name    | varchar(8)          | NO   | PRI | NULL    |       |
| age     | tinyint(3) unsigned | NO   |     | 20      |       |
| num     | tinyint(3) unsigned | YES  |     | NULL    |       |
| addtime | datetime            | YES  |     | NULL    |       |
+---------+---------------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

--修改表名tt改为tt2
MariaDB [mydb]> alter table tt rename as tt2;
Query OK, 0 rows affected (0.01 sec)

--查看数据表
MariaDB [mydb]> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| demo           |
| tt2            |
+----------------+
2 rows in set (0.00 sec)

--查看tt2的建表语句
MariaDB [mydb]> show create table tt2\G
*************************** 1. row ***************************
       Table: tt2
Create Table: CREATE TABLE `tt2` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(8) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `num` tinyint(3) unsigned DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

--修改tt2表的表类型改为myisam
MariaDB [mydb]> alter table tt2 engine myisam;
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

--查看建表语句
MariaDB [mydb]> show create table tt2\G
*************************** 1. row ***************************
       Table: tt2
Create Table: CREATE TABLE `tt2` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(8) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `num` tinyint(3) unsigned DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

--修改表结构为innodb
MariaDB [mydb]> alter table tt2 engine innodb;
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

--查看表结构
MariaDB [mydb]> show create table tt2\G
*************************** 1. row ***************************
       Table: tt2
Create Table: CREATE TABLE `tt2` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(8) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `num` tinyint(3) unsigned DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

MariaDB [mydb]>
