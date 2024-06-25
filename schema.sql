-- Creating a database in sqlite3 for an online bookstore database:

-- Represents all book authors
CREATE TABLE Authors (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

-- Represents all books
CREATE TABLE Books (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Author_id INTEGER,
    Title TEXT NOT NULL,
    ISBN TEXT UNIQUE,
    Price NUMERIC NOT NULL,
    Quantity INTEGER NOT NULL CHECK(Quantity >= 0),
    FOREIGN KEY(Author_id) REFERENCES Authors(Id)
);

-- Represents all customers
CREATE TABLE Customers (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Email TEXT UNIQUE,
    Address TEXT
);

-- Represents all orders by customers
CREATE TABLE Orders (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Customer_id INTEGER,
    Book_id INTEGER,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Quantity INTEGER NOT NULL CHECK(Quantity >= 0),
    FOREIGN KEY(Customer_id) REFERENCES Customers(Id),
    FOREIGN KEY(Book_id) REFERENCES Books(Id)
);

-- Create trigger to update books quantity once order is confirmed and ensured quantity of books is sufficient for the
-- purchase quantity
CREATE TRIGGER Buy
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN (SELECT Quantity FROM Books WHERE Id = NEW.Book_id) = 0
        THEN RAISE(ABORT, 'Book is out of stock')
        WHEN (SELECT Quantity FROM Books WHERE Id = NEW.Book_id) < NEW.Quantity
        THEN RAISE(ABORT, 'Insufficient book quantity')
    END;

    UPDATE Books
    SET Quantity = Quantity - NEW.Quantity
    WHERE Id = NEW.Book_id;
END;

CREATE VIEW OrderDetails AS
SELECT
    Customers.Name AS CustomerName,
    Customers.Email AS CustomerEmail,
    Books.Title AS BookTitle,
    Orders.OrderDate AS OrderDate,
    Orders.Quantity AS Quantity
FROM Orders
JOIN Customers ON Orders.Customer_id = Customers.Id
JOIN Books ON Orders.Book_id = Books.Id;

-- Create indexes to speed common searches
CREATE INDEX author_name_search ON Authors(Name);
CREATE INDEX book_title_search ON Books(Title);
CREATE INDEX book_quantity_search ON Books(Quantity);
CREATE INDEX book_isbn_search ON Books(ISBN);
CREATE INDEX book_price_search ON Books(Price);
CREATE INDEX customer_search ON Customers(Name, Email);
CREATE INDEX order_customer_search ON Orders(Customer_id);
CREATE INDEX order_book_search ON Orders(Book_id);
