#返回在 90号部门工作的所有员工的信息
SELECT *
FROM employees
#实现表中数据的过滤,声明在from后面
WHERE department_id = 90;

SELECT *
FROM employees
WHERE salary > 6000;

SELECT *
FROM employees
WHERE LAST_NAME = 'Fripp'; #字符串使用一对''引起来
#sql规范中：一对''内的字符串是区分大小写的。但是mysql在windows中默认是不区分的。

#2.比较运算符： = > >= < <= <>  !=
SELECT *
FROM employees
WHERE department_id != 90;

#3.其他比较运算符：
# 3.1 between ... and ... (包含边界值的)
#查询工资在6000 到 8000之间的员工信息
SELECT last_name,salary
FROM employees
#where salary between 6000 and 8000;
WHERE salary >= 6000 AND salary <= 8000;
#where salary between 8000 and 6000; #查询不到数据
#where salary >= 8000 AND salary <= 6000; #查询不到数据

# 3.2 in
SELECT last_name,department_id,salary
FROM employees
#where department_id = 60 or department_id = 70 or department_id = 80;
#where department_id in (60,70,80);
WHERE salary IN (6000,7000,8000);

# 3.3 like :模糊查询
# 查询姓名中带字符'a'人的信息
SELECT employee_id,last_name,salary
FROM employees
WHERE last_name LIKE '%a%';  # %:代表0个，1个或多个字符

# 查询姓名中最后一个字符是a的人的信息
SELECT employee_id,last_name,salary
FROM employees
WHERE last_name LIKE '%a';

# 查询姓名中包含字符a且包含字符e的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%';
#WHERE last_name LIKE '%a%' and last_name like '%e%';

#查询姓名中第3个字符是a的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE last_name LIKE '__a%'; # _:代表一个不确定的字符


# 查询姓名中第2个字符是_且第3个字符是a的员工信息：
SELECT employee_id,last_name,salary
FROM employees
#WHERE last_name LIKE '_\_a%';  # \:转义     "立超老师好\"帅\"啊"
WHERE last_name LIKE '_$_a%' ESCAPE '$';

#3.4 is null
SELECT last_name,salary,commission_pct
FROM employees
#where commission_pct is null;
WHERE commission_pct IS NOT NULL;


# 4. 逻辑运算符： and  or  not


# 5. 排序数据：order by
SELECT *
FROM employees  #SQLite
#order by salary asc; # asc:升序，ascend
ORDER BY salary DESC; #desc:降序，descend

SELECT *
FROM employees
ORDER BY last_name; #默认情况下，按照升序排列

#使用列的别名进行排序
SELECT employee_id emp_id,last_name,salary
FROM employees
ORDER BY emp_id ASC;

# 不能在过滤条件中使用列的别名！
SELECT employee_id emp_id,last_name,salary
FROM employees
WHERE emp_id > 200;

# 二级排序
SELECT employee_id,last_name,department_id
FROM employees
ORDER BY department_id ASC,last_name DESC;