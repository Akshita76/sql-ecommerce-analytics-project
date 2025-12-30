use EcommerceAnalytics;
INSERT INTO dbo.Customers
    (CustomerID, FirstName, LastName, Email, City, CreatedDate)
VALUES
    (1, 'Akshita', 'Sharma', 'akshita@gmail.com', 'Delhi', '2023-01-10'),
    (2, 'Rahul', 'Verma', 'rahul@gmail.com', 'Mumbai', '2023-02-05'),
    (3, 'Priya', 'Singh', 'priya@gmail.com', 'Bangalore', '2023-02-20'),
    (4, 'Amit', 'Patel', 'amit@gmail.com', 'Ahmedabad', '2023-03-15'),
    (5, 'Neha', 'Kapoor', 'neha@gmail.com', 'Pune', '2023-04-01');

    
    INSERT INTO dbo.Orders
    (OrderID, CustomerID, OrderDate, OrderStatus)
VALUES
    (1001, 1, '2023-04-10', 'Completed'),
    (1002, 2, '2023-04-12', 'Completed'),
    (1003, 3, '2023-04-15', 'Cancelled'),
    (1004, 1, '2023-05-01', 'Completed'),
    (1005, 4, '2023-05-05', 'Returned'),
    (1006, 5, '2023-05-10', 'Completed');

    INSERT INTO dbo.OrderItems
    (OrderID, ProductID, Quantity, UnitPrice)
VALUES
    (1001, 101, 1, 899.00),
    (1001, 105, 2, 299.00),
    (1002, 102, 1, 3999.00),
    (1003, 103, 1, 2999.00),
    (1004, 104, 1, 6999.00),
    (1005, 101, 1, 899.00),
    (1006, 103, 2, 2999.00);


SELECT 
    (SELECT COUNT(*) FROM dbo.Customers)  AS Customers,
    (SELECT COUNT(*) FROM dbo.Products)   AS Products,
    (SELECT COUNT(*) FROM dbo.Orders)     AS Orders,
    (SELECT COUNT(*) FROM dbo.OrderItems) AS OrderItems;
