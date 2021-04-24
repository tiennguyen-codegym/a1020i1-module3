drop database if exists student_management;

create database student_management;

use student_management;

create table type_of_class (
	id int primary key,
    `name` varchar(10)
);

create table account_james (
	`account` varchar(50),
    `password` varchar(50),
    primary key (`account`)
);

create table instructor (
	id int primary key auto_increment,
    `name` varchar(50),
    date_of_birth date
);

create table class (
	id int auto_increment,
    `name` char(7),
    type_of_class_id int,
    
    constraint pk_class primary key (id),
    constraint fk_class_type_of_class
		foreign key (type_of_class_id)
			references type_of_class (id)
);

create table student (
	id int primary key auto_increment,
    `name` varchar(50),
    date_of_birth date,
    email varchar(50),
    account_james_account varchar(50),
    class_id int,
    
    foreign key (account_james_account) references account_james (`account`),
    foreign key (class_id) references class (id)
);

create table instructor_teach_class (
	instructor_id int,
    class_id int,
    
    primary key (instructor_id, class_id),
    foreign key (instructor_id) references instructor (id),
    foreign key (class_id) references class (id)
);

insert into type_of_class
values
(1, 'Full time'),
(2, 'Half time');

insert into class (`name`, type_of_class_id)
values
('C1220G1', 1),
('C0920G1', 1),
('A1020I1', 2),
('A0421I1', 2);

insert into account_james
values
('tien.nguyen', '12345678'),
('kha.ho', '12345678'),
('trang.ho', '12345678'),
('mai.doan', '12345678'),
('long.duong', '12345678');

insert into student (`name`, date_of_birth, account_james_account, email, class_id)
values
('Tiến', '2000-07-14', 'tien.nguyen', 'tien@gmail.com', 1),
('Kha', '2002-05-03', 'kha.ho', 'kha@gmail.com',  1),
('Trang', '2001-04-03', 'trang.ho', 'trang@gmail.com', 2),
('Mai', '2001-08-04', 'mai.doan', 'mai@gmail.com', 3),
('Long', '2002-01-25', 'long.duong', 'long@gmail.com', null);

insert into instructor
values
(1, 'Tiến', '2000-07-14'),
(2, 'Trung', '2002-05-03'),
(3, 'Hải', '2003-11-03'),
(4, 'Chánh', '1998-07-09');

insert into instructor_teach_class
values
(1, 1),
(1, 2),
(2, 1);