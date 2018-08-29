#1.
SELECT employee_id,last_name,email,salary 
FROM employees;

SELECT department_id
#from department;#Table 'myemployees.department' doesn't exist
FROM departments;

SELECT * #代表表中的所有字段
FROM EMPLOYEES;

#sql的使用说明
#SQL 语言大小写不敏感。 
#SQL 可以写在一行或者多行
#关键字不能被缩写也不能分行
#各子句一般要分行写。
#使用缩进提高语句的可读性。

#2.列的别名
# as:alias
# 别名可以使用一对""
SELECT employee_id emp_id,last_name AS lname,salary "monthly sal",email AS "邮箱"
FROM employees;

#补充：如果使用字符串或日期型变量的话，应该使用一对''

#3.显示表结构
DESC employees;

DESCRIBE employees;

DESC departments;
