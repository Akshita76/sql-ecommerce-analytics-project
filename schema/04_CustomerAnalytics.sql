use EcommerceAnalytics;
CREATE VIEW CustomerAnalytics AS
SELECT
    c.CustomerID,
    c.City,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSpend,
    MIN(o.OrderDate) AS FirstOrderDate,
    MAX(o.OrderDate) AS LastOrderDate,
    DATEDIFF(DAY, MAX(o.OrderDate), GETDATE()) AS DaysSinceLastOrder,
    CASE
        WHEN DATEDIFF(DAY, MAX(o.OrderDate), GETDATE()) > 90
             AND COUNT(DISTINCT o.OrderID) >= 3
        THEN 1 ELSE 0
    END AS IsChurnRisk,
    CASE
        WHEN SUM(oi.Quantity * oi.UnitPrice) >= 10000 THEN 'High'
        WHEN SUM(oi.Quantity * oi.UnitPrice) >= 5000 THEN 'Medium'
        ELSE 'Low'
    END AS ValueSegment
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN OrderItems oi ON o.OrderID = oi.OrderID
GROUP BY c.CustomerID, c.City;
