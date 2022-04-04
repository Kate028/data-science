Popularity of Hack

Meta/Facebook has developed a new programing language called Hack.To measure the popularity of Hack they ran a survey with their employees. The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack. Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. Luckily the user IDs of employees completing the surveys were stored.
Based on the above, find the average popularity of the Hack per office location.
Output the location along with the average popularity.

https://platform.stratascratch.com/coding/10061-popularity-of-hack?python=

Tables: facebook_employees, facebook_hack_survey

facebook_employees

id	location	age	gender	is_senior
0	USA	24	M	FALSE
1	USA	31	F	TRUE
2	USA	29	F	FALSE
3	USA	33	M	FALSE
4	USA	36	F	TRUE
5	India	41	F	TRUE


facebook_hack_survey

employee_id	age	gender	popularity
0	24	M	6
1	31	F	4
2	29	F	0
3	33	M	7
4	36	F	6
5	41	F	9
6	44	F	7


-- avg popularity of hack by office loc

select avg(h.popularity) as avg_popularity, e.location
from facebook_employees e inner join facebook_hack_survey h
on e.id = h.employee_id
group by location;
