4. Consider the following schema.
Employee (employee_id, name, salary)
Showroom (showroom_id, location, opening_date, manager_id)
Customer (customer_id, name, email, phone_number, address)
Order (order_id, order_date, customer_id, showroom_id)
Product (product_id, name, description, unit_price, stock_quantity)
OrderDetails (order_id, product_id, quantity, total_price)
Now write sql queries for the below.
a) Write an SQL query to create the Showroom table. location and opening_date
columns must not allow null values.
b) Add a new column „showroom_id‟ to the employee table, which should store
the showroom each employee is assigned to and ensure that it references the
Showroom table. [Consider this change for the following questions]
c) Find the name, description, and stock quantity of products that have a price
greater than 1000 taka.
d) Find the employee names who earn more than their manager.
e) Find the product ID, name and the number of times each product has been
ordered and display the results in descending order.
f) Find all the showrooms that have the top three most number of employees

#Solution : 
1:

CREATE TABLE Showroom (
    showroom_id INT PRIMARY KEY,
    location VARCHAR(100) NOT NULL,
    opening_date DATE NOT NULL,
    manager_id INT
);

2:
ALTER TABLE Employee
ADD showroom_id INT;

ALTER TABLE Employee
ADD FOREIGN KEY (showroom_id) REFERENCES Showroom(showroom_id);

3:

SELECT name, description, stock_quantity
FROM Product
WHERE unit_price > 1000;

4:

SELECT E.name
FROM Employee E
JOIN Showroom S ON E.showroom_id = S.showroom_id
JOIN Employee M ON S.manager_id = M.employee_id
WHERE E.salary > M.salary;

5:

SELECT P.product_id, P.name, COUNT(OD.order_id) AS order_count
FROM Product P
JOIN OrderDetails OD ON P.product_id = OD.product_id
GROUP BY P.product_id, P.name
ORDER BY order_count DESC;

6:

SELECT S.showroom_id, S.location, COUNT(E.employee_id) AS emp_count
FROM Showroom S
JOIN Employee E ON S.showroom_id = E.showroom_id
GROUP BY S.showroom_id, S.location
ORDER BY emp_count DESC
LIMIT 3;
