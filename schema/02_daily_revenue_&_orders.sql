SELECT
    o.OrderDate,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(oi.Quantity * oi.UnitPrice) AS DailyRevenue,
    ROUND(
        SUM(oi.Quantity * oi.UnitPrice) * 1.0 /
        COUNT(DISTINCT o.OrderID),
        2
    ) AS AvgOrderValue
FROM dbo.Orders o
JOIN dbo.OrderItems oi
    ON o.OrderID = oi.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY o.OrderDate
ORDER BY o.OrderDate;
