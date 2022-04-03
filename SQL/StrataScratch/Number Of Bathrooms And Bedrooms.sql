Number Of Bathrooms And Bedrooms
Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.

Table: airbnb_search_details

id	price	property_type	room_type	amenities	accommodates	bathrooms	bed_type	cancellation_policy	cleaning_fee	city	host_identity_verified	host_response_rate	host_since	neighbourhood	number_of_reviews	review_scores_rating	zipcode	bedrooms	beds
12513361	555.68	Apartment	Entire home/apt	{TV,"Wireless Internet","Air conditioning","Smoke detector","Carbon monoxide detector",Essentials,"Lock on bedroom door",Hangers,Iron}	2	1	Real Bed	flexible	FALSE	NYC	t	89%	2015-11-18	East Harlem	3	87	10029	0	1
7196412	366.36	Cabin	Private room	{"Wireless Internet",Kitchen,Washer,Dryer,"Smoke detector","First aid kit","Fire extinguisher",Essentials,"Hair dryer","translation missing: en.hosting_amenity_49","translation missing: en.hosting_amenity_50"}	2	3	Real Bed	moderate	FALSE	LA	f	100%	2016-09-10	Valley Glen	14	91	91606	1	1
16333776	482.83	House	Private room	{TV,"Cable TV",Internet,"Wireless Internet",Kitchen,"Free parking on premises","Pets live on this property",Dog(s),"Indoor fireplace","Buzzer/wireless intercom",Heating,Washer,Dryer,"Smoke detector","Carbon monoxide detector","First aid kit","Safety card","Fire extinguisher",Essentials,Shampoo,"24-hour check-in",Hangers,"Hair dryer",Iron,"Laptop friendly workspace","translation missing: en.hosting_amenity_49","translation missing: en.hosting_amenity_50","Self Check-In",Lockbox}


Solution:

-- avg no. of bathrooms and bedrooms for each city property types
-- output the result along with city and property_type

Select city, property_type, avg(bedrooms), avg(bathrooms)
from airbnb_search_details
group by city, property_type;
