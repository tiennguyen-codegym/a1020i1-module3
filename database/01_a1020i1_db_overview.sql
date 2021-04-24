drop database if exists student_management;

create database student_management;

use student_management;

create table student (
	id int primary key auto_increment,
    `name` varchar(50),
    date_of_birth date
);

insert into student
values (1, 'Tiến', '2021-03-31');

insert into student (`name`, date_of_birth)
values
('Toàn', '2021-04-27'),
('Nguyên', '2021-07-27'),
('Thành', '2021-10-12');

select `name`
from student
where id = 3;

delete from student
where id = 3;

drop table student;

drop database student_management;

update student
set `name` = 'Toán'
where `name` = 'Toàn';

alter table student
add column email varchar(30);