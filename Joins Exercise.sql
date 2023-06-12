/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
Select P.name, C.name From products as p
inner join categories as c On p.categoryid = c.categoryid
Where c.name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 Select p.name, p.price, r.rating from products as p
 Inner join reviews as r on r.ProductID = p.ProductID
 Where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select e.FirstName, e.LastName, Sum(s.Quantity) as Total From Sales as s
Inner Join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc
limit 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'Department Name', c.name as 'Category Name' from departments as d
inner join categories as c on c.DepartmentID = d.DepartmentID
where c.Name = 'Appliances' or c.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name, SUM(s.Quantity) AS 'total sold', SUM(s.Quantity * s.PricePerUnit) AS 'total price sold'
from Products p
inner join Sales s ON p.productID = s.productID
where p.name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.reviewer, r.rating, r.comment
from products p
inner join reviews r on p.productID = r.productID
where p.name = 'Visio TV' and r.rating = (SELECT MIN(rating) FROM reviews WHERE productID = p.productID);

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

 select p.name as "Product Sold", p.Price, sum(s.Quantity) as "Amount Sold", e.FirstName, e.LastName, e.EmployeeID from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on s.ProductID = p.ProductID
group by e.EmployeeID, p.ProductID;
