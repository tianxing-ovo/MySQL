-- 不可重复读(nonrepeatable read): 一个事务先后读取同一条记录,但两次读取的数据不同
-- 事务1
-- 隔离级别: 读已提交(Read Committed)
-- money = 2000
begin;
select money
from account
where id = 1;
-- 事务2
update account
set money = money - 1000
where id = 1;
-- 事务1
-- money = 1000
select money
from account
where id = 1;
