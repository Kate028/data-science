# Salaries Differences

Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.

Tables: db_employee, db_dept

db_employee

id	first_name	last_name	salary	department_id
10301	Keith	Morgan	27056	2
10302	Tyler	Booth	32199	3
10303	Clifford	Nguyen	32165	2
10304	Mary	Jones	49488	3
10305	Melissa	Lucero	27024	3
10306	Ashley	Li	28516	4
10307	Joseph	Solomon	19945	1
10308	Anthony	Sanchez	43801	3
10309	Katherine	Huffman	12984	4
10310	Dawn	Foley	28902	2
10311	Melissa	Holmes	33575	1
10312	Kathleen	Davis	44579	2
10313	Adam	Simmons	15442	6
10314	Desiree	Brewer	37494	6


db_dept

id	department
1	engineering
2	human resource
3	operation
4	marketing
5	sales
6	customer care


solution:

-- diff in highest sal
-- found in marketing and engineering dept
-- output --> absolute difference in salary
select
ABS((select max(salary) from db_employee e join db_dept d 
on e.department_id = d.id where department = 'engineering')
- 
(select max(salary) from db_employee e join db_dept d
on e. department_id = d.id
where department = 'marketing'))
