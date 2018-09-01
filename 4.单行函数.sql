#在数据中常用的数据类型：字符串，数值型，日期型
#1.字符串类型
#转换小写，大写
SELECT LOWER('helloWorlD'),UPPER('hellloWorlD')
FROM DUAL;

SELECT *
FROM employees
WHERE LOWER(last_name) = 'king';

#concat
# xxx worked for yyy

SELECT CONCAT(emp.last_name,' worked for ',mgr.last_name) "details"
FROM employees emp JOIN 
employees mgr
ON emp.`manager_id` = mgr.`employee_id`;

#substr 从1到5
SELECT SUBSTR('helloworld',1,5)
FROM DUAL;

#instr 字符串中某个字符的个数
SELECT INSTR('helloworld','l'),INSTR('helloworld','m')
FROM DUAL;

SELECT last_name,LPAD(salary,10,' ')
FROM employees;

#trim 截掉两边的xxx
SELECT TRIM('h' FROM 'hhhellohhhworldhhh'),TRIM(' ' FROM '  he  llo  ')
FROM DUAL;

#replace 将l替换为m
SELECT REPLACE('helloworld','l','m')
FROM DUAL;

#2. 数值相关的
#round:四舍五入
SELECT ROUND(123.556),ROUND(123.456,0),ROUND(123.456,2),ROUND(123.456,-2)
FROM DUAL;
#truncate：截断
SELECT TRUNCATE(123.556,0),TRUNCATE(123.556,1),TRUNCATE(153.556,-2)
FROM DUAL;
#mod:取余
#结果的符号：与被模数相同
SELECT MOD(12,5),MOD(-12,5),MOD(12,-5),MOD(-12,-5)
FROM DUAL;

#3.日期函数
SELECT NOW()
FROM DUAL;

#通用函数
#凡是字段的值是null的，参数运算的话，结果也为null
#null:不等同于0，'',' '
SELECT last_name,salary,salary * ( 1 + commission_pct),
salary * ( 1 + IFNULL(commission_pct,0))
FROM employees;

#条件表达式
#查询所有部门的员工信息, 
#若部门号为 10, 则打印其工资的 1.1 倍, 
#20 号部门, 则打印其工资的 1.2 倍, 
#30 号部门打印其工资的 1.3 倍数,
#其他部门，打印其工资的 1.4 倍数

SELECT last_name,salary,department_id,CASE department_id WHEN 10 THEN salary * 1.1
							 WHEN 20 THEN salary * 1.2
							 WHEN 30 THEN salary * 1.3
							 ELSE salary * 1.4 END "new salary"
FROM employees;


#查询部门号为 10, 20, 30 的员工信息, 
#若部门号为 10, 则打印其工资的 1.1 倍, 
#20 号部门, 则打印其工资的 1.2 倍, 
#30 号部门打印其工资的 1.3 倍数

SELECT last_name,salary,department_id,CASE department_id WHEN 10 THEN salary * 1.1
							 WHEN 20 THEN salary * 1.2
							 WHEN 30 THEN salary * 1.3
							 END "new salary"
FROM employees
WHERE department_id IN (10,20,30);