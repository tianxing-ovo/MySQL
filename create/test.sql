-- 删除测试表
drop table if exists test;

-- 创建测试表
create table test
(
    id         int primary key comment '主键',
    name       varchar(10) comment '姓名',
    age        int comment '年龄',
    status     char(1) comment '状态',
    profession varchar(10) comment '专业',
    index idx_test_name_age_status (name, age, status),
    index idx_test_age (age)
) comment '测试表';

-- 插入数据
insert into test(id, name, age, status, profession)
values (1, '张三', 1, '1', '计算机科学与技术'),
       (3, '李四', 3, '1', '软件工程'),
       (8, '王五', 8, '0', '机械工程'),
       (11, '赵六', 11, '1', '计算机科学与技术'),
       (19, '孙七', 19, '0', '电气工程'),
       (25, '周八', 25, '1', '自动化');