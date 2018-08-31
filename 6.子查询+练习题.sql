
#查询格式总结
SELECT ...,....,.... (可能包含分组函数)
FROM ....,....,....
WHERE 多表的连接条件
AND 不包含组函数的过滤条件
GROUP BY ...,....
HAVING 包含组函数的过滤条件
ORDER BY ... ASC/DESC ,... 
LIMIT ...,...
或
SELECT ...,....,.... (可能包含分组函数)
FROM .... JOIN ....
ON 多表的连接条件1
JOIN ....
ON 多表的连接条件2
WHERE 不包含组函数的过滤条件 AND / OR
GROUP BY ...,....
HAVING 包含组函数的过滤条件
ORDER BY ... ASC/DESC ,... 
LIMIT ...,...

#谁的工资比 Abel 高?
#方式一：
SELECT salary
FROM employees
WHERE last_name = 'Abel';

SELECT last_name,salary
FROM employees
WHERE salary > 11000;

#方式二：自连接
SELECT e1.last_name,e1.salary
FROM employees e1,employees e2
WHERE e2.`last_name` = 'Abel'
AND e1.`salary` > e2.`salary`;

#方式三：子查询
SELECT last_name,salary
FROM employees
WHERE salary > (
		SELECT salary
		FROM employees
		WHERE last_name = 'Abel'
		);


#子查询的分类：单行子查询  vs  多行子查询

#题目：返回job_id与141号员工相同，salary比143号员工多的员工姓名，job_id 和工资

SELECT last_name,job_id,salary
FROM employees
WHERE job_id = (
		SELECT job_id
		FROM employees
		WHERE employee_id = 141
		)
AND salary > (
		SELECT salary
		FROM employees
		WHERE employee_id = 143
		)

#题目：返回公司工资最少的员工的last_name,job_id和salary

SELECT last_name,job_id,salary
FROM employees
WHERE salary = (
		SELECT MIN(salary)
		FROM employees
		);


#题目：查询最低工资大于50号部门最低工资的部门id和其最低工资

#子查询的解决：① 从外向里写  ② 从里向外写

SELECT department_id,MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
			SELECT MIN(salary)
			FROM employees
			WHERE department_id = 50
			);

# 内查询返回空的情况。
SELECT last_name, job_id
FROM   employees
WHERE  job_id =
                (SELECT job_id
                 FROM   employees
                 WHERE  last_name = 'Haas');

#多行子查询
#错误的：
#Subquery returns more than 1 row
SELECT employee_id, last_name
FROM   employees
WHERE  salary =
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id);

#多行子查询
SELECT employee_id, last_name
FROM   employees
WHERE  salary IN
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id);


#题目：返回其它部门中比job_id为‘IT_PROG’部门任一工资低的员工的员工号、姓名、job_id 以及salary

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < ANY(
		SELECT salary
		FROM employees
		WHERE job_id = 'IT_PROG'
		)

AND job_id <> 'IT_PROG';

#题目：返回其它部门中比job_id为‘IT_PROG’部门所有工资低的员工的员工号、姓名、job_id 以及salary


SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < ALL(
		SELECT salary
		FROM employees
		WHERE job_id = 'IT_PROG'
		)
AND job_id <> 'IT_PROG';



# 1.查询和Zlotkey相同部门的员工姓名和工资
SELECT last_name,salary
FROM employees
WHERE department_id = (
			SELECT department_id
			FROM employees
			WHERE last_name = 'Zlotkey'
			);


# 2.查询工资比公司平均工资高的员工的员工号，姓名和工资。
SELECT employee_id,last_name,salary
FROM employees
WHERE salary > (
		SELECT AVG(salary)
		FROM employees
		);


#3*.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资



#4.查询和姓名中包含字母u的员工在相同部门的员工的员工号和姓名
SELECT employee_id,last_name
FROM employees
WHERE department_id IN(
			SELECT DISTINCT department_id
			FROM employees
			WHERE last_name LIKE '%u%'
			);


# 5.查询在部门的location_id为1700的部门工作的员工的员工号
SELECT employee_id
FROM employees
WHERE department_id IN (
			SELECT department_id
			FROM departments
			WHERE location_id = 1700
			);


# 6.查询管理者是King的员工姓名和工资
SELECT last_name,salary
FROM employees
WHERE manager_id IN (
		    SELECT employee_id
		    FROM employees
		    WHERE last_name = 'King'
		     );


#7. 查询工资最低的员工信息: last_name, salary

SELECT last_name,salary
FROM employees
WHERE salary = (
		SELECT MIN(salary)
		FROM employees
		);

		
#8. 查询平均工资最低的部门信息
#方式一：
SELECT *
FROM departments
WHERE department_id = (
			SELECT department_id
			FROM employees
			GROUP BY department_id
			HAVING AVG(salary) <= ALL(
						SELECT AVG(salary)
						FROM employees
						GROUP BY department_id
						)
			);


#方式二：

SELECT *
FROM departments
WHERE department_id = (
			SELECT department_id
			FROM employees
			GROUP BY department_id
			HAVING AVG(salary) = (
						SELECT MIN(avg_sal)
						FROM (
							SELECT AVG(salary) avg_sal
							FROM employees
							GROUP BY department_id
						     ) dept_avg_sal
					     )
			);





		
#9*.查询平均工资最低的部门信息和该部门的平均工资



#10. 查询平均工资最高的 job 信息
SELECT *
FROM jobs
WHERE job_id = (
		SELECT job_id
		FROM employees
		GROUP BY job_id
		HAVING AVG(salary) >= ALL(SELECT AVG(salary)
					  FROM employees
					  GROUP BY job_id)
		);


	
#11. 查询平均工资高于公司平均工资的job有哪些?
SELECT job_id
FROM employees
WHERE department_id IS NOT NULL
GROUP BY job_id
HAVING AVG(salary) > (
			SELECT AVG(salary)
			FROM employees
			)



#12. 查询出公司中所有 manager 的详细信息.
SELECT *
FROM employees
WHERE employee_id IN (
			#查询公司的manager_id
			SELECT DISTINCT manager_id
			FROM employees
			);

	
#13. 各个部门中 最高工资中最低的那个部门的 最低工资是多少?
SELECT MIN(salary)
FROM employees
WHERE department_id = (
			SELECT department_id
			FROM employees
			GROUP BY department_id
			HAVING MAX(salary) <= ALL(SELECT MAX(salary)
						  FROM employees
						  GROUP BY department_id)
			);

SELECT *
FROM employees
WHERE department_id = 10;

#14. 查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email, salary
#
SELECT last_name, department_id, email, salary
FROM employees
WHERE employee_id IN (
			SELECT DISTINCT manager_id
			FROM employees
			WHERE department_id = (
						SELECT department_id
						FROM employees
						GROUP BY department_id
						HAVING AVG(salary) >= ALL(SELECT AVG(salary)
									  FROM employees
									  GROUP BY department_id)
						)
			);




#15. 查询员工的id,salary,按照department_name 排序




