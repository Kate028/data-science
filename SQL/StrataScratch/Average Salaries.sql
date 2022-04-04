Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

https://platform.stratascratch.com/coding/9917-average-salaries?python=


Table: employee

id	first_name	last_name	age	sex	employee_title	department	salary	target	bonus	email	city	address	manager_id
5	Max	George	26	M	Sales	Sales	1300	200	150	Max@company.com	California	2638 Richards Avenue	1
13	Katty	Bond	56	F	Manager	Management	150000	0	300	Katty@company.com	Arizona		1
11	Richerd	Gear	57	M	Manager	Management	250000	0	300	Richerd@company.com	Alabama		1
10	Jennifer	Dion	34	F	Sales	Sales	1000	200	150	Jennifer@company.com	Alabama		13
19	George	Joe	50	M	Manager	Management	100000	0	300	George@company.com	Florida	1003 Wyatt Street 1


Solution:

-- compare each emp salary with the avg salary of the corresponding department
-- output --> department, first_name, salary, avg(salary) of dept

select department, first_name, last_name, salary, avg(salary) over(partition by department) as avg_sal
from employee;
