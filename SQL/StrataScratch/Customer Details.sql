Customer Details
https://platform.stratascratch.com/coding/9891-customer-details?python=

Find the details of each customer regardless of whether the customer made an order. 
Output the customer's first name, last name, and the city along with the order details. 
You may have duplicate rows in your results due to a customer ordering several of the same items. 
Sort records based on the customer's first name and the order details in ascending order.

Tables: customers, orders

Customers
id	first_name	last_name	city	address	phone_number
8	John	Joseph	San Francisco		928-386-8164
7	Jill	Michael	Austin		813-297-0692
4	William	Daniel	Denver		813-368-1200
5	Henry	Jackson	Miami		808-601-7513
13	Emma	Isaac	Miami		808-690-5201
14	Liam	Samuel	Miami		808-555-5201
15	Mia	Owen	Miami		808-640-5201
1	Mark	Thomas	Arizona	4476 Parkway Drive	602-993-5916


orders

id	cust_id	order_date	order_details	total_order_cost
1	3	2019-03-04	Coat	100
2	3	2019-03-01	Shoes	80
3	3	2019-03-07	Skirt	30
4	7	2019-02-01	Coat	25
5	7	2019-03-10	Shoes	80
6	15	2019-02-01	Boats	100
7	15	2019-01-11	Shirts	60
8	15	2019-03-11	Slipper	20


Solutions:

-- details of each customer -- left join 
-- output --> customer first_name, last_name, city, order_details
-- duplicates allowed
-- order by first_name, order_details

select c.first_name, c.last_name, c.city, o.order_details
from customers c left join orders o
on c.id = o.cust_id
order by first_name, order_details;
