# 14-mysql数据库管理

CREATE DATABASE myemp;

USE myemp;

CREATE TABLE emp1(
id INT,
NAME VARCHAR(15)

);

INSERT INTO emp1(id,NAME)
VALUES(1,'Tom');


SELECT *
FROM emp1;


INSERT INTO emp1(id,NAME)
VALUES(1,'张三');


#查看当前数据库的字符集
SHOW VARIABLES LIKE 'character%';
#显示数据库的字符集
SHOW CREATE DATABASE myemp;
#显示表的字符集
SHOW CREATE TABLE emp1;

#修改服务器端的字符集 - 修改数据的字符集  - 修改表的字符集
#修改数据库的字符集
ALTER DATABASE myemp CHARACTER SET 'utf8';

#修改表的字符集
ALTER TABLE emp1 CONVERT TO CHARACTER SET 'utf8';

INSERT INTO emp1(id,NAME)
VALUES(1,'张三');


# mysql大小写的问题
SHOW VARIABLES  LIKE '%lower_case_table_names%' ;


