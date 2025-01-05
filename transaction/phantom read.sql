-- 幻读(phantom read): 前后读取的记录数量不一致
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
-- 快照读(Snapshot Read): (1, '张三', 2000) (2, '李四', 2000)
select *
from account
where id > 0;
-- 当前读(Current Read): (1, '张三', 2000) (2, '李四', 2000) (3, '王五', 2000)
select *
from account
where id > 0 lock in share mode;
-- 插入失败
insert into account(id, name, money)
values (3, '王五', 2000);
