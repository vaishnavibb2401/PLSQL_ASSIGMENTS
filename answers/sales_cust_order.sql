----------------------------------------------Salespeople-----------------------------------
create table Salespeople (
snum number primary key ,
sname varchar2(10),
city varchar2(10),
Comm number
);

drop table salespeople;

select * from salespeople 

insert into Salespeople values (1001,'Peel','London' ,.12)
insert into Salespeople values (1002,'Serres','San Jose',	.13)
insert into Salespeople values (1004,	'Monika','London',.11)
insert into Salespeople values (1007,'Rifkin','Barcelona',.15)
insert into Salespeople values (1003,'Axelrod','New York',.10)
insert into Salespeople values (1005,'Franc','London',.26)

------------------------------------------------------------------------------------------------
 



------------customers---------

create table Customers (
Cnum number primary key,
Cname varchar2(20),
City varchar2(20),
Rating number,
snum number,
constraint fk_customers_snum,
 foreign key (snum),
 references salespeople(snum)
);

---
CREATE TABLE customers (
    cnum   NUMBER PRIMARY KEY,
    cname  VARCHAR2(20),
    city   VARCHAR2(20),
    rating NUMBER,
    snum number,
    CONSTRAINT fk_customers_snum
        FOREIGN KEY (snum)
        REFERENCES salespeople(snum)
);

insert into customers values(2001,'Hoffman','London',100,1001);
insert into customers values(2002,'Giovanni','Rome',200,1003);
insert into customers values(2003,'Liu','San Jose',200,1002);
insert into customers values(2004,'Grass','Berlin',300,1002);
insert into customers values(2006,'Clemens','London',100,1001);
insert into customers values(2008,'Cisneros','San Jose',300,1007);
insert into customers values(2007,'Pereira','Rome',100,1004);

select * from customers 
--------orders-------------

create table orders
(
Onum number primary key,
Amt number(10,2),
Odate date,
Cnum number,
Snum number,
constraint fk_orders_Cnum
foreign key (Cnum) references Customers (Cnum),

constraint fk_orders_Snum
foreign key (Snum) references Salespeople(Snum)
);


insert into orders values(3001,   18.69,  to_date ('03-Oct-96 12:30','DD-MON-YY HH24:MI'),  2008,  1007);
insert into orders values(3003,  767.19, to_date ('03-Oct-96 13:45','DD-MON-YY HH24:MI'), 2001,  1001);
insert into orders values(3002,  1900.10,to_date ('03-Oct-96 12:05','DD-MON-YY HH24:MI'), 2007,  1004);
insert into orders values(3005,  5160.45, to_date('03-Oct-96 14:00','DD-MON-YY HH24:MI'), 2003,  1002);
insert into orders values(3006,  1098.16, to_date('03-Oct-96 13:37','DD-MON-YY HH24:MI'), 2008,  1007);
insert into orders values(3009,  1713.23, to_date('04-Oct-96 15:21','DD-MON-YY HH24:MI'), 2002,  1003);
insert into orders values(3007,  75.75,  to_date ('04-Oct-96 16:02','DD-MON-YY HH24:MI'), 2002,  1003);
insert into orders values(3008,  4723.00, to_date('05-Oct-96 12:07','DD-MON-YY HH24:MI'), 2006,  1001);
insert into orders values(3010,  1309.95, to_date('06-Oct-96 13:12','DD-MON-YY HH24:MI'), 2004,  1002);
insert into orders values(3011,  9891.88, to_date('06-Oct-96 13:09','DD-MON-YY HH24:MI'), 2006,  1001);
insert into orders values(3012,  3455.78, to_date('04-Oct-96 15:21','DD-MON-YY HH24:MI'), 2002,  1003);
insert into orders values(3013,  1245.98, to_date('04-Oct-96 16:32','DD-MON-YY HH24:MI'), 2002,  1003);
insert into orders values(3014,  3721.53, to_date('05-Oct-96 12:45','DD-MON-YY HH24:MI'), 2006,  1001);
insert into orders values(3015,  734.50, to_date('06-Oct-96 13:16','DD-MON-YY HH24:MI'), 2004,  1002);
insert into orders values(3016,  1729.67, to_date('06-Oct-96 13:07','DD-MON-YY HH24:MI'), 2006,  1001);

