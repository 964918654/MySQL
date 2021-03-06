CREATE DATABASE temp

USE temp
DROP TABLE emp;
SELECT * FROM emp
CREATE TABLE emp(
employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
emp_name VARCHAR(15),
salary DOUBLE(10,2),
birthday DATE
);
SET autocommit = FALSE;

INSERT INTO emp (emp_name,salary,birthday)
VALUE('马云',2025.33,"1973-8-12"),('李彦宏',3209.49,"1986-7-14"),('马化腾',1436.12,"1964-8-10");

ALTER TABLE emp
ADD telephone VARCHAR(25);

ALTER TABLE emp
ADD depart_id_fk INT;

INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Zenobia',1847.74,'1994-10-08','18811769371',1);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Yvette',2578.90,'1992-06-11','18811769325',2);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Xaviera',4438.63,'1986-09-21',NULL,3);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Winni',2545.94,'1975-09-29','18811769305',4);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Winifred',2509.29,'1983-10-12',NULL,5);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Vivien',5592.78,'1980-07-19','18811769315',6);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Violet',1000,'1978-12-01','18811769201',7);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Veromca',2245.30,'1972-05-24',NULL,8);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Vanessa',9998.74,'1983-05-23',NULL,9);a
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Ursula',6857.09,'1980-12-31','18811769132',10);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Theresa',8542.15,'1971-08-09','18811769135',11);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Tammy',3000,'1973-05-02','18811768752',12);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Stacey',5000,'1985-01-18','18811768753',13);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Setlla',8421.29,'1994-06-17',NULL,14);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Shirley',9958.03,'1984-06-20','18811768715',15);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Sebastiane',4246.59,'1992-05-21','18811768723',16);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Ruby',3000,'1976-04-20','18811768725',17);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Roberta',6172.17,'1976-06-07','18811768675',18);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Renata',8814.89,'1986-05-04','18811768650',19);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Rachel',6990.94,'1991-02-27','18811768673',20);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Quintina',9098.04,'1985-07-22','18811768632',21);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Poppy',1000,'1974-07-20','18811768635',22);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Phyllis',4293.83,'1975-04-23','18811768631',23);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Phoenix',9562,'1986-08-29','18811768613',24);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Phoebe',7860.54,'1994-11-07','18811768621',25);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Philipppa',9572.94,'1984-10-28','18811768593',1);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Penny',4594,'1982-11-26','18811768602',2);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Penelope',2361.62,'1984-12-20','18811768395',3);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Pearl',5000,'1991-04-11','18811768397',4);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Paula',8728.85,'1993-11-18','18811768530',5);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Patricia',4137.15,'1993-08-11','18811768570',6);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Pandora',4147.66,'1981-10-25','18811768571',7);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Pamela',2338.69,'1970-04-23','18811768590',8);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Ophelia',5049.5,'1984-04-24','18811768591',9);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Olivia',4103.37,'1994-03-05','18811768392',10);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Olive',8781.14,'1975-11-20','18701368566',11);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Olga',2118.31,'1974-11-06','18701368699',12);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Nydia',3000,'1979-12-23','18701371299',13);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Novia',5996.61,'1980-12-23','18701373066',1);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Norma',6582.16,'1990-01-15','18701376399',2);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Nelly',1400.57,'1978-10-05','18701575123',3);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Natividad',3168.08,'1972-02-09','18701638388',4);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Nancy',2333.92,'1973-11-12','18710051588',5);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Myrna',5000,'1972-05-02','18810659199',6);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Myra',8507.84,'1990-04-16','13501187739',7);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Monica',3711.35,'1981-01-07','13501200179',8);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Mona',7531.16,'1986-04-26','13501263679',9);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Molly',6376.71,'1971-07-09','13501265069',10);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Mignon',1252.32,'1993-02-21','13501272559',11);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Megan',7202.9,'1986-02-24','13501278633',12);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Marguerite',6313.3,'1981-01-05','13552235345',13);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Lynn',9777.82,'1974-01-15','13552290788',14);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Lydia',8568.8,'1988-04-04','13552618388',15);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Louise',3547.9,'1987-03-09','13552623288',16);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Linda',7963.88,'1974-01-04','13552625111',17);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Kristin',6140.55,'1976-04-03','13552795788',18);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Kelly',6517.5,'1976-08-31','13552977388',19);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Katherine',2587.49,'1982-11-27','13601172019',20);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Juliet',4776.88,'1984-05-08','13651300588',21);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Judith',3976.65,'1985-12-06','13651300788',22);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Josephine',7318.35,'1974-10-25','13671365788',23);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Jessica',4740.74,'1974-03-24','13681279088',24);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Janice',2185.81,'1971-07-12','13683551077',25);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Jacqueline',8268.45,'1975-07-15','13683553211',20);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Irma',2470.36,'1992-04-22','13683553799',21);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Ida',8519.9,'1989-06-07','13683555722',22);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Hilary',6218.39,'1978-06-10','13683561077',23);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Hermosa',1592.84,'1976-12-07','13683563277',24);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Heloise',7464.97,'1991-07-11','13683565177',25);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Helen',6004.4,'1972-02-10','13683575977',7);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Harriet',1161.67,'1971-07-31','13683578699',8);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Gwendolyn',6138.14,'1974-04-23','13683579077',9);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Gustave',6119.81,'1982-02-13','13683580766',10);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Griselda',8268.45,'1994-02-17','13683581977',11);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Gloria',2470.36,'1992-11-23','13683582766',12);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Geraldine',8519.9,'1994-07-02','13683591877',13);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Frederica',6218.39,'1970-07-18','13683592677',14);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Freda',1592.84,'1985-06-12','13683598177',15);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Frances',7464.97,'1977-10-12','13683598766',16);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Florence',6004.4,'1988-08-29','13683601577',17);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Flora',1161.67,'1977-09-24','13683603177',18);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Evelyn',6138.14,'1983-08-23','13683608177',19);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Evangeline',6119.81,'1978-10-28','13683613599',20);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Eunice',6704.9,'1980-02-27','13683613877',21);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Eudora',6621.36,'1992-12-14','13683617566',22);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Erin',3000,'1974-01-11','13683619566',23);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Emma',7139.4,'1972-12-03','13683621266',24);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Emily',6156.79,'1971-03-10','13691056588',25);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Elizabeth',8520.18,'1981-03-20','13701056332',15);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Edwina',7512.87,'1972-01-22','13701112057',16);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Dorothy',4151.84,'1973-09-22','13701117057',17);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Doreen',8053.19,'1992-01-15','13701117163',18);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Dolores',3004.19,'1984-03-11','13701117613',19);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Delia',3367.42,'1987-03-22','13701118317',20);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Cynthia',3175.62,'1987-10-31','13701133371',21);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Cornelia',7760.89,'1985-01-19','13701277781',22);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Constance',5712.07,'1985-02-05','13701322150',23);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Clementine',3000,'1988-09-13','13716791688',24);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Clara',8238.39,'1975-12-22','13717827188',25);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Claire',5000,'1985-07-05','13717935188',4);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Christine',1411.58,'1988-12-13','13717951688',5);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Chloe',9354.48,'1981-08-05','13718370588',6);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Charlotte',6699.46,'1981-12-29','13718449123',7);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Caroline',891.62,'1974-01-28','13718928388',8);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Brook',618.19,'1980-12-22','13720010388',9);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Bridget',3672.85,'1985-07-01','13801066471',10);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Bblythe',1000,'1975-12-01','13801337803',11);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Bella ',4870.36,'1984-04-05','13901252053',12);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Audrey',3000,'1994-08-20','15001010233',13);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Athena',5000,'1980-09-02','15001010766',14);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Atalanta',3175.62,'1983-06-07','15001011233',15);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Astrid',7760.89,'1994-03-20','15001011800',16);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Antonia',5712.07,'1982-03-22','15001012122',17);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Annabelle',344.6,'1976-02-13','15001012199',18);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Angela',8238.39,'1981-12-17','15001035266',19);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Amelia',1000,'1982-06-09','15001035366',20);
INSERT INTO emp (emp_name,salary,birthday,telephone,depart_id_fk) VALUES ('Adelaide',3672.85,'1974-05-22','15001036266',21);

DELETE FROM emp
WHERE employee_id = 5;

UPDATE emp
SET telephone = 13586705312,salary = salary+200
WHERE employee_id =17