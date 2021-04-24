-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select s.id, s.`name` as 'student_name', c.`name` 'class_name'
from student s
	inner join class c on s.class_id = c.id;

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào, lớp đó thuộc loại lớp nào.
select *
from student s
	inner join class c on s.class_id = c.id
    inner join type_of_class toc on c.type_of_class_id = toc.id;
    
-- 3. Lấy ra thông tin các học viên kể cả các học viên không theo học lớp nào.
select *
from student s
	left join class c on s.class_id = c.id;
    
select *
from class c 
	right join student s on s.class_id = c.id;

select *
from student s
	left join class c on s.class_id = c.id
union
select *
from student s
	right join class c on s.class_id = c.id;

-- 4. Lấy thông tin của các học viên tên 'Tiến' và ‘Mai’.
select *
from student
where `name` = 'Tiến' or `name` = 'Mai';

-- 5. Lấy ra số lượng học viên của từng lớp.

select *
from student s
	right join class c on s.class_id = c.id;
    
select c.`name`, count(c.id)
from student s
	inner join class c on s.class_id = c.id
group by c.id;

select c.`name`, count(s.class_id) 'quantity'
from student s
	right join class c on s.class_id = c.id
group by c.id;

-- 6. Lấy ra danh sách học viên và sắp xếp tên theo alphabet

select *
from student
order by `name`;

select *
from student
order by `name` desc;


select *
from student
where `name` like '_t%';