Consider the following schema for a bookstore database:
Books Table: [BookID (Primary Key), Title, AuthorID (Foreign Key, referencing Authors
Table), Genre, Price]
Authors Table: [AuthorID (Primary Key), FirstName, LastName, Nationality]
Customers Table: [CustomerID (Primary Key), FirstName, LastName, Email, Phone]
Orders Table: [OrderID (Primary Key), CustomerID (Foreign Key, referencing Customers
Table), Date, TotalAmount]
OrderDetails Table: [OrderDetailID (Primary Key), OrderID (Foreign Key, referencing Orders
Table), BookID (Foreign Key, referencing Books Table), Quantity, Subtotal]
Now, write SQL queries for the following:
i. Retrieve the titles of all books along with their corresponding authors' first and last
names.
ii. Find the total amount spent by each customer, whose last name starts with “s”, in the
year 2021. Include the customer's first and last names in the result set.
iii. Calculate the total sales generated from book sales in each genre. Display the genre
names along with the total amount, sorted in descending order of revenue.
iv. Write a query to identify customers who have purchased books from more than one
genre. Include the customer's first and last names in the result set, along with the
number of genres they've purchased books from.

#Solution : 

i.
SELECT B.Title, A.FirstName, A.LastName
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID;

ii.
SELECT C.FirstName, C.LastName, SUM(O.TotalAmount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE C.LastName LIKE 'S%'
  AND YEAR(O.Date) = 2021
GROUP BY C.FirstName, C.LastName;


iii.

SELECT B.Genre, SUM(OD.Subtotal) AS TotalSales
FROM Books B
JOIN OrderDetails OD ON B.BookID = OD.BookID
GROUP BY B.Genre
ORDER BY TotalSales DESC;

iv.SELECT C.FirstName, C.LastName, COUNT(DISTINCT B.Genre) AS GenreCount
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Books B ON OD.BookID = B.BookID
GROUP BY C.CustomerID, C.FirstName, C.LastName
HAVING COUNT(DISTINCT B.Genre) > 1;

