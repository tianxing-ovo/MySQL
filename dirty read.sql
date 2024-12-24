-- 脏读(dirty read): 一个事务读取到另一个事务未提交的数据
-- 事务1
begin;
update account
set money = money - 1000
where id = 1;
-- 事务2
-- 隔离级别: 读未提交(Read Uncommitted)
-- money = 1000
select money
from account
where id = 1;
-- 事务1
rollback;