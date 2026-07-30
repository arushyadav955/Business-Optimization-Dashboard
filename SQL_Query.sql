

create database Business_Project

use Business_Project

select * from [dbo].[Dataset]

select distinct Order_Date_DD_MM_YYYY
from [dbo].[Dataset]


select distinct Order_Date_DD_MM_YYYY
from [dbo].[Dataset]
where Order_Date_DD_MM_YYYY is null or Order_Date_DD_MM_YYYY = ''

select distinct Product_ID
from [dbo].[Dataset]

update [dbo].[Dataset]
set Product_ID=7 where Product_ID=21

update [dbo].[Dataset]
set Product_ID=11 where Product_ID=22

select distinct Product_ID
from [dbo].[Dataset] order by Product_ID

select distinct Availability from [dbo].[Dataset]

select distinct Demand from [dbo].[Dataset]

select * into new_table from
(select a.Order_Date_DD_MM_YYYY, a.Product_ID, a.Availability,
a.Demand, b.Product_Name, b.Unit_Price

from [dbo].[Dataset] as a
left join [dbo].[Products] as b on a.Product_ID=b.Product_ID ) x