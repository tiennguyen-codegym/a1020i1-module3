select concat('a', 'b', 'c', 'd', 'e');

select datediff('2021-04-11', '2021-04-09');

select abs(datediff('2021-04-09', '2021-04-11'));

select datediff('2021-05-01', '2021-04-30');

-- 1. index

select *
from student
where `name` = 'Kha';

create index idx_student_name
on student (`name`);

-- 2. view
create view view_student_and_instructor
as
select `name`, id, date_of_birth, 0 'type_person'
from student
union all
select id, `name`, date_of_birth, 1 'type_person'
from instructor;

select id, `name`
from view_student_and_instructor
where id = 1;

create view view_student
as
select id, `name`, date_of_birth
from student;

select *
from view_student;


-- 3. SP

-- tham tri
delimiter //
create procedure sp_find_by_name (in p_keyword varchar(10))
begin
	select *
    from student
    where `name` like concat('%', p_keyword, '%');
end;
// delimiter ;

call sp_find_by_name ('k');

-- tham chieu
delimiter //
create procedure sp_find_by_name_inout (inout p_keyword varchar(10))
begin
	
    set p_keyword = (
		select count(*)
		from student
		where `name` like concat('%', p_keyword, '%')
	);
    
end;
// delimiter ;

set @keyword_result = 'k';
call sp_find_by_name_inout(@keyword_result);
select @keyword_result;

-- out
delimiter //
create procedure sp_find_by_name_out (p_keyword varchar(10), out p_result int)
begin
    set p_result = (
		select count(*)
		from student
		where `name` like concat('%', p_keyword, '%')
	);
end;
// delimiter ;

call sp_find_by_name_out('i', @result);
select @result;

-- trigger
delimiter //
create trigger save_account_james
before insert
on student for each row
begin
	insert into account_james
    values (lcase(new.email), '12345678');
    
    if new.account_james_account is null then
		set new.account_james_account = new.email;
    end if;
end;
// delimiter ;

insert into student (`name`, date_of_birth, email, class_id)
values ('Thuận', '2021-04-09', 'thuan@gmail.com', 3);

-- 6. function
delimiter //
create function sum2num (num1 int, num2 int)
returns int
deterministic
begin
	declare total int;
    set total = num1 + num2;
	return total;

end;
// delimiter ;

select sum2num(9, 1);











