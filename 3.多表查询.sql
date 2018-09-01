<<<<<<< HEAD
DESC employees;

SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM locations;

#查询所有员工的employee_id,last_name,department_name
#出现了笛卡尔集的错误：多表查询时，没有声明连接条件或连接条件失效
SELECT employee_id,last_name,department_name
FROM employees,departments; #2889条

SELECT *
FROM departments;#27

SELECT 107 * 27
FROM DUAL;
#查询所有员工的employee_id,last_name,department_name
#正确的写法：
SELECT employee_id,last_name,department_name
FROM employees,departments
#多表的连接条件
WHERE employees.`department_id` = departments.`department_id`;

#
SELECT last_name,department_name,city
FROM employees,departments,locations
#连接条件
WHERE employees.`department_id` = departments.`department_id`
AND departments.`location_id` = locations.`location_id`;

#总结：如果多表查询中，涉及到了n个表，则至少有n - 1个连接条件！

#问题一：查询的字段如果存在于多个表中，则必须指明此字段所属的表
# 如果查询的数据来自于多个表，则查询的字段前指明其所属的表，是一个sql优化。
SELECT employees.last_name,departments.department_id,departments.department_name
FROM employees,departments
WHERE employees.`department_id` = departments.`department_id`;


#问题二：表的别名.
#表的别名可以在select和where中使用
SELECT e.last_name,d.department_id,d.department_name
FROM employees e,departments d
WHERE e.`department_id` = d.`department_id`;

#多表查询的分类
#等值连接  vs 非等值连接
#自连接  vs 非自连接
#内连接  vs 外连接

#非等值连接
SELECT last_name,salary,grade
FROM employees e,job_grades j
#连接条件
#where e.`salary` between j.`LOWEST_SAL` and j.`HIGHEST_SAL`;
WHERE e.`salary` >= j.`LOWEST_SAL` AND e.`salary` <= j.`HIGHEST_SAL`;

#自连接
#查询员工的employee_id,last_name及其管理者的employee_id,last_name
SELECT emp.employee_id,emp.last_name,mgr.employee_id,mgr.last_name
FROM employees emp,employees mgr
WHERE emp.`manager_id` = mgr.`employee_id`;


#内连接：仅查询出满足左表和右表连接条件的数据。
#即：结果集中不包含一个表与另一个表不匹配的行

SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT e.last_name,d.department_id,d.department_name
FROM employees e,departments d
WHERE e.`department_id` = d.`department_id`;

#左外连接：两个表在连接过程中除了返回满足连接条件的行以外，还返回左表中不满足条件的行
#右外连接：两个表在连接过程中除了返回满足连接条件的行以外，还返回右表中不满足条件的行

#左外连接：只适用于oracle
#SELECT e.last_name,d.department_id,d.department_name
#FROM employees e,departments d
#WHERE e.`department_id` = d.`department_id`(+);

#sql 99语法：可以另一种方式实现多表连接
#sql 99语法实现的内连接
SELECT e.last_name,d.department_id,d.department_name
FROM employees e INNER JOIN departments d
ON e.`department_id` = d.`department_id`;


SELECT last_name,department_name,city
FROM employees e JOIN departments d
ON e.`department_id` = d.`department_id`
JOIN locations l
ON d.`location_id` = l.`location_id`;

##sql 99语法实现的外连接:左外连接
SELECT e.last_name,d.department_id,d.department_name
FROM employees e LEFT JOIN departments d
ON e.`department_id` = d.`department_id`;

##sql 99语法实现的外连接:右外连接
SELECT e.last_name,d.department_id,d.department_name
FROM employees e RIGHT JOIN departments d
ON e.`department_id` = d.`department_id`;

#满外连接：两个表在连接过程中除了返回满足连接条件的行以外，还返回左表和右表中不满足条件的行
#如下的写法是sql规范中规定的方式。oracle等都支持，但是mysql不支持！
SELECT e.last_name,d.department_id,d.department_name
FROM employees e FULL JOIN departments d
ON e.`department_id` = d.`department_id`;
=======
DESC employees;

SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM locations;

#查询所有员工的employee_id,last_name,department_name
#出现了笛卡尔集的错误：多表查询时，没有声明连接条件或连接条件失效
SELECT employee_id,last_name,department_name
FROM employees,departments; #2889条

SELECT *
FROM departments;#27

SELECT 107 * 27
FROM DUAL;
#查询所有员工的employee_id,last_name,department_name
#正确的写法：
SELECT employee_id,last_name,department_name
FROM employees,departments
#多表的连接条件
WHERE employees.`department_id` = departments.`department_id`;

#
SELECT last_name,department_name,city
FROM employees,departments,locations
#连接条件
WHERE employees.`department_id` = departments.`department_id`
AND departments.`location_id` = locations.`location_id`;

#总结：如果多表查询中，涉及到了n个表，则至少有n - 1个连接条件！

#问题一：查询的字段如果存在于多个表中，则必须指明此字段所属的表
# 如果查询的数据来自于多个表，则查询的字段前指明其所属的表，是一个sql优化。
SELECT employees.last_name,departments.department_id,departments.department_name
FROM employees,departments
WHERE employees.`department_id` = departments.`department_id`;


#问题二：表的别名.
#表的别名可以在select和where中使用
SELECT e.last_name,d.department_id,d.department_name
FROM employees e,departments d
WHERE e.`department_id` = d.`department_id`;

#多表查询的分类
#等值连接  vs 非等值连接
#自连接  vs 非自连接
#内连接  vs 外连接

#非等值连接
SELECT last_name,salary,grade
FROM employees e,job_grades j
#连接条件
#where e.`salary` between j.`LOWEST_SAL` and j.`HIGHEST_SAL`;
WHERE e.`salary` >= j.`LOWEST_SAL` AND e.`salary` <= j.`HIGHEST_SAL`;

#自连接
#查询员工的employee_id,last_name及其管理者的employee_id,last_name
SELECT emp.employee_id,emp.last_name,mgr.employee_id,mgr.last_name
FROM employees emp,employees mgr
WHERE emp.`manager_id` = mgr.`employee_id`;


#内连接：仅查询出满足左表和右表连接条件的数据。
#即：结果集中不包含一个表与另一个表不匹配的行

SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT e.last_name,d.department_id,d.department_name
FROM employees e,departments d
WHERE e.`department_id` = d.`department_id`;

#左外连接：两个表在连接过程中除了返回满足连接条件的行以外，还返回左表中不满足条件的行
#右外连接：两个表在连接过程中除了返回满足连接条件的行以外，还返回右表中不满足条件的行

#左外连接：只适用于oracle
#SELECT e.last_name,d.department_id,d.department_name
#FROM employees e,departments d
#WHERE e.`department_id` = d.`department_id`(+);

#sql 99语法：可以另一种方式实现多表连接
#sql 99语法实现的内连接
SELECT e.last_name,d.department_id,d.department_name
FROM employees e INNER JOIN departments d
ON e.`department_id` = d.`department_id`;


SELECT last_name,department_name,city
FROM employees e JOIN departments d
ON e.`department_id` = d.`department_id`
JOIN locations l
ON d.`location_id` = l.`location_id`;

##sql 99语法实现的外连接:左外连接
SELECT e.last_name,d.department_id,d.department_name
FROM employees e LEFT JOIN departments d
ON e.`department_id` = d.`department_id`;

##sql 99语法实现的外连接:右外连接
SELECT e.last_name,d.department_id,d.department_name
FROM employees e RIGHT JOIN departments d
ON e.`department_id` = d.`department_id`;

#满外连接：两个表在连接过程中除了返回满足连接条件的行以外，还返回左表和右表中不满足条件的行
#如下的写法是sql规范中规定的方式。oracle等都支持，但是mysql不支持！
SELECT e.last_name,d.department_id,d.department_name
FROM employees e FULL JOIN departments d
ON e.`department_id` = d.`department_id`;
>>>>>>> 804ba5e5d0b6e21943356a13da51f9fb4ff5afa2
