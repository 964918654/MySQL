#1.增加、添加:INSERT
CREATE TABLE  emp3(
id INT,
NAME VARCHAR(15),
email VARCHAR(25),
hire_date DATE
);

SELECT * FROM emp3;

DESC emp3;

#方式一：一条一条的添加
#要求按照emp3创建时，列的顺序进行赋值
INSERT INTO emp3
VALUES(1001,'Tom','Tom@126.com','2018-09-08');
#通用的写法
INSERT INTO emp3(id,NAME,hire_date,email)
VALUES(1002,'Jerry','2018-06-05','jerry@126.com');

#未声明并赋值的字段，默认值为null.
INSERT INTO emp3(id,NAME)
VALUES(1003,'Jerry1');


#有时候，insert也会失败：
#1.给列赋的值要在列声明的存储范围内
#2.未赋值的列，默认值为null.要想insert执行成功，得保证为赋值的列能赋值为null。关注非空约束。


#方式二：基于现有的表，导入数据

INSERT INTO emp3(id,NAME,email)
SELECT employee_id,last_name,email  #注意：查询的字段顺序一定需要与insert后表的字段一一对应
FROM employees
WHERE salary > 7000;

SELECT *
FROM emp3;

DESC emp3;
DESC employees;

#注意：emp3中的字段的范围尽量不要小于employees表中字段的范围。否则，可能会添加失败！

# 2.修改数据：update .... set .... where ...

SELECT * FROM emp3;

UPDATE emp3
SET email = 'jerry1@gmail.com',hire_date = '2001-09-08'
WHERE id = 1003;

#修改失败的情况：
#1.给修改的字段赋的值数据类型或长度不满足
#2.由于约束的影响，导致修改失败
#修改失败。由于外键约束的影响
UPDATE employees
SET department_id = 1000
WHERE employee_id = 206;

SELECT *
FROM departments;

#3. 删除操作：delete from .... where ...

DELETE FROM emp3
WHERE id >1000;


SELECT * FROM emp3;

#set autocommit = false;
#增、删、改操作

#rollback; 都可以执行数据的回滚。

SET autocommit = FALSE;

COMMIT;

UPDATE emp3
SET NAME = 'Tom';

SELECT * FROM emp3;

ROLLBACK;

#删除失败的情况：
#由于外键的影响
DELETE FROM departments
WHERE department_id = 80;

