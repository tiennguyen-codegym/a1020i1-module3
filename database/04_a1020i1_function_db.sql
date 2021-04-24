-- Bài tập: Lấy ra số lượng học viên của từng lớp.
select c.`name`, count(s.class_id) 'quantity'
from student s
	right join class c on s.class_id = c.id
group by c.id;

select *
from student
where id in (
	select max(id)
	from student
);

-- Bài tập: Lấy ra toàn bộ các instructor và student ở CodeGym.

select `name`, id, date_of_birth, 0 'type_person'
from student
union all
select id, `name`, date_of_birth, 1 'type_person'
from instructor;

-- Bài tập: Lấy ra 3 học viên trẻ tuổi nhất ở CodeGym.
select *
from student
order by date_of_birth desc
limit 3;

-- Bài tập: Lấy ra thông tin các lớp, kể cả lớp không có học viên học.

select *
from class
where id not in (
	select class_id
    from student
    where class_id is not null
);

select *
from class
where not exists (
	select *
    from student
    where student.class_id = class.id
);

select `name`, length(`name`), char_length(`name`),
	day(date_of_birth), month(date_of_birth), year(date_of_birth),
    concat(day(date_of_birth), '/', month(date_of_birth), '/', year(date_of_birth)) as 'dob'
from student;

select concat ('a', ' ', 'b');

SELECT year(CURRENT_DATE());

SELECT current_date(), now();

select substring('Tien', 1, 3);
