--=================Assignment 4 Key ===============

--select * from DBO.Menu    --dbo.Menu_BackUp


--17. Retrieve the ItemType has more than $20,000 in Monthly Sales
select ItemType,sum(MonthlySales) TotalMonthlySales from DBO.Menu group by ItemType  having sum(MonthlySales) >20000

--16. Find out the profit made Weekly, Monthly and Yearly on Big Mac’s
	select *  from DBO.Menu  where ITEMID=1003
	/*
	1.25	3.24	1015

select 1015/7 --per day sale 145
select 145/3.24  --44.75  =(select 44.75*3.24) .Daily 44  Big Mac’s selling Each Cost 3.24
select 3.24-1.25 =1.99 --profit per each Big Mac’s piece

Daily 44 pieces selling  
weekly 308( 44*7) pieces selling. Profit per weekly is  308*1.99  =612.92
*/

  --15. Retrieve Total Weekly Sales by ItemType of only items with more than 3000 weekly Sales.  Sort by Total Weekly Sales descending.
  select ItemType,sum(WeeklySales) TotalWeeklySales from DBO.Menu group by ItemType having sum(WeeklySales)>4000  order by sum(WeeklySales)  --having sum(WeeklySales)>4000 

  --14. What’s the sum of total profit by ItemType
  select ItemName,ItemType,price,CostToMake,price-costToMake AS Profit_ByItemName from  DBO.Menu
  select ItemType,sum(price) TotalPrice,sum(CostToMake) TotalCostToMake,sum(price)-sum(CostToMake) AS Profit_ByItemType from  DBO.Menu  group by ItemType

  --13. Retrieve all items that Cost more than $1.00 to make and sort by WeeklySales
  select * from  DBO.Menu where costToMake >1 order by WeeklySales

  --12. Retrieve all Burritos and sort by Price
  select * from  DBO.Menu  where itemType='Burrito'  order by price

  --10. We will be discontinuing any products that didn’t clear $10,000 in YearlySales Profit. 
  Delete from DBO.Menu where YearlySales < 10000

--9. All products that bring in  < $1.00 profit per purchase need to be deleted   --1002 , 1004
Delete  from DBO.Menu where price-costToMake <1

--8. The prices of tortillas have gone up.  All Burrito prices should increase 10%
UPDATE dbo.Menu set  price=price+(price *10)/100 from dbo.Menu where ItemType='Burrito'

--7. It now cost $2.75 to make the 7 layer Burrito
UPDATE dbo.Menu set CostToMake=2.75 where ItemID=1001 --ItemName='7 layer Burrito'

--6. The Whopper increased it’s price to $4.25
UPDATE dbo.Menu set price=4.25 where ItemID=1014  --ItemName='Whopper'

--5. Italian Sub Monthly Sales were reported incorrectly.  There were really 1353 Sales.
UPDATE dbo.Menu set MonthlySales=1353 where ItemID=1007  --ItemName='Italian Sub'

--4. The 3 Cheese Sub is now made with 4 Cheeses.  The new name will be 4 Cheese Sub
UPDATE dbo.Menu set ItemName='4 Cheese Sub' where ItemID=1000  --ItemName='4 Cheese Sub'

--================== Assignment 4 Key =================




CREATE TABLE DBO.Menu(
ItemID int IDENTITY(1000,1) not null primary key,
ItemName varchar(50),
ItemType varchar(50) not null,
CostToMake money null, 
Price money null,
WeeklySales int null,
MonthlySales int null,
YearlySales int null
);

2. drop table [dbo].[Menu]


3. recreate the table called Menu and insert the following data

INSERT INTO dbo.Menu
SELECT		'Big Mac','Hamburger',1.25,3.24,1015,5000,15853	
union
SELECT		'Quarter Pounder / Cheese','Hamburger',1.15,3.24,1000,4589,16095
union
SELECT		'Half Pounder / Cheese','Hamburger',1.35,3.50,500,3500,12589
union
SELECT		'Whopper','Hamburger',1.55,3.99,989,4253,13000
union
SELECT		'Kobe Cheeseburger','Hamburger',2.25,5.25,350,1500,5000
union
SELECT		'Grilled Stuffed Burrito','Burrito',.75,5.00,2000,7528,17896
union
SELECT		'Bean Burrito','Burrito',.50,1.00,1750,7000,18853
union
SELECT		'7 layer Burrito','Burrito',.78,2.50,350,1000,2563
union
SELECT		'Dorito Burrito','Burrito',.85,1.50,600,2052,9857
union
SELECT		'Turkey and Cheese Sub','Sub Sandwich',1.75,5.50,1115,7878,16853
union
SELECT		'Philly Cheese Steak Sub','Sub Sandwich',2.50,6.00,726,2785,8000
union
SELECT		'Tuna Sub','Sub Sandwich',1.25,4.50,825,3214,13523
union
SELECT		'Meatball Sub','Sub Sandwich',1.95,6.50,987,4023,15287
union
SELECT		'Italian Sub','Sub Sandwich',2.25,7.00,625,1253,11111
union
SELECT		'3 Cheese Sub','Sub Sandwich',.25,6.00,815,3000,11853

3.Before we start updating and deleting, we want to do everything on a backup copy of the table.  Therefore, Create a menu_backup using the SELECT INTO Statement. 




4. The 3 Cheese Sub is now made with 4 Cheeses.  The new name will be 4 Cheese Sub



5. Italian Sub Monthly Sales were reported incorrectly.  There were really 1353 Sales.

6. The Whopper increased it’s price to $4.25
7. It now cost $2.75 to make the 7 layer Burrito
8. The prices of tortillas have gone up.  All Burrito prices should increase 10%
9. All products that bring in  < $1.00 profit per purchase need to be deleted
10. We will be discontinuing any products that didn’t clear $10,000 in YearlySales Profit. 


11.We just found out all the previous changes were incorrect.  Truncate the dbo.menu_backup table.

12. Retrieve all Burritos and sort by Price
13. Retrieve all items that Cost more than $1.00 to make and sort by WeeklySales
14. What’s the sum of total profit by ItemType
15. Retrieve Total Weekly Sales by ItemType of only items with more than 3000 weekly Sales.  Sort by Total Weekly Sales descending.
16. Find out the profit made Weekly, Monthly and Yearly on Big Mac’s
17. Retrieve the ItemType has more than $20,000 in Monthly Sales


