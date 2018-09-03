#1.创建数据库
CREATE DATABASE temp;

#使用此数据库
USE temp;

#显示此数据库下的表
SHOW TABLES;

#数据库对象：
#表(table)、 视图(view)、序列(sequence)、索引(index)、
#函数(function)、存储过程(procedure)、触发器(trigger)

#2.如何创建表
#方式一："白手起家"
CREATE TABLE emp1(
emp_id INT,
emp_name VARCHAR(15),
salary DOUBLE(10,2),
hire_date DATE
);

SELECT *
FROM emp1;

DESC emp1;

#方式二：基于现有的表，创建新表
#可以在创建新表的同时，将原有表中的数据复制过来。
#原表中的约束信息，不能复制到新表中。（除了not null之外）
CREATE TABLE emp2
AS
SELECT employee_id,last_name,salary
FROM employees;

DESC emp2;
DESC employees;

SELECT *
FROM emp2;

#练习1：复制一张employees表，包括数据
CREATE TABLE employees_copy
AS
SELECT *
FROM employees;

SELECT *
FROM employees_copy;

#练习2：复制一张employees表，不包括数据
CREATE TABLE employees_blank
AS
SELECT *
FROM employees
WHERE 1=2;

SELECT *
FROM employees_blank;

#练习3：创建一个表，包含department_id,department_name,avg(salary),min(salary),max(salary)
#查询中的字段的别名，就会作为新表的列名出现。
CREATE TABLE dept_sal
AS
SELECT d.department_id,d.department_name,AVG(salary) avg_sal,MIN(salary) min_sal,MAX(salary) max_sal
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_id,department_name

SELECT *
FROM dept_sal;


#3.删除表：
DROP TABLE dept_sal;

#4.修改表：alter table
#4.1 增加一个列
DESC emp1;

ALTER TABLE emp1
ADD email VARCHAR(25);

#4.2 删除一个列

ALTER TABLE emp1
DROP COLUMN email;


#4.3 修改列名 (oracle: alter table emp1 rename column salary to monthly_salary)
ALTER TABLE emp1
CHANGE salary monthly_salary DOUBLE(10,2);

DESC emp1;

#4.4 修改列的类型、存储范围
ALTER TABLE emp1
MODIFY monthly_salary DOUBLE(20,2);
#开发中，列的数据类型通常不会修改。
ALTER TABLE emp1
MODIFY emp_name INT;


#5.重命名表：
ALTER TABLE emp1
RENAME TO myemp1;

#Table 'myemployees.emp1' doesn't exist
DESC emp1;

DESC myemp1;

#6.清空表：truncate table  (DDL操作)
SELECT *
FROM emp2;

TRUNCATE TABLE emp2;

DESC emp2;

#删除表数据：delete from ...  (DML操作)

#DDL:一旦执行，不可回滚！主要是因为，DDL操作一旦执行，就自动提交数据。
#DML:执行完以后，还可以回滚！

#演示1：delete from ...
SELECT *
FROM employees_copy;

#数据一旦提交，就不可回滚。
#设置数据不自动提交
SET autocommit = FALSE;

DELETE FROM employees_copy;

#DCL：可以回滚
ROLLBACK;

#演示2：truncate table ...
SET autocommit = FALSE;

TRUNCATE TABLE employees_copy;

#DCL：回滚数据：失败！
ROLLBACK;

#提交数据：数据一旦提交，就不可回滚。
#commit;
#回滚操作：数据回滚，只能回滚到最后一次commit之后。
#rollback;

#数据库事务。



