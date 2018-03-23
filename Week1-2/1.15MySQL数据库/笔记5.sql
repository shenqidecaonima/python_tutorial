--5. 数据库的查询操作
--==========================================================

--查询所有数据
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

--查寻部分字段信息
MariaDB [mydemo]> select id,name,classid from stu;

--追加一个新的字段信息
MariaDB [mydemo]> select *,"beijing" as city from stu;

-- 查看id=2的信息
MariaDB [mydemo]> select * from stu where id=2;
+----+------+-----+-----+----------+
| id | name | age | sex | classid  |
+----+------+-----+-----+----------+
|  2 | lisi |  25 | w   | python04 |
+----+------+-----+-----+----------+
1 row in set (0.00 sec)

--查询id小于5的所有信息
MariaDB [mydemo]> select * from stu where id<5;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  4 | zhaoliu  |  19 | w   | python04 |
+----+----------+-----+-----+----------+
4 rows in set (0.00 sec)

-- 查询指定范围id信息的数据
MariaDB [mydemo]> select * from stu where id in (1,3,5,7);
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  3 | wangwu   |  20 | m   | python03 |
|  5 | qq01     |  20 | m   | python03 |
|  7 | qq03     |  20 | m   | python05 |
+----+----------+-----+-----+----------+
4 rows in set (0.00 sec)

--查询 age 在20~25的信息
MariaDB [mydemo]> select * from stu where age between 20 and 25;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  5 | qq01     |  20 | m   | python03 |
|  6 | qq02     |  21 | w   | python04 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  21 | w   | python04 |
|  9 | uu02     |  20 | m   | python05 |
| 11 | bb       |  20 | m   | python04 |
+----+----------+-----+-----+----------+
9 rows in set (0.00 sec)

--查询年龄不在20~25的信息
MariaDB [mydemo]> select * from stu where age not between 20 and 25;
+----+---------+-----+-----+----------+
| id | name    | age | sex | classid  |
+----+---------+-----+-----+----------+
|  4 | zhaoliu |  19 | w   | python04 |
| 10 | aa      |  29 | w   | python03 |
+----+---------+-----+-----+----------+
2 rows in set (0.00 sec)

--查询年龄在20~25的信息（含20和25）
MariaDB [mydemo]> select * from stu where age>=20 and age<=25;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  5 | qq01     |  20 | m   | python03 |
|  6 | qq02     |  21 | w   | python04 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  21 | w   | python04 |
|  9 | uu02     |  20 | m   | python05 |
| 11 | bb       |  20 | m   | python04 |
+----+----------+-----+-----+----------+
9 rows in set (0.00 sec)

--查询年龄不在20~25的信息
MariaDB [mydemo]> select * from stu where age<20 or age>25;
+----+---------+-----+-----+----------+
| id | name    | age | sex | classid  |
+----+---------+-----+-----+----------+
|  4 | zhaoliu |  19 | w   | python04 |
| 10 | aa      |  29 | w   | python03 |
+----+---------+-----+-----+----------+
2 rows in set (0.00 sec)


MariaDB [mydemo]> select * from mydb.demo;
+----------+------+------+
| name     | age  | sex  |
+----------+------+------+
| zhangsan |   35 | m    |
| zhangsan |  -20 | w    |
+----------+------+------+
2 rows in set (0.00 sec)

MariaDB [mydemo]> select * from mydb.tt2;
+------+----------+-----+------+---------------------+
| id   | name     | age | num  | addtime             |
+------+----------+-----+------+---------------------+
| NULL | lisi     |  20 | NULL | NULL                |
| NULL | wangwu   |   0 | NULL | 2018-03-08 12:24:36 |
| NULL | zhangsan |  30 | NULL | 2018-03-08 12:24:36 |
+------+----------+-----+------+---------------------+
3 rows in set (0.00 sec)

--查询addtime为null的信息
MariaDB [mydemo]> select * from mydb.tt2 where addtime is null;
+------+------+-----+------+---------+
| id   | name | age | num  | addtime |
+------+------+-----+------+---------+
| NULL | lisi |  20 | NULL | NULL    |
+------+------+-----+------+---------+
1 row in set (0.00 sec)

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

--模糊查询，查询name字段值含有a字母的所有信息
MariaDB [mydemo]> select * from stu where name like "%a%";
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  3 | wangwu   |  20 | m   | python03 |
|  4 | zhaoliu  |  19 | w   | python04 |
| 10 | aa       |  29 | w   | python03 |
+----+----------+-----+-----+----------+
4 rows in set (0.00 sec)

--模糊查询，查询name字段值含有ang字窜的所有信息
MariaDB [mydemo]> select * from stu where name like "%ang%";
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  3 | wangwu   |  20 | m   | python03 |
+----+----------+-----+-----+----------+
2 rows in set (0.00 sec)

