/*   Write a query to determine the number of rows in the customer table */

select count(*) 
from customer

/*What was the maximum commission paid in the customer table? The median?*/

select MAX(august_commission)
from customer;

/*What was the median commission paid in the customer table?*/

SELECT AVG(august_commission)
FROM (SELECT august_commission
      FROM customer
      ORDER BY august_commission
      LIMIT 2 - (SELECT COUNT(*) FROM customer) % 2    -- odd 1, even 2
      OFFSET (SELECT (COUNT(*) - 1) / 2
              FROM customer))
              
/*Write a query to that returns the customer_id, business_type and Country from the customer table.*/
 
 select customer_id, business_type, Country
 from customer
 
 /*How many customers do we have “has_instagram” information for in the customer table? i.e. – How many rows are not NULL? */
 
 select *
 from customer
 where has_instagram is not null
 
 /*How many customers have a “First_conversion_date” greater than 1/1/2016 in the customer table?*/
 
 select *
 from customer
 where First_conversion_date > '2016-01-01'
 
 /*How many customers have “has_facebook” =1 in the customer table? Use a group by statement.*/
 
 select has_facebook, count(has_facebook)
 from customer
 group by has_facebook

 
 /*Which state has the most customers? How many customers live in that state in the customer table?*/
 
 select count(Customer_id) AS count, State
 from customer
 GROUP BY State
 ORDER BY count desc
 limit 1
 
 /*Using the billedservices table, how many customers had more than 1 billed service? Use a subquery*/
 
 select count(customer_id)
 from (select customer_id,count(service_completed) as serviceshired
 	   from billedservices
 	   group by customer_id)
 where serviceshired > 1
 
 /*How many customers from OUTSIDE the United States have an entry in the billed services table?*/

 