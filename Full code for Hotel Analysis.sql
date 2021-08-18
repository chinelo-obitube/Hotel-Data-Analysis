----Import datasets which is an .xlsx file containing five sheets to add data to the database.

--Select whole information from the year tables in the database

select * from dbo.[2018]

select * from dbo.[2019]

select * from dbo.[2020];

--union all the year tables 
select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020];

--create a temporary table
with hotels as (
select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])

--Doing some sql data exploration
--add total stays
select stays_in_week_nights+stays_in_weekend_nights from hotels

----add total stay_ins for weekend_nighs and week_night and multiply by adr to get the cost of revenue
select (stays_in_week_nights+stays_in_weekend_nights)*adr from hotels

--check if the revenue is increasing by year
select 
arrival_date_year,
(stays_in_week_nights+stays_in_weekend_nights)*adr as revenue
from hotels

--Grouping by year
select 
arrival_date_year,
sum((stays_in_week_nights+stays_in_weekend_nights)*adr) as revenue 
from hotels
group by arrival_date_year

--Breakdown revenue by year and hotel type and round revenue to two decimal places
select 
arrival_date_year,
hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue 
from hotels
group by arrival_date_year,hotel

--join hotels table with market segment table and meal cost
select * from hotels
left join dbo.market_segment 
ON hotels.market_segment =market_segment.market_segment
left join dbo.meal_cost
on meal_cost.meal=hotels.meal
