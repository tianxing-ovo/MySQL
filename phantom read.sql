-- 幻读(phantom read): 一个事务查询时没有对应的数据行,插入数据时又发现这行数据已经存在
-- 事务1
-- 隔离级别: 可重复读(Repeatable Read)
-- (1, '张三', 2000) (2, '李四', 2000)
begin;
select *
from account
where id > 0;
-- 事务2
insert into account(id, name, money)
values (3, '王五', 2000);
-- 事务1
-- (1, '张三', 2000) (2, '李四', 2000)
select *
from account
where id > 0;
-- 插入失败
insert into account(id, name, money)
values (3, '王五', 2000);
