--1）在users表中查询注册时间最早的十条会员信息。
select * from users limit 10;


--2）从两个表中查询点赞数最高的5条博客信息，要求显示字段：（博文id，标题，点赞数，会员名）
select blog.id, blog.title, blog.pcount, users.name from blog inner join users on blog.uid=users.id order by pcount desc limit 5;

--3）统计每个会员的发表博文数量（降序），要求显示字段（会员id号，姓名，博文数量）
select users.id, users.name, COUNT(blog.id) as 'blogcount' from blog inner join users on blog.uid=users.id group by blog.uid order by blogcount desc;

--4）获取会员的博文平均点赞数量最高的三位。显示字段（会员id，姓名，平均点赞数）
select users.id, users.name, AVG(blog.pcount) as 'AvgOfPcount' from blog inner join users on blog.uid=users.id group by blog.uid order by AvgOfPcount desc limit 3;

--5）删除没有发表博文的所有会员信息。
delete from users where id not in(select uid from blog);
