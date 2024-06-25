-- Insert Authors
INSERT INTO Authors (Name) VALUES
('J.K. Rowling'),
('George Orwell'),
('Jane Austen'),
('Stephen King');

-- Insert Books
INSERT INTO Books (Author_id, Title, ISBN, Price, Quantity) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', '9780747532743', 29.99, 100),
(1, 'Harry Potter and the Chamber of Secrets', '9780747538486', 39.99, 75),
(2, '1984', '9780451524935', 19.99, 50),
(3, 'Pride and Prejudice', '9780141439518', 15.99, 60),
(4, 'The Shining', '9780307743657', 24.99, 40);

-- Insert Customers
INSERT INTO Customers (Name, Email, Address) VALUES
('Millie Brown', 'millie@gmail.com', 'Brackley, UK'),
('John Smith', 'john.smith@example.com', 'New York, USA'),
('Emma Watson', 'emma.watson@example.com', 'London, UK'),
('Chris Evans', 'chris.evans@example.com', 'Los Angeles, USA');

-- Insert Orders
INSERT INTO Orders (Customer_id, Book_id, Quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 3),
(4, 5, 2),
(2, 1, 1),
(3, 2, 2);
