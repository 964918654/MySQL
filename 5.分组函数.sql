<<<<<<< HEAD
#组函数：avg() / sum() / max() / min() / count()
#1. avg() / sum():只适用于数值类型的变量
SELECT AVG(salary),SUM(salary)#,avg(last_name),sum(last_name)
FROM employees;

#2. max() / min(): 适用于数值型、字符型、日期型的变量
SELECT MAX(salary),MIN(salary),MAX(last_name),MIN(last_name)
FROM employees;


#3. count():
SELECT COUNT(employee_id),COUNT(salary),COUNT(last_name),COUNT(1),COUNT(2),COUNT(*),COUNT(NULL)
FROM employees;
#查询表中的数据的条数
SELECT COUNT(*)
FROM employees;

#count():计算所对应的列中非空数值的个数
SELECT COUNT(employee_id),COUNT(commission_pct)
FROM employees;

SELECT *
FROM employees;

#avg() = sum() / count()
SELECT AVG(commission_pct),SUM(commission_pct) / 107,SUM(commission_pct) / COUNT(commission_pct),
SUM(commission_pct) / COUNT(IFNULL(commission_pct,0))
FROM employees;

#求出EMPLOYEES表中各部门的平均工资
SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id;


SELECT job_id,AVG(salary)
FROM employees
GROUP BY job_id;

#错误的：
SELECT department_id,AVG(salary)
FROM employees;

#小技巧：在select中出现了组函数和非组函数的列，则一定要将非组函数的列声明在group by中。

#查询各个部门不同job_id的员工的平均工资
SELECT department_id,job_id,AVG(salary)
FROM employees
GROUP BY department_id,job_id;

SELECT job_id,department_id,AVG(salary)
FROM employees
GROUP BY job_id,department_id;

#部门最高工资比 10000 高的部门

SELECT department_id,MAX(salary)
FROM employees
#where max(salary) > 10000 #如果过滤条件中出现了组函数，则需要使用having替代where
GROUP BY department_id
HAVING MAX(salary) > 10000; #① having也是声明过滤条件的 ② having声明在group by之后。

#部门10,20,30,40这几个部门中，最高工资比 10000 高的部门
SELECT department_id,MAX(salary)
FROM employees
WHERE department_id IN (10,20,30,40)
GROUP BY department_id
HAVING MAX(salary) > 10000; 

#结论：where中只能声明不包含组函数的过滤条件
# having 声明中即可以包含组函数，也可以不包含组函数。但是建议将不包含组函数的条件声明在where中。——sql优化
=======
#组函数：avg() / sum() / max() / min() / count()
#1. avg() / sum():只适用于数值类型的变量
SELECT AVG(salary),SUM(salary)#,avg(last_name),sum(last_name)
FROM employees;

#2. max() / min(): 适用于数值型、字符型、日期型的变量
SELECT MAX(salary),MIN(salary),MAX(last_name),MIN(last_name)
FROM employees;


#3. count():
SELECT COUNT(employee_id),COUNT(salary),COUNT(last_name),COUNT(1),COUNT(2),COUNT(*),COUNT(NULL)
FROM employees;
#查询表中的数据的条数
SELECT COUNT(*)
FROM employees;

#count():计算所对应的列中非空数值的个数
SELECT COUNT(employee_id),COUNT(commission_pct)
FROM employees;

SELECT *
FROM employees;

#avg() = sum() / count()
SELECT AVG(commission_pct),SUM(commission_pct) / 107,SUM(commission_pct) / COUNT(commission_pct),
SUM(commission_pct) / COUNT(IFNULL(commission_pct,0))
FROM employees;

#求出EMPLOYEES表中各部门的平均工资
SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id;


SELECT job_id,AVG(salary)
FROM employees
GROUP BY job_id;

#错误的：
SELECT department_id,AVG(salary)
FROM employees;

#小技巧：在select中出现了组函数和非组函数的列，则一定要将非组函数的列声明在group by中。

#查询各个部门不同job_id的员工的平均工资
SELECT department_id,job_id,AVG(salary)
FROM employees
GROUP BY department_id,job_id;

SELECT job_id,department_id,AVG(salary)
FROM employees
GROUP BY job_id,department_id;

#部门最高工资比 10000 高的部门

SELECT department_id,MAX(salary)
FROM employees
#where max(salary) > 10000 #如果过滤条件中出现了组函数，则需要使用having替代where
GROUP BY department_id
HAVING MAX(salary) > 10000; #① having也是声明过滤条件的 ② having声明在group by之后。

#部门10,20,30,40这几个部门中，最高工资比 10000 高的部门
SELECT department_id,MAX(salary)
FROM employees
WHERE department_id IN (10,20,30,40)
GROUP BY department_id
HAVING MAX(salary) > 10000; 

#结论：where中只能声明不包含组函数的过滤条件
# having 声明中即可以包含组函数，也可以不包含组函数。但是建议将不包含组函数的条件声明在where中。——sql优化
>>>>>>> 7b42c16551e8223b7453bce74ca75c660a2cadad
