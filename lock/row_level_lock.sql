-- 查看行级锁
select object_schema, object_name, index_name, lock_mode, lock_data
from performance_schema.data_locks
where lock_type = 'RECORD';

begin;
-- 使用唯一索引对不存在的记录进行等值匹配
-- 锁定范围: (3,8)
select *
from test
where id = 5 lock in share mode;
-- 使用普通索引进行等值匹配
-- 锁定范围: (1,3]和(3,8)
select *
from test
where age = 3 lock in share mode;
-- 使用唯一索引进行范围匹配
-- 锁定范围: [19,25]和(25,正无穷]
select *
from test
where id >= 19 lock in share mode;
commit;