-- 查询name值是由任意4位字符拼装的数据
MariaDB [mydemo]> select * from stu where name like "____";
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

--查询name是由uu字串开头的所有信息
MariaDB [mydemo]> select * from stu where name like "uu%";
+----+------+-----+-----+----------+
| id | name | age | sex | classid  |
+----+------+-----+-----+----------+
|  8 | uu01 |  21 | w   | python04 |
|  9 | uu02 |  20 | m   | python05 |
+----+------+-----+-----+----------+
2 rows in set (0.00 sec)

--查询name是由02结束的所有信息
MariaDB [mydemo]> select * from stu where name like "%02";
+----+------+-----+-----+----------+
| id | name | age | sex | classid  |
+----+------+-----+-----+----------+
|  6 | qq02 |  21 | w   | python04 |
|  9 | uu02 |  20 | m   | python05 |
+----+------+-----+-----+----------+
2 rows in set (0.00 sec)

--聚合函数，统计条数
MariaDB [mydemo]> select count(id) from stu;
+-----------+
| count(id) |
+-----------+
|        11 |
+-----------+
1 row in set (0.00 sec)


--查询总条数、最大年龄、最小年龄、年龄总和，平均年龄信息
MariaDB [mydemo]> select count(*),max(age),min(age),sum(age),avg(age) from stu;
+----------+----------+----------+----------+----------+
| count(*) | max(age) | min(age) | sum(age) | avg(age) |
+----------+----------+----------+----------+----------+
|       11 |       29 |       19 |      237 |  21.5455 |
+----------+----------+----------+----------+----------+
1 row in set (0.00 sec)

MariaDB [mydemo]> select classid from stu;
+----------+
| classid  |
+----------+
| python03 |
| python04 |
| python03 |
| python04 |
| python03 |
| python04 |
| python05 |
| python04 |
| python05 |
| python03 |
| python04 |
+----------+
11 rows in set (0.00 sec)

--分组去掉重复
MariaDB [mydemo]> select classid from stu group by classid;
+----------+
| classid  |
+----------+
| python03 |
| python04 |
| python05 |
+----------+
3 rows in set (0.00 sec)

--分组统计：统计每个班级的人数
MariaDB [mydemo]> select classid,count(*) from stu group by classid;
+----------+----------+
| classid  | count(*) |
+----------+----------+
| python03 |        4 |
| python04 |        5 |
| python05 |        2 |
+----------+----------+
3 rows in set (0.00 sec)

---分组统计每个班级人数和平均年龄
MariaDB [mydemo]> select classid,count(*),avg(age) from stu group by classid;
+----------+----------+----------+
| classid  | count(*) | avg(age) |
+----------+----------+----------+
| python03 |        4 |  22.7500 |
| python04 |        5 |  21.2000 |
| python05 |        2 |  20.0000 |
+----------+----------+----------+
3 rows in set (0.00 sec)

MariaDB [mydemo]> select classid,count(*) from stu group by classid;
+----------+----------+
| classid  | count(*) |
+----------+----------+
| python03 |        4 |
| python04 |        5 |
| python05 |        2 |
+----------+----------+
3 rows in set (0.00 sec)

--统计每个班级的人数，并去掉3位以下信息
MariaDB [mydemo]> select classid,count(*) as num from stu group by classid havin
g num>3;
+----------+-----+
| classid  | num |
+----------+-----+
| python03 |   4 |
| python04 |   5 |
+----------+-----+
2 rows in set (0.00 sec)

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
11 rows in set (0.01 sec)

--统计每个班级的男生和女生各多少人
MariaDB [mydemo]> select classid,sex,count(*) from stu group by classid,sex;
+----------+-----+----------+
| classid  | sex | count(*) |
+----------+-----+----------+
| python03 | w   |        1 |
| python03 | m   |        3 |
| python04 | w   |        4 |
| python04 | m   |        1 |
| python05 | m   |        2 |
+----------+-----+----------+
5 rows in set (0.00 sec)

MariaDB [mydemo]>


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

--年龄排序：默认asc升序
MariaDB [mydemo]> select * from stu order by age;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  4 | zhaoliu  |  19 | w   | python04 |
| 11 | bb       |  20 | m   | python04 |
|  9 | uu02     |  20 | m   | python05 |
|  3 | wangwu   |  20 | m   | python03 |
|  5 | qq01     |  20 | m   | python03 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  21 | w   | python04 |
|  6 | qq02     |  21 | w   | python04 |
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
| 10 | aa       |  29 | w   | python03 |
+----+----------+-----+-----+----------+
11 rows in set (0.00 sec)

