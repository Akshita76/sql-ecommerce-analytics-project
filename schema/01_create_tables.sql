use [EcommerceAnalytics];
/* Customer Table*/
CREATE TABLE dbo.Customers(
CustomerID int Primary key,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100) Unique,
City varchar(50),
CreatedDate Date
)
/*Product Table*/
create table dbo.Products
(
ProductId INT Primary key,
ProductName varchar(100) NOT Null,
Category varchar(50) NOT Null,
CostPrice Decimal(10,2) NOT Null,
SellingPrice decimal(10,2) NOT Null,
LaunchDate Date Null,
Constraint CK_Products_Price Check (SellingPrice>=CostPrice)
)
/* Orders Table*/
create table dbo.Orders(
OrderID INT Primary Key,
CustomerID int Not null References dbo.Customers(CustomerID),
OrderDate date not null,
OrderStatus Varchar(50) not null,
Constraint CK_Orders_Status Check (OrderStatus in ('Completed','Cancelled','Returned'))
)
/* OrderItems Table*/
Create table dbo.OrderItems
(
OrderItemID int identity (1,1) Primary Key,
OrderID int not null references dbo.Orders(OrderID),
ProductID int not null references dbo.Products(ProductID),
Quantity Int not null,
UnitPrice Decimal(10,2) not null,
constraint ck_OrderItems_quantity check (Quantity>0),
constraint ck_OrderItems_UnitPrice check (Quantity>0),
)
/*Indexes*/
Create INDEX IX_Orders_OrderDate
on dbo.Orders(OrderDate);

Create INDEX IX_Orders_CustomerID
on dbo.Orders(CustomerID);
Go;
Create INDEX IX_OrderItems_OrderID
on dbo.OrderItems(OrderID);
Go;
Create INDEX IX_OrderItems_ProductID
on dbo.OrderItems(ProductID);
Go;

