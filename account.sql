-- 删除账户表
drop table if exists account;

-- 创建账户表
create table account
(
    id    int auto_increment primary key comment '主键',
    name  varchar(10) comment '姓名',
    money int comment '余额'
) comment '账户表';

-- 插入数据
insert into account(name, money)
values ('张三', 2000),
       ('李四', 2000);

-- 恢复数据
update account
set money =2000
where name in ('张三', '李四');
