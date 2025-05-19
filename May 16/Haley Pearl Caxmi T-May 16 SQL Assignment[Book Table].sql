-- Create Table Book
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Price INT,
    PublishedYear INT,
    Stock INT
);

-- Insert data
INSERT INTO Book (BookID, Title, Author, Genre, Price, PublishedYear, Stock) VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 300, 1988, 50),
(2, 'Sapiens', 'Yuval Noah Harari', 'Non-Fiction', 500, 2011, 30),
(3, 'Atomic Habits', 'James Clear', 'Self-Help', 400, 2018, 25),
(4, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Personal Finance', 350, 1997, 20),
(5, 'The Lean Startup', 'Eric Ries', 'Business', 450, 2011, 15);

-- view all data 
select * from Book;

--  1.Add a new book: 
INSERT INTO Book (BookID, Title, Author, Genre, Price, PublishedYear, Stock) VALUES (6, 'Deep Work', 'Cal Newport', 'Self-Help', 420, 2016, 35);

--  2.Update book price: 
UPDATE Book SET Price = Price + 50 WHERE Genre = 'Self-Help';

--  3.Delete a book:
DELETE FROM Book WHERE BookID = 4;

--  4.Read all books: 
SELECT * FROM Book ORDER BY Title ASC;

--  5.Sort by Price:
SELECT * FROM Book ORDER BY Price DESC;

--  6.Filter by Genre: 
SELECT * FROM Book WHERE Genre = 'Fiction';

--  7.Filter with AND: 
SELECT * FROM Book WHERE Genre = 'Self-Help' AND Price > 400;

--  8.Filter with OR: 
SELECT * FROM Book WHERE Genre = 'Fiction' OR PublishedYear > 2000;

--  9.Total stock value:
SELECT BookID,Title,Price,Stock,(Price * Stock) AS TotalStockValue FROM Book;

--  10.Average price by Genre:
SELECT Genre, AVG(Price) AS AveragePrice FROM Book GROUP BY Genre;

--  11.Total books by author:
SELECT Author, COUNT(*) AS TotalBooks FROM Book WHERE Author = 'Paulo Coelho' GROUP BY Author;

--  12.Find books with a keyword in title:
SELECT * FROM Book WHERE Title LIKE '%The%';

--  13.Filter by multiple conditions:
SELECT * FROM Book WHERE Author = 'Yuval Noah Harari' AND Price < 600;

--  14.Find books within a price range:
SELECT * FROM Book WHERE Price BETWEEN 300 AND 500;

--  15.Top 3 most expensive books:
SELECT TOP 3 * FROM Book ORDER BY Price DESC;

--  16.Books published before a specific year:
SELECT * FROM Book WHERE PublishedYear < 2000;

--  17.Group by Genre:
SELECT Genre, COUNT(*) AS TotalBooks FROM Book GROUP BY Genre;

--  18.Find duplicate titles:
SELECT Title, COUNT(*) AS Count FROM Book GROUP BY Title HAVING COUNT(*) > 1;

--  19.Author with most books:
SELECT TOP 1 Author, COUNT(*) AS BookCount FROM Book GROUP BY Author ORDER BY BookCount DESC;

--  20.Oldest book by Genre:
SELECT * FROM Book B1
WHERE PublishedYear = (
    SELECT MIN(PublishedYear)
    FROM Book B2
    WHERE B1.Genre = B2.Genre
);
