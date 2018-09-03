#1.约束：为了保证数据的一致性和完整性，SQL规范以约束的方式对表数据进行额外的条件限制。

#2.约束的分类：
#方式一：约束数据列的限制： 单列约束   vs   多列约束
#方式二：声明的位置的不同： 列级约束  vs 表级约束
#方式三：按照约束功能的不同：
# not null:非空 、 unique:唯一性约束、 primary key:主键约束、foreign key:外键约束、
# check:检查 、 default:默认值

# 3.上面提到的约束，是作用在表的列上的。
# 4.通常情况下，在create table 的时候，给表中的列添加上约束。
# 也可有在表创建以后，通过alter table的方式删除或新添加约束。

# 5.1 not null:非空约束
#非空约束只能使用列级约束。
CREATE TABLE emp1(
id INT NOT NULL, #列级约束
NAME VARCHAR(15) NOT NULL,
salary DOUBLE(10,2),
email VARCHAR(25)
);

DESC emp1;

INSERT INTO emp1(id,NAME,salary,email)
VALUES(1,'Tom',12330,'tom@126.com');


SELECT *
FROM emp1;
#添加失败
INSERT INTO emp1(id,NAME,salary,email)
VALUES(NULL,'Tom',12330,'tom@126.com');

#添加失败
INSERT INTO emp1(id,NAME,salary,email)
VALUES(2,NULL,12330,'tom@126.com');

#添加失败
INSERT INTO emp1(id,salary,email)
VALUES(3,12330,'tom@126.com');


#修改(添加、删除)现有表的非空约束
#删除
ALTER TABLE emp1
MODIFY id INT NULL;

DESC emp1;
#添加
ALTER TABLE emp1
MODIFY id INT NOT NULL;

INSERT INTO emp1(id,NAME,salary,email)
VALUES(NULL,'jerry',12330,'jerry@126.com');

SELECT *
FROM emp1;


#5.2 唯一性约束：unique
#
CREATE TABLE emp2(
id INT ,
NAME VARCHAR(15),
email VARCHAR(25),
hire_date DATE,
#表级约束
CONSTRAINT emp2_id_uk UNIQUE(id),
CONSTRAINT emp2_ema_uk UNIQUE(email)

);

DESC emp2;

INSERT INTO emp2(id,NAME,hire_date,email)
VALUES(1,'Tom','1999-09-08','tom@126.com');
#添加失败
INSERT INTO emp2(id,NAME,hire_date,email)
VALUES(1,'Tom1','1999-09-08','tom1@126.com');

#添加失败
INSERT INTO emp2(id,NAME,hire_date,email)
VALUES(2,'Tom1','1999-09-08','tom@126.com');


INSERT INTO emp2(id,NAME,hire_date,email)
VALUES(2,'Tom','1999-09-08',NULL);


SELECT *
FROM emp2;
#可以添加成功。可以向声明为unique约束的列上，多次赋值为null.
INSERT INTO emp2(id,NAME,hire_date,email)
VALUES(3,'Tom','1999-09-08',NULL);

#修改表时，添加或删除唯一性约束
DESC emp2;
#删除
#凡是声明为unique或primary key约束的列，会自动添加上索引。当我们使用此列进行过滤数据时，效率更高。
ALTER TABLE emp2
DROP INDEX emp2_id_uk;


#添加
ALTER TABLE emp2
ADD CONSTRAINT emp2_id_uk UNIQUE(id);


#5.3 主键约束：primary key
# 声明为主键约束的列，在赋值时，必须保证：非空且唯一。
# 一个表中只能只能一个主键约束。
# 通过主键约束对应的列，可以唯一的定位表中的一条记录。
CREATE TABLE emp3(
id INT ,
NAME VARCHAR(15),
email VARCHAR(25),
salary DOUBLE(10,2),
#表级约束
CONSTRAINT emp3_id_pk PRIMARY KEY(id)
);

DESC emp3;

INSERT INTO emp3(id,NAME,email,salary)
VALUES(1,'Tom','Tom@126.com',3400);
#添加失败
INSERT INTO emp3(id,NAME,email,salary)
VALUES(1,'Tom1','Tom1@126.com',3400);
#添加失败
INSERT INTO emp3(id,NAME,email,salary)
VALUES(NULL,'Tom1','Tom1@126.com',3400);

#删除主键约束
ALTER TABLE emp3
DROP PRIMARY KEY ;

#添加主键约束
ALTER TABLE emp3
ADD CONSTRAINT emp3_id_pk PRIMARY KEY(id);

#5.4 外键约束：foreign key
# 给表A中的字段a添加上外键约束，使其关联表B中的字段b.
#则，在给表A中的字段a赋值时，要求所附的值必须是表B中的字段b中出现过的值。

#要想给字段a声明外键约束成功，必须要求表b中的字段b声明有primary key或unique约束。

CREATE TABLE dept4(
dept_id INT,
dept_name VARCHAR(10)
);

CREATE TABLE emp4(
id INT,
NAME VARCHAR(15),
dept_id INT,
#表级约束
CONSTRAINT emp4_deptid_fk FOREIGN KEY(dept_id) REFERENCES dept4(dept_id) #ON DELETE CASCADE
);

#给dept4中的dept_id添加约束
ALTER TABLE dept4
ADD CONSTRAINT dept4_deptid_uk UNIQUE(dept_id);

DESC dept4;


INSERT INTO emp4(id,NAME,dept_id)
VALUES(1,'Tom',10);

INSERT INTO dept4(dept_id,dept_name)
VALUES(10,'IT');

SELECT *
FROM dept4;

SELECT *
FROM emp4;

DELETE FROM dept4
WHERE dept_id = 10;

#5.5 检查约束：check
# 对于mysql来讲失效。

CREATE TABLE emp5(
id INT,
NAME VARCHAR(15),
salary DOUBLE(10,2) CHECK(salary > 2120)
);

INSERT INTO emp5(id,NAME,salary)
VALUES(1,'tom',1500);

SELECT * FROM emp5;

# 5.6 default :默认值

CREATE TABLE emp6(
id INT,
NAME VARCHAR(15),
salary DOUBLE(10,2) DEFAULT 2000
);

INSERT INTO emp6(id,NAME)
VALUES(1,'tom')

SELECT *
FROM emp6;

INSERT INTO emp6(id,NAME,salary)
VALUES(2,'tom',3000)

##############################################
#6.分页
#查询公司工资最高的10人信息：top10
SELECT employee_id,last_name,salary
FROM employees
ORDER BY salary DESC
LIMIT 0,10;

#假设每页显示10条，查询第2页数据：
SELECT employee_id,last_name,salary
FROM employees
ORDER BY salary DESC
LIMIT 10,10;

#公式：pageNo:显示第pageNo页，pageSize:每页显示的条目数
#limit (pageNo - 1)*pageSize,pageSize

