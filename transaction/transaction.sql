-- 转账操作(张三给李四转账1000元)
-- 开启事务
start transaction;
-- 1.查询张三的账户余额
select money
from account
where name = '张三';
-- 2.张三的账户余额减少1000元
update account
set money = money - 1000
where name = '张三';
-- 3.李四的账户余额增加1000元
update account
set money = money + 1000
where name = '李四';
-- 成功提交事务
commit;
-- 失败回滚事务
rollback;