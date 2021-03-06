create database saiganesh;
use saiganesh;
show tables;
create table person(driver_id int,name varchar(20),address varchar(100),primary key(driver_id));
desc person;
insert into person values(1,'ABC','XYZ');
select * from person;
commit;
create table car(reg_no varchar(15),model varchar(25),year int);
desc car;
alter table person;
alter table person modify driver_id varchar(20);
alter table car add primary key(reg_no);
create table accident(report_num int,acc_date date,loc varchar(60),primary key(report_num));
create table owns(d_id varchar(20),r_num varchar(15),foreign key(d_id) references person(driver_id) on delete cascade,foreign key(r_num) references car(reg_no) on delete cascade,primary key(d_id,r_num));
desc owns;
create table participated(d_id varchar(20),r_no varchar(15),report_num int,damage_amt int,foreign key(d_id) references person(driver_id) on delete cascade,foreign key(r_no) references car(reg_no) on delete cascade,foreign key(report_num) references accident(report_num) on delete cascade,primary key(d_id,r_no,report_num));
insert into person values(2,'CD','Bglr');
insert into person values(3,'GH','London');
insert into person values(4,'PQ','Hassan');
insert into person values(5,'YX','mumbai');
select * from person;
commit;
insert into car values('1a','swift',2000);
insert into car values('1b','hyundai',2009);
insert into car values('1c','dzire',2005);
insert into car values('1d','duster',2007);
select * from car;
commit;
select * from owns;
insert into owns values('1','1a');
select * from owns;
commit;
insert into owns values('2','1b');
insert into owns values('3','1c');
insert into owns values('4','1d');
select * from owns;
commit;
insert into accident values(1001,10/2/2005,'XYZ');
insert into accident values(1002,11/2/2005,'ABC');
insert into accident values(1003,19/3/2005,'DEF');
insert into accident values(1004,20/2/2005,'XY');
select * from accident;
update accident set acc_date='2002-08-15' where report_num=1004;
commit;
insert into participated values('3','1c',1003,6000);
select * from participated;
commit;