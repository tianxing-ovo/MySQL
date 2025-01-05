-- 索引: index(name, age, status)
-- 索引长度: name=43 age=5 status=5

-- type: index
-- 覆盖索引: 索引中已经包含所有需要查询的字段
explain
select id, name, age, status
from test;

-- type: ALL
-- 索引失效: 跳过了name字段
explain
select *
from test
where age = 18
  and status = '1';

-- type: ref
-- status字段索引失效: 跳过了age字段
explain
select *
from test
where name = '张三'
  and status = '1';

-- type: ref
-- 编写顺序不影响索引匹配
explain
select *
from test
where age = 18
  and status = '1'
  and name = '张三';

-- type: range
-- 编写顺序不影响索引匹配
explain
select *
from test
where age in (18, 19)
  and status in ('1', '0')
  and name in ('张三');

-- type: range
-- status字段索引失效: age范围查询
explain
select *
from test
where name = '张三'
  and age > 18
  and status = '1';

-- type: index_merge
-- or的两边的字段都必须有索引
explain
select *
from test
where id = 1
   or name = '张三';