select * from orders;


----------------------------------------------------------------

select * from orders;

select * from customers 

select * from salespeople 

------------------------------

--1.	List all customers with a rating of 100.

select * from customers 
where rating ='100';

--2.	Find all records in the Customer table with NULL values in the city column.

select * from customers 
where city is null;

--3.	Find the largest order taken by each salesperson on each date.



--4.	Arrange the Orders table by descending customer number.
select * from orders
order by  cnum desc;


--5.	Find which salespeople currently have orders in the Orders table.

select distinct s.Snum , s.Sname 
from salespeople s 
join orders o 
on s.Snum = o.Snum


--6.	List names of all customers matched with the salespeople serving them.

select cname ,sname from customers o 
inner join salespeople s
on o.snum = s.snum 

--7.	Find the names and numbers of all salespeople who had more than one customer. 

select sname ,snum from salespeople
where snum in (select snum 
               from customers 
               group by snum 
               having count (*)>1 
 )
 
--9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.

select* from customers 
where (SELECT COUNT(*) FROM customers WHERE city = 'San Jose') > 0;
 

SELECT *
FROM customers
WHERE EXISTS (
    SELECT 1
    FROM customers
    WHERE city = 'San Jose'
);

--10.	Match salespeople to customers according to what city they lived in.

select  sname ,c.city 
from salespeople s 
join customers c 
on s.city =c.city

 select * from customers 

select * from salespeople 

select * from orders

--11.	Find the largest order taken by each salesperson

select max(amt) largest_order from orders
group by snum;

--12.	Find customers in San Jose who has a rating above 200.

select * from customers
where city = 'San Jose'and
rating > 200


--13.	List the names and commissions of all salespeople in London.


select sname,comm from salespeople;

--14.	List all the orders of salesperson Monika from the Orders table.


select * from orders 
where snum = (select snum from salespeople
where sname='Monika')

--15.	Find all customers with orders on October 3.

select c.*
from customers c
join orders o
on c.cnum = o.cnum
where to_char(o.odate, 'DD-MON') = '03-OCT';

--16.	Give the sums of the amounts from the orders table, grouped by date

select odate , sum(amt)
from orders 
group by odate

--17.	Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.-----ask

select odate from  
 (SELECT odate,
           SUM(amt) AS total_amt,
           MAX(amt) AS max_amt
    FROM orders
    GROUP BY odate
    )
where total_amt >= max_amt +2000
---

SELECT odate
FROM orders
GROUP BY odate
HAVING SUM(amt) >= MAX(amt) + 2000;

--18.	Select all orders that had amounts that were greater 
--than at least one of the orders from October 6.

select amt,odate from orders 
where to_char(odate,'dd-mm-yyyy')> '6-oct'


--19.	Write a query that uses the EXISTS operator to 
--extract all salespeople who have customers with a rating of 300.--ask


select *  from salespeople s
where exists (select 1 from customers c
where c.snum=s.snum 
and
 rating = 300 )

--20.	Find all pairs of customers having the same rating.--ask

SELECT c1.cname AS customers1,
       c2.cname AS customers2,
       c1.rating
FROM customers c1
join customers c2
on c1.rating =c2.rating



--21.	Find all customers with CNUM, 1000 above the SNUM of Serres.

select * from customers 
where cnum =(select snum +1000
 from salespeople 
 where sname ='Serres')


select * from salespeople

--22.	Give the salespeople’s commissions as percentage instead of decimal numbers

select s.*,comm *100||'%' as commission_per from salespeople s
  

--23.	Find the largest order taken by each salesperson on each date, 
--eliminating those MAX orders, which are less than $3000.00 in value.

