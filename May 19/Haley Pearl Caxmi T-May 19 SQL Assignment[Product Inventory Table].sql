-- Schema Creation
CREATE TABLE ProductInventory (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    Supplier VARCHAR(100),
    LastRestocked DATE
);

-- Inserting data
INSERT INTO ProductInventory VALUES
(1, 'Laptop', 'Electronics', 20, 70000, 'TechMart', '2025-04-20'),
(2, 'Office Chair', 'Furniture', 50, 5000, 'HomeComfort', '2025-04-18'),
(3, 'Smartwatch', 'Electronics', 30, 15000, 'GadgetHub', '2025-04-22'),
(4, 'Desk Lamp', 'Lighting', 80, 1200, 'BrightLife', '2025-04-25'),
(5, 'Wireless Mouse', 'Electronics', 100, 1500, 'GadgetHub', '2025-04-30');

-- View all data
SELECT * FROM ProductInventory;

-- 1.Add a new product
INSERT INTO ProductInventory VALUES (6, 'Gaming Keyboard', 'Electronics', 40, 3500, 'TechMart', '2025-05-01');

-- 2.Update stock quantity
UPDATE ProductInventory SET Quantity = Quantity + 20 WHERE ProductName = 'Desk Lamp';

-- 3.Delete a discontinued product
DELETE FROM ProductInventory WHERE ProductID = 2;

-- 4.Read all products sorted by ProductName
SELECT * FROM ProductInventory ORDER BY ProductName ASC;

-- 5.Sort by Quantity (desc)
SELECT * FROM ProductInventory ORDER BY Quantity DESC;

-- 6.Filter by Category = Electronics
SELECT * FROM ProductInventory WHERE Category = 'Electronics';

-- 7.Filter with AND: Electronics products with Quantity > 20
SELECT * FROM ProductInventory WHERE Category = 'Electronics' AND Quantity > 20;

-- 8.Filter with OR: Electronics or UnitPrice < 2000
SELECT * FROM ProductInventory WHERE Category = 'Electronics' OR UnitPrice < 2000;

-- 9.Total stock value
SELECT SUM(Quantity * UnitPrice) AS TotalStockValue FROM ProductInventory;

-- 10.Average price by category
SELECT Category, AVG(UnitPrice) AS AvgPrice FROM ProductInventory GROUP BY Category;

-- 11.Count products by supplier = GadgetHub
SELECT COUNT(*) AS ProductCount FROM ProductInventory WHERE Supplier = 'GadgetHub';

-- 12.Products starting with 'W'
SELECT * FROM ProductInventory WHERE ProductName LIKE 'W%';

-- 13.Products from GadgetHub and UnitPrice > 10000
SELECT * FROM ProductInventory WHERE Supplier = 'GadgetHub' AND UnitPrice > 10000;

-- 14.Products with UnitPrice between 1000 and 20000
SELECT * FROM ProductInventory WHERE UnitPrice BETWEEN 1000 AND 20000;

-- 15. Top 3 most expensive products
SELECT TOP 3 * FROM ProductInventory ORDER BY UnitPrice DESC;

-- 16. Products restocked in last 10 days
SELECT * FROM ProductInventory WHERE LastRestocked >= DATEADD(DAY, -10, GETDATE());

-- 17. Group by Supplier: total quantity
SELECT Supplier, SUM(Quantity) AS TotalQuantity FROM ProductInventory GROUP BY Supplier;

-- 18. Check for low stock (Quantity < 30)
SELECT * FROM ProductInventory WHERE Quantity < 30;

-- 19. Supplier with most products
SELECT TOP 1 Supplier FROM ProductInventory GROUP BY Supplier ORDER BY COUNT(*) DESC;

-- 20. Product with highest stock value
SELECT * FROM ProductInventory WHERE Quantity * UnitPrice = (
    SELECT MAX(Quantity * UnitPrice) 
    FROM ProductInventory
);
