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


--join hotels table with market segment table and meal cost
select * from hotels
left join dbo.market_segment 
ON hotels.market_segment =market_segment.market_segment
left join dbo.meal_cost
on meal_cost.meal=hotels.meal