select max(amt)max_amt,odate from orders 
group by odate,snum
having max(amt)>=3000;

--24.	List the largest orders on October 3, for each salesperson.
 
select snum,odate ,max(amt)from orders
where  to_char(odate, 'DD-MON') = '03-OCT'
group by snum,odate

--25.	Find all customers located in cities where Serres (SNUM 1002) has customers.


select * from orders 
select * from salespeople
select * from customers

select * from customers 
where city in (select city from salespeople
where snum =1002 ) 

--26.	Select all customers with a rating above 200.00.

select * from customers
where rating > 200

--27.	Count the number of salespeople currently listing orders in the Orders table

select count(*) from salespeople where snum in ( 
select snum from orders)

--28.	Write a query that produces all customers serviced by salespeople with a commission above 12%. 
--Output the customer’s name and the salesperson‘s rate of commission.

select c.cname,s.comm  from customers c
join salespeople s
on c.snum =s.snum 
where comm > 0.12

--29.	Find salespeople who have multiple customers.

select snum from customers
group by snum 
having count(*)>1


--30.	Find salespeople with customers located in their city.

select * from salespeople s
join customers c 
on c.snum =s.snum 
and c.city = s.city 

--31.	Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.

select * from salespeople
where sname like 'P__l%';

--32.	Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. 
--Assume you do not know his customer number
select * from orders
where cnum in(
select cnum from customers 
where cname = 'Cisneros')

--33.	Find the largest orders for ‘Serres’ and ‘Rifkin’.
select * from orders 
where cnum in (select cnum ,max(amt)
from salespeople
join )


--34.	Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.

select snum sname,comm,city from salespeople

--35.	Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.

select * from customers 
where cname between  'A' AND 'G'

--36.	Select all the possible combinations of customers that you can assign.

select 



--37.	Select all orders that are greater than the average for October 4

SELECT *
FROM orders
WHERE amt >
      ( SELECT AVG(amt)
        FROM orders
        WHERE odate = '04-OCT-1990' )
AND odate = '04-OCT-1990';
--38.	Write a select command using a correlated sub query 
--that selects the names and numbers of all customers 
--with ratings equal to the maximum for their city.





--39.	Write a query that totals the orders for each day and places the results in descending order.

select 

--40.	Write a select command that produces the rating
--followed by the name of each customer in San Jose.

SELECT rating, cname
FROM customers
WHERE city = 'San Jose';

--41.	Find all orders with amounts smaller than any amount for a customer in San Jose.
SELECT *
FROM orders
WHERE amt < ANY
(select * from orders o 
join customers c
on o.cnum = c.cnum 
where c.city = 'San Jose')


select * from customers 


SELECT *
FROM orders
WHERE amt < ANY (
    SELECT amt
    FROM orders o
    JOIN customers c
      ON o.cnum = c.cnum
    WHERE c.city = 'San Jose'
);






--42.	Find all orders with above average amounts for their customers.


--43.	Write a query that selects the highest rating in each city.



--44.	Write a query that calculates the amount of the salesperson’s
-- commission on order by a customer with a rating above 100.00.



--45.	Count the customers with rating above San Jose’s average

SELECT COUNT(*) AS customer_count
FROM customer
WHERE rating >
      (SELECT AVG(rating)
       FROM customer
       WHERE city = 'San Jose');

--46.	Write a query that produces all pairs of salespeople with
-- themselves as well as duplicate rows with the order reversed.



--47.	Find all salespeople that are located in either Barcelona or London

select * from salespeople
where city in ('Barcelona','London')


--48.	Find all salespeople with only one customer

SELECT s.snum,
       s.sname
FROM salespeople s
JOIN customers c
ON s.snum = c.snum
GROUP BY s.snum, s.sname
HAVING COUNT(c.cnum) = 1;

--60.	Write a query that selects all orders that have Zeroes or NULL in the Amount field.

select * from orders 
where amt=0 or  amt is not null;

