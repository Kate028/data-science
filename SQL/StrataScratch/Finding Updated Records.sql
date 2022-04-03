Finding Updated Records
https://platform.stratascratch.com/coding/10299-finding-updated-records?python=


We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
Find the current salary of each employee assuming that salaries increase each year. 
Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.


Table: ms_employee_salary

id	first_name	last_name	salary	department_id
1	Todd	Wilson	110000	1006
1	Todd	Wilson	106119	1006
2	Justin	Simon	128922	1005
2	Justin	Simon	130000	1005
3	Kelly	Rosario	42689	1002
4	Patricia	Powell	162825	1004
4	Patricia	Powell	170000	1004
5	Sherry	Golden	44101	1002
6	Natasha	Swanson	79632	1005
6	Natasha	Swanson	90000	1005


Solution:
-- current salary of each employee, 
-- salaries increases each year -- max(salary) for current yr, remove duplicates
-- output --> id, first name, last name, department id, current salary
-- order list by emp id asc

select id, first_name, last_name, max(distinct(salary)), department_id
from ms_employee_salary
group by first_name, last_name
order by id;
