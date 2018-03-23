-- 8. 数据库的其他操作：
--================================================================

-- 复制stu表结构到stu2表中（创建一个空表stu2，结构参考stu）
MariaDB [mydb]> create table stu2 like stu;
Query OK, 0 rows affected (0.01 sec)

-- 查看表结构
MariaDB [mydb]> desc stu2;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | NO   |     | 20      |                |
| sex     | enum('w','m')       | NO   |     | m       |                |
| classid | char(8)             | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+

MariaDB [mydb]> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | NO   |     | 20      |                |
| sex     | enum('w','m')       | NO   |     | m       |                |
| classid | char(8)             | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+

--stu2表中没有数据
MariaDB [mydb]> select * from stu2;
Query OK, 0 rows affected (0.00 sec)

--查看数据表stu信息
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

-- 复制stu表中部分数据到stu2表中
MariaDB [mydb]> insert into stu2 select * from stu where classid="python04";
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

-- 查询stu2表数据
MariaDB [mydb]> select * from stu2;
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

--查询stu表年龄为20的信息（此字段没有建立索引，查询效率最低）
MariaDB [mydb]> select * from stu where age=20;
+----+--------+-----+-----+----------+
| id | name   | age | sex | classid  |
+----+--------+-----+-----+----------+
|  3 | wangwu |  20 | m   | python03 |
|  5 | qq01   |  20 | m   | python03 |
|  7 | qq03   |  20 | m   | python05 |
|  9 | uu02   |  20 | m   | python05 |
| 11 | bb     |  20 | m   | python04 |
+----+--------+-----+-----+----------+
5 rows in set (0.00 sec)

--查看表结构
MariaDB [mydb]> desc stu;
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

--为stu表的age字段创建一个索引，名字为index_age
MariaDB [mydb]> create index index_age on stu(age);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- 查看表结构，可以看到索引
MariaDB [mydb]> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | NO   | MUL | 20      |                |
| sex     | enum('w','m')       | NO   |     | m       |                |
| classid | char(8)             | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

-- 查看建表语句
MariaDB [mydb]> show create table stu\G
*************************** 1. row ***************************
       Table: stu