--61.	Produce all combinations of salespeople and customer names such that 
--the former precedes the latter alphabetically, and the latter has a rating of less than 200.

--62.	List all salespeople’s names and the commission they have earned.

select sname ,comm from salespeople


--63.	Write a query that produces the names and cities of all 
--customers with the same rating as Hoffman. 
--Write the query using Hoffman’s CNUM rather than his rating, 
--so that it would still be usable if his rating changed.

SELECT cname, city
FROM customers
WHERE rating = (
    SELECT rating
    FROM customers
    WHERE cname = 'Hoffman'
);


---64.	Find all salespeople for whom there are customers that follow them in alphabetical order.

select * from salespeople
order by sname ;

--65.	Write a query that produces the names and ratings of all customers of all 
--who have above average orders.

select cname,rating from customers c 
join orders o 
on c.cnum =o.cnum 
where o.amt > (select avg(amt)from orders)


--66.	Find the sum of all purchases from the Orders table.

select sum(amt)
from orders o

select * from orders 

--67. Write a select command that produces the order number, amount, 
--and date for all rows in the Order table

SELECT onum, amt, odate
FROM orders;

--68.	Count the number of not null rating fields in 
--the Customer table including duplicates.

select count(rating) from customers 
where rating is not null

--69.	Write a query that gives the names of both the salesperson and 
--the customer for each order after the order number.

SELECT o.onum,
       s.sname AS salesperson_name,
       c.cname AS customer_name
FROM orders o
JOIN salespeoples s
  ON o.snum = s.snum
JOIN customers c
  ON o.cnum = c.cnum;
  
--70.	List the commissions of all salespeople servicing customers in London.

select sname ,comm, snum from salespeople
where snum in (select snum from customers 
where city ='London')

--71.	Write a query using ANY or ALL that will find all salespeople 
--who have no customers located in their city.

--72.	Write a query using the EXISTS operator that selects 
--all salespeople with customers located in their cities who are not assigned to them.

select * from salespeople s
where  exists (select 1 from customers c
where c.city =s.city and 
s.snum!=c.snum 
)

--73.	Write a query that selects all customers serviced by Peel or Motika.

select * from customers 
where snum in (select snum from salespeople
where sname in('Peel','motika'))

--74.	Count the number of salespeople registering orders for each day. 
--(If a salesperson has more than one order on a given day, he or she should be counted only once.).

select odate ,count(distinct o.snum) sales from orders o 
group odate 

--
select odate,count(*)as sales_count from
(select distinct odate,snum from orders)
group by odate

--75.	Find all orders attributed to salespeople in London.
 select * from orders 
 where snum in (
 select snum from salespeople 
 where city = 'London')

--76.	Find all orders by customers not located in the same cities as their salespeople.

select * from orders o
where cnum in (select cnum from customers c
where city !=all(select city from salespeople)
)

--77.	Find all salespeople who have customers with more than one current order.
SELECT cnum
FROM orders
GROUP BY cnum
HAVING COUNT(*) > 1;


--
SELECT DISTINCT c.snum
FROM customers c
WHERE c.cnum IN (
    SELECT cnum
    FROM orders
    GROUP BY cnum
    HAVING COUNT(*) > 1
);
--
SELECT DISTINCT s.*
FROM salespeople s
JOIN customers c ON s.snum = c.snum
JOIN orders o ON c.cnum = o.cnum
GROUP BY s.snum, s.sname, s.city, s.comm, c.cnum
HAVING COUNT(o.onum) > 1;
----------------------------------------
--78.	Write a query that extracts from the Customer table every customer
-- assigned to a salesperson who currently has at least one other customer 
--(besides the customer being selected) with orders in the Orders table.


select o.snum,count(o.cnum)
from orders o
group by o.snum
having count(cnum)>=1;

--79.	Write a query that selects all customers whose name begins with ‘C’.

select * from customers 
where cname like 'C%'

