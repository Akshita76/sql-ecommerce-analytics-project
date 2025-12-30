WITH MonthlyRevenue AS (
    SELECT
        FORMAT(o.OrderDate, 'yyyy-MM') AS Month,
        SUM(oi.Quantity * oi.UnitPrice) AS Revenue
    FROM Orders o
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    WHERE o.OrderStatus = 'Completed'
    GROUP BY FORMAT(o.OrderDate, 'yyyy-MM')
)
SELECT
    Month,
    Revenue,
    LAG(Revenue) OVER (ORDER BY Month) AS PrevMonthRevenue,
    ROUND(
        (Revenue - LAG(Revenue) OVER (ORDER BY Month)) * 100.0 /
        NULLIF(LAG(Revenue) OVER (ORDER BY Month), 0),
        2
    ) AS MoM_Growth_Percent
FROM MonthlyRevenue;
