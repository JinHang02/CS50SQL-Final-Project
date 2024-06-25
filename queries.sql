-- Find books based on author name
SELECT * FROM Books
JOIN Authors ON Authors.Id = Books.Author_id
WHERE Authors.Name = "J.K. Rowling";

-- Find book details based on title
SELECT * FROM Books
WHERE Title = "Harry Potter and the Chamber of Secrets";

-- Find book details based on ISBN
SELECT * FROM Books
WHERE ISBN = "9780747532743";

-- Find book details based on Price
SELECT * FROM Books
WHERE Price = 39.99;

-- Find book details based on Quantity
SELECT * FROM Books
WHERE Quantity = 40;

-- Find customer based on Name and Email Address
SELECT * FROM Customers
WHERE Name = "Millie Brown" AND Email = "millie@gmail.com";

-- Get orders for a specific customer (VIEW)
SELECT CustomerName, BookTitle, OrderDate, Quantity FROM OrderDetails
WHERE CustomerName = 'Millie Brown' AND CustomerEmail = "millie@gmail.com";

-- Get orders for a specific book (VIEW)
SELECT CustomerName, BookTitle, OrderDate, Quantity FROM OrderDetails
WHERE BookTitle = 'Harry Potter and the Philosopher''s Stone';

-- Find order information based on customer_id
SELECT * FROM Orders
WHERE Customer_id = (
    SELECT Id FROM Customers
    WHERE Name = "Millie Brown" AND Email = "millie@gmail.com"
);

-- Find order information based on book title
SELECT * FROM Orders
WHERE Book_id = (
    SELECT Id FROM Books
    WHERE Title = "Harry Potter and the Chamber of Secrets"
);

-- Find order information based on book ISBN
SELECT * FROM Orders
WHERE Book_id = (
    SELECT Id FROM Books
    WHERE ISBN = "9780747532743"
);

-- Add a new author
INSERT INTO Authors (Name)
VALUES ("J.K. Rowling");

-- Add a new book type
INSERT INTO Books (Author_id, Title, ISBN, Price, Quantity)
VALUES (3,"Harry Potter and the Chamber of Secrets","9780747532743",39.99,10);

-- Add a new customer
INSERT INTO Customers (Name, Email, Address)
VALUES ("Millie","millie@gmail.com","Brackley,UK");

-- Add a new order
INSERT INTO Orders (Customer_id, Book_id, Quantity)
VALUES (1,1,1);