--80.	Write a query on the Customers table that will find the highest rating in each city. 
--Put the output in this form:  for the city (city) the highest rating is : (rating).

select 'for the city'||' '||city||' '||'hightest rating is :'||' '||max(rating) cityratings
from customers
group by city;

--81.	Write a query that will produce the Snum values of all salespeople with 
--orders currently in the Orders table without any repeats.
SELECT DISTINCT snum
FROM orders;

--82.	Write a query that lists customers in descending order of rating. 
--Output the rating field first, followed by the customers’ names and numbers.

select rating ,cname,cnum from customers 
order by rating desc

--83.	Find the average commission for salespeople in London.

select avg(comm)from salespeople
where city ='London'

--84.	Find all orders credited to the same salesperson that services Hoffman

select * from orders
where snum =(select snum from customers
where cname ='Hoffman')

--85.	Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.

select * from salespeople
where comm between 0.10 and 0.12 

--86.	Write a query that will give you the names and cities of all 
--salespeople in London with commission above 0.10

select sname ,city,comm from salespeople
where city = 'London' and comm >0.10

--87.	What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = '10/03/1996' AND CNUM > 2003));

SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = '10/03/1996' AND CNUM > 2003));

--88.	Write a query that selects each customer’s smallest order.

select cnum ,min(amt) from orders
group by cnum

--89.	Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.

select * from customers
where cname like 'G%'
--90.	Write a query that counts the number of different not NULL city values in the Customers table.

select cnum,count(city)from customers
where city is not null
group by cnum

--91.	Find the average amount from the Orders table.

select avg(amt)
from orders
--92.	What would be the output from the following query?

SELECT*FROM ORDERS
WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);

--93.	Find all customers who are not located in San Jose & whose rating is above 200.

select * from customers 
where city != 'San Jose' and rating >200

--94.	Give a simpler way to write this query:

SELECT Snum, Sname, city, Comm FROM salespeople
 WHERE (Comm>0.12 and Comm <0.14);
--95.	Evaluate the following query:
SELECT * FROM orders
 WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);
 
--96.	Which salespeople attend to customers not in the city they have been assigned to?


select sname,snum,city from salespeople
where snum in (select s.snum from customers c
join salespeople s 
on s.snum =c.snum
where c.city <> s.city)
------------------------------
SELECT s.snum, s.sname
FROM salespeople s
WHERE EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.snum = s.snum
      AND c.city <> s.city
);


------------------------
--97.	Which salespeople get commission greater than 0.11 and serving customers rated less than 250?

select * from salespeople s 
join customers c
on s.snum =c.snum 
where s.comm > 0.11 and c.rating < 250;

--98.	Which salespeople have been assigned to the same city but get different commission percentages?

select s.sname,s.snum ,s.city,s.comm
from salespeople s
join salespeople s2
on s.city = s2.city
where s.snum <>s2.snum 
and s.comm <> s2.comm 


select * from salespeople
select * from customers
select * from orders 


select s1.snum,s1.sname,s1.city 
from salespeople s1
join salespeople s2
on s1.city =s2.city
where s1.snum <>s2.snum
and s1.comm <> s2.comm

--99.	Which salesperson has earned the most by way of commission?

select * from salespeople
where comm = (select max(comm) from salespeople)

--100.	Does the customer who has placed the maximum number of orders have the maximum rating?----



--101.	Has the customer who has spent the largest amount of money been given the highest rating?




--101.  Has the customer who has spent the largest amount of money been given the highest rating?

select c.rating,c.cname from customers 
join 





select o.cnum,c.cname,c.rating,sum(o.amt)
from orders o join customers c on c.cnum=o.cnum 
group by o.cnum,c.cname,c.rating
order by c.rating desc;

--102.  List all customers in descending order of customer rating.
select * from customers
order by rating desc;

--103.  On which days has Hoffman placed orders?
select odate from orders 
where cnum = (select cnum 
              from customers
              where cname ='Hoffman');
              