Create Table: CREATE TABLE `stu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `sex` enum('w','m') NOT NULL DEFAULT 'm',
  `classid` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `index_age` (`age`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

--删除索引
MariaDB [mydb]> drop index index_age on stu;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [mydb]> desc stu;
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

-
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


--查询，将两个字段的数据合成一个字段显示，函数连接字串
MariaDB [mydb]> select concat(classid,":",name) from stu;
+--------------------------+
| concat(classid,":",name) |
+--------------------------+
| python03:zhangsan        |
| python04:lisi            |
| python03:wangwu          |
| python04:zhaoliu         |
| python03:qq01            |
| python04:qq02            |
| python05:qq03            |
| python04:uu01            |
| python05:uu02            |
| python03:aa              |
| python04:bb              |
+--------------------------+
11 rows in set (0.00 sec)

--查询name字串4位的所有信息。
MariaDB [mydb]> select * from stu where length(name)=4;
+----+------+-----+-----+----------+
| id | name | age | sex | classid  |
+----+------+-----+-----+----------+
|  2 | lisi |  25 | w   | python04 |
|  5 | qq01 |  20 | m   | python03 |
|  6 | qq02 |  21 | w   | python04 |
|  7 | qq03 |  20 | m   | python05 |
|  8 | uu01 |  21 | w   | python04 |
|  9 | uu02 |  20 | m   | python05 |
+----+------+-----+-----+----------+
6 rows in set (0.00 sec)

--查看随机数
MariaDB [mydb]> select  rand();
+---------------------+
| rand()              |
+---------------------+
| 0.47997780933974105 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [mydb]> select  rand();
+---------------------+
| rand()              |
+---------------------+
| 0.08136331483848702 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [mydb]> select  rand();
+--------------------+
| rand()             |
+--------------------+
| 0.9668831769068569 |
+--------------------+
1 row in set (0.00 sec)

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
--随机获取三条
MariaDB [mydb]> select * from stu order by rand() limit 3;
+----+---------+-----+-----+----------+
| id | name    | age | sex | classid  |
+----+---------+-----+-----+----------+
|  2 | lisi    |  25 | w   | python04 |
|  8 | uu01    |  21 | w   | python04 |
|  4 | zhaoliu |  19 | w   | python04 |
+----+---------+-----+-----+----------+
3 rows in set (0.00 sec)

MariaDB [mydb]> select * from stu order by rand() limit 3;
+----+---------+-----+-----+----------+
| id | name    | age | sex | classid  |
+----+---------+-----+-----+----------+
|  6 | qq02    |  21 | w   | python04 |
|  5 | qq01    |  20 | m   | python03 |
|  4 | zhaoliu |  19 | w   | python04 |
+----+---------+-----+-----+----------+
3 rows in set (0.00 sec)

MariaDB [mydb]> select * from stu order by rand() limit 3;
+----+---------+-----+-----+----------+
| id | name    | age | sex | classid  |
+----+---------+-----+-----+----------+
|  7 | qq03    |  20 | m   | python05 |
|  4 | zhaoliu |  19 | w   | python04 |
|  6 | qq02    |  21 | w   | python04 |
+----+---------+-----+-----+----------+
3 rows in set (0.00 sec)

MariaDB [mydb]> select now()
    -> ;
+---------------------+
| now()               |
+---------------------+
| 2018-03-07 11:50:25 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [mydb]> select version();
+-----------------+
| version()       |
+-----------------+
| 10.1.30-MariaDB |
+-----------------+
1 row in set (0.00 sec)

MariaDB [mydb]> select  database();
+------------+
| database() |
+------------+
| mydb       |
+------------+
1 row in set (0.00 sec)

-- 查看建表语句
MariaDB [mydb]> show create table stu\G
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

MariaDB [mydb]>

--MySQL中的事务操作
--============================================

-- 开启事务
MariaDB [mydb]> set autocommit=0;
Query OK, 0 rows affected (0.00 sec)

--
MariaDB [mydb]> delete from stu where id in(2,4,6,8);
Query OK, 4 rows affected (0.00 sec)

MariaDB [mydb]> select * from stu;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  3 | wangwu   |  20 | m   | python03 |
|  5 | qq01     |  20 | m   | python03 |
|  7 | qq03     |  20 | m   | python05 |
|  9 | uu02     |  20 | m   | python05 |
| 10 | aa       |  29 | w   | python03 |
| 11 | bb       |  20 | m   | python04 |
+----+----------+-----+-----+----------+
7 rows in set (0.00 sec)

MariaDB [mydb]> update stu set sex="w";
Query OK, 6 rows affected (0.00 sec)
Rows matched: 7  Changed: 6  Warnings: 0

MariaDB [mydb]> select * from stu;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | w   | python03 |
|  3 | wangwu   |  20 | w   | python03 |
|  5 | qq01     |  20 | w   | python03 |
|  7 | qq03     |  20 | w   | python05 |
|  9 | uu02     |  20 | w   | python05 |
| 10 | aa       |  29 | w   | python03 |
| 11 | bb       |  20 | w   | python04 |
+----+----------+-----+-----+----------+
7 rows in set (0.00 sec)

--回滚操作 commit提交命令
MariaDB [mydb]> rollback;
Query OK, 0 rows affected (0.02 sec)

-- 数据又显示回来了
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

MariaDB [mydb]> commit; --提交事务
Query OK, 0 rows affected (0.00 sec)

MariaDB [mydb]> rollback;
Query OK, 0 rows affected (0.00 sec)

--开启自动事务提交功能
MariaDB [mydb]> set autocommit=1;
Query OK, 0 rows affected (0.00 sec)