--年龄desc降序
MariaDB [mydemo]> select * from stu order by age desc;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
| 10 | aa       |  29 | w   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  1 | zhangsan |  22 | m   | python03 |
|  8 | uu01     |  21 | w   | python04 |
|  6 | qq02     |  21 | w   | python04 |
|  5 | qq01     |  20 | m   | python03 |
|  7 | qq03     |  20 | m   | python05 |
|  9 | uu02     |  20 | m   | python05 |
|  3 | wangwu   |  20 | m   | python03 |
| 11 | bb       |  20 | m   | python04 |
|  4 | zhaoliu  |  19 | w   | python04 |
+----+----------+-----+-----+----------+
11 rows in set (0.00 sec)

MariaDB [mydemo]> select * from stu order by age asc;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  4 | zhaoliu  |  19 | w   | python04 |
| 11 | bb       |  20 | m   | python04 |
|  9 | uu02     |  20 | m   | python05 |
|  3 | wangwu   |  20 | m   | python03 |
|  5 | qq01     |  20 | m   | python03 |
|  7 | qq03     |  20 | m   | python05 |
|  8 | uu01     |  21 | w   | python04 |
|  6 | qq02     |  21 | w   | python04 |
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
| 10 | aa       |  29 | w   | python03 |
+----+----------+-----+-----+----------+
11 rows in set (0.00 sec)

--班级升序，同班级的按钮年龄降序排列
MariaDB [mydemo]> select * from stu order by classid asc,age desc;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
| 10 | aa       |  29 | w   | python03 |
|  1 | zhangsan |  22 | m   | python03 |
|  3 | wangwu   |  20 | m   | python03 |
|  5 | qq01     |  20 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  8 | uu01     |  21 | w   | python04 |
|  6 | qq02     |  21 | w   | python04 |
| 11 | bb       |  20 | m   | python04 |
|  4 | zhaoliu  |  19 | w   | python04 |
|  7 | qq03     |  20 | m   | python05 |
|  9 | uu02     |  20 | m   | python05 |
+----+----------+-----+-----+----------+
11 rows in set (0.00 sec)

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

--获取前5条
MariaDB [mydemo]> select * from stu limit 5;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
|  4 | zhaoliu  |  19 | w   | python04 |
|  5 | qq01     |  20 | m   | python03 |
+----+----------+-----+-----+----------+
5 rows in set (0.00 sec)

MariaDB [mydemo]> select * from stu limit 3;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
+----+----------+-----+-----+----------+
3 rows in set (0.00 sec)

MariaDB [mydemo]> select * from stu order by age desc limit 3;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
| 10 | aa       |  29 | w   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  1 | zhangsan |  22 | m   | python03 |
+----+----------+-----+-----+----------+
3 rows in set (0.00 sec)

--去掉2条取3条
MariaDB [mydemo]> select * from stu limit 2,3;
+----+---------+-----+-----+----------+
| id | name    | age | sex | classid  |
+----+---------+-----+-----+----------+
|  3 | wangwu  |  20 | m   | python03 |
|  4 | zhaoliu |  19 | w   | python04 |
|  5 | qq01    |  20 | m   | python03 |
+----+---------+-----+-----+----------+
3 rows in set (0.00 sec)

--3条数据一页，取第一页
MariaDB [mydemo]> select * from stu limit 0,3;
+----+----------+-----+-----+----------+
| id | name     | age | sex | classid  |
+----+----------+-----+-----+----------+
|  1 | zhangsan |  22 | m   | python03 |
|  2 | lisi     |  25 | w   | python04 |
|  3 | wangwu   |  20 | m   | python03 |
+----+----------+-----+-----+----------+
3 rows in set (0.00 sec)


--3条数据一页，取第二页
MariaDB [mydemo]> select * from stu limit 3,3;
+----+---------+-----+-----+----------+
| id | name    | age | sex | classid  |
+----+---------+-----+-----+----------+
|  4 | zhaoliu |  19 | w   | python04 |
|  5 | qq01    |  20 | m   | python03 |
|  6 | qq02    |  21 | w   | python04 |
+----+---------+-----+-----+----------+
3 rows in set (0.00 sec)


--3条数据一页，取第三页
MariaDB [mydemo]> select * from stu limit 6,3;
+----+------+-----+-----+----------+
| id | name | age | sex | classid  |
+----+------+-----+-----+----------+
|  7 | qq03 |  20 | m   | python05 |
|  8 | uu01 |  21 | w   | python04 |
|  9 | uu02 |  20 | m   | python05 |
+----+------+-----+-----+----------+
3 rows in set (0.00 sec)


--查询python03期的信息，按钮年龄升序，取两条。
MariaDB [mydemo]> select * from stu where classid="python03" order by age asc li
mit 2;
+----+--------+-----+-----+----------+
| id | name   | age | sex | classid  |
+----+--------+-----+-----+----------+
|  3 | wangwu |  20 | m   | python03 |
|  5 | qq01   |  20 | m   | python03 |
+----+--------+-----+-----+----------+
2 rows in set (0.00 sec)

MariaDB [mydemo]>