--104.  Do all salespeople have different commissions?
select distinct(comm),sname from salespeople;

--105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?
select snum from orders
where snum not in(select snum
              from orders
              where odate between to_date('10-Mar-96') and to_date('10-May-96');
select* from orders;

--106.  How many salespersons have succeeded in getting orders?
select count(snum) from salespeople 
where snum in (select snum from orders );

--107.  How many customers have placed orders?
select count(cnum) from customers 
where cnum in(select cnum from orders);

--108.  On which date has each salesperson booked an order of maximum value?
select snum,to_date(odate),max(amt) 
from orders group by to_date(odate),snum ;

--109.  Who is the most successful salesperson?
select * 
from(select snum,sum(amt),dense_rank()over(order by sum(amt))drn from orders group by snum
)
where drn=1;


--110.  Who is the worst customer with respect to the company?
select * 
from(select cnum, sum(amt), rank()over(order by sum(amt))rnk from orders group by cnum )
where rnk=1;

--111.  Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?
select s.sname,o.snum,amt 
from orders o join salespeople s 
on s.snum=o.snum 
where amt<200 and s.sname in ('Peel','serres');
 
--112.  Which customers have the same rating?
select a.cname, b.cname, a.rating from customer_table a,customer_table b where a.cnum<>sb.cnum and a.rating=b.rating order by b.rating;

select* from salespeople;
select * from Customers;
select * from Orders;
--113.  Find all orders greater than the average for October 4th.
select * from orders
where amt > all(select avg(amt)
                from orders
                where odate ='04-oct-96');
                 
--114.  Which customers have above average orders?
select cnum 
from orders
where amt > (select avg (amt) from orders);

--115.  List all customers with ratings above San Jose’s average.
select * from customers
where cnum in (select cnum
               from customers 
               where rating >(select avg(rating)
                              from customers 
                              where city='San Jos%'))
                              

--116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.
select snum, sum(amt)
from orders 
group by snum
having sum(amt) > (select max(amt)
                   from orders);
                 
--117.  Give names and numbers of all salesperson that have more than one customer.
select snum,sname from salespeople
where snum in (select snum
               from orders 
               group by snum
               having count(snum)>1)
               
--118.  Select all salesperson by name and numbers who have customers in their city whom they don’s the service.
select s.snum,s.sname from salespeople s join customers c on s.snum=c.snum
where s.city<>c.city;

--119.  Which customers’ rating should be lowered?
select * 
from(select c.cnum,c.cname,sum(o.amt),dense_rank() over (order by sum(o.amt))drn from orders o join customers c 
on c.cnum=o.cnum group by c.cname,c.cnum)
where drn=1;

--120.  Is there a case for assigning a salesperson to Berlin?
select a.sname,b.city from salespeople a join customers b 
on a.snum=b.snum
where b.city='Berlin';

--121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?
select b.snum,c.sname,sum(a.amt) as totalsalesbySP,round(sum(amt)*c.comm ) comm
from orders a,customers b,salespeople c 
where a.cnum=b.cnum and b.snum=c.snum group by b.snum,c.sname,c.comm
order by totalsalesbySP desc;
      
--122.  Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?
select distinct (select sum(a.amt*c.comm) as totalsales 
        from orders a,customers b,salespeople c 
        where a.cnum=b.cnum and b.snum=c.snum and (c.city='London' or c.city='New York'))as x,
       (select sum(a.amt)
        from orders a,customers b 
        where a.cnum=b.cnum and (b.city='Rome' or b.city='London')) as y from orders;
      
--123.  Which is the date, order number, amt and city for each salesperson (byname) for 
--  the maximum order he has obtained?

select date 



--124.  Which salesperson(s) should be fired?

SELECT s.snum, s.sname
FROM salespeople s
WHERE NOT EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.snum = s.snum
);


--125.  What is the total income for the company? 
select sum(o.amt) Total_income
from orders o;


select* from salespeople;
select * from Customers;
select * from Orders;

