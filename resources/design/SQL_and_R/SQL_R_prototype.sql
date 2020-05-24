USE [AdventureWorksLT2017]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE OR ALTER VIEW [SalesLT].[vUSCustomers]
--WITH SCHEMABINDING 
AS 
-- Returns the CustomerID, first name, and last name for the specified customer.
WITH selectCustomers([CompanyName],
                     [CustomerName],
                     [CustomerID],   
                     [Customer_Address1], 
                     [Customer_Address2],
                     [State]) AS 
(
   SELECT 
      a.CompanyName
     ,a.LastName + ' ' + a.FirstName + ' ' + a.MiddleName AS CustomerName 
     ,a.CustomerID
     ,c.AddressLine1
     ,c.AddressLine2
     ,c.StateProvince
   FROM 
                 SalesLT.Customer a
      INNER JOIN SalesLT.CustomerAddress b 
      ON         a.CustomerID = b.CustomerID
      INNER JOIN SalesLT.Address c
      ON         b.AddressID = c.AddressID
   WHERE 
      c.CountryRegion = 'United States'                  
)
SELECT 
   sc.CompanyName
  ,sc.CustomerName
  ,sc.CustomerID
  ,sc.Customer_Address1
  ,sc.Customer_Address2
  ,sc.State
FROM 
   selectCustomers sc
GO

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE OR ALTER VIEW [SalesLT].[vUSCustomerOrders]
--WITH SCHEMABINDING 
AS 
WITH USCustomerOrders([CompanyName],
                      [CustomerName],
                      [CustomerID],   
                         [State],
                      [OrderDate],
                      [TotalDue] 
                     ) AS 
(
   SELECT 
      a.CompanyName
     ,a.CustomerName 
     ,a.CustomerID
     ,a.State
     ,b.OrderDate
     ,b.TotalDue
   FROM 
                 SalesLT.vUSCustomers a
      INNER JOIN SalesLT.SalesOrderHeader b 
      ON         a.CustomerID = b.CustomerID
)
SELECT 
   CompanyName
  ,CustomerName
  ,CustomerID
  ,State
  ,OrderDate
  ,TotalDue
FROM 
   USCustomerOrders
GO

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE OR ALTER VIEW [SalesLT].[vSpecialUSCustomers]
--WITH SCHEMABINDING 
AS 
-- Returns the CustomerID, first name, and last name for the specified customer.
WITH selectCustomers([CompanyName],
                     [CustomerName],
                     [CustomerID],   
                     [Customer_Address1], 
                     [Customer_Address2],
					 [State]) AS 
(
   SELECT 
      a.CompanyName
     ,a.LastName + ' ' + a.FirstName + ' ' + a.MiddleName AS CustomerName 
     ,a.CustomerID
     ,c.AddressLine1
     ,c.AddressLine2
	 ,c.StateProvince
   FROM 
                 SalesLT.Customer a
      INNER JOIN SalesLT.CustomerAddress b 
      ON         a.CustomerID = b.CustomerID
      INNER JOIN SalesLT.Address c
      ON         b.AddressID = c.AddressID
   WHERE 
          a.CompanyName like 'A%' 
      AND c.CountryRegion = 'United States'				  
UNION ALL
   SELECT 
      a.CompanyName
     ,a.LastName + ' ' + a.FirstName + ' ' + a.MiddleName AS CustomerName 
     ,a.CustomerID
     ,c.AddressLine1
     ,c.AddressLine2
	 ,c.StateProvince
   FROM 
                 SalesLT.Customer a
      INNER JOIN SalesLT.CustomerAddress b 
      ON         a.CustomerID = b.CustomerID
      INNER JOIN SalesLT.Address c
      ON         b.AddressID = c.AddressID
   WHERE 
          a.CompanyName like 'Z%'  
      AND c.CountryRegion = 'United States'		   
)
SELECT 
   sc.CompanyName
  ,sc.CustomerName
  ,sc.CustomerID
  ,sc.Customer_Address1
  ,sc.Customer_Address2
  ,sc.State
FROM 
   selectCustomers sc
GO

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE OR ALTER VIEW [SalesLT].[vSpecialUSCustomerOrders]
--WITH SCHEMABINDING 
AS 
WITH CustomerOrders([CompanyName],
                     [CustomerName],
                     [CustomerID],   
					 [State],
					 [OrderDate],
					 [TotalDue] 
					 ) AS 
(
   SELECT 
      a.CompanyName
     ,a.CustomerName 
     ,a.CustomerID
	 ,a.State
	 ,b.OrderDate
	 ,b.TotalDue
   FROM 
                 SalesLT.vSpecialUSCustomers a
      INNER JOIN SalesLT.SalesOrderHeader b 
      ON         a.CustomerID = b.CustomerID
)
SELECT 
   CompanyName
  ,CustomerName
  ,CustomerID
  ,State
  ,OrderDate
  ,TotalDue
FROM 
   CustomerOrders
GO

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE OR ALTER VIEW [SalesLT].[vGetAllCategories]
--WITH SCHEMABINDING 
AS 
-- Returns the CustomerID, first name, and last name for the specified customer.

WITH CategoryCTE([ParentProductCategoryID], [ProductCategoryID], [Name]) AS 
(
	SELECT [ParentProductCategoryID], [ProductCategoryID], [Name]
	FROM SalesLT.ProductCategory
	WHERE ParentProductCategoryID IS NULL

UNION ALL

	SELECT C.[ParentProductCategoryID], C.[ProductCategoryID], C.[Name]
	FROM SalesLT.ProductCategory AS C
	INNER JOIN CategoryCTE AS BC ON BC.ProductCategoryID = C.ParentProductCategoryID
)

SELECT PC.[Name] AS [ParentProductCategoryName], CCTE.[Name] as [ProductCategoryName], CCTE.[ProductCategoryID]  
FROM CategoryCTE AS CCTE
JOIN SalesLT.ProductCategory AS PC 
ON PC.[ProductCategoryID] = CCTE.[ParentProductCategoryID]

GO

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE OR ALTER PROCEDURE [dbo].[pSpecialUSCustomers] 
    @state nvarchar(50) 
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
	   * 
	FROM 
	   SalesLT.vUSCustomerOrders 
	WHERE 
	   STATE = @state
END;
GO

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE OR ALTER PROCEDURE [dbo].[pSpecialUSCompany] 
    @company_name nvarchar(128),
    @state nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
       * 
    FROM 
       SalesLT.vUSCustomerOrders
    WHERE 
       CompanyName = @company_name
       AND
       State = @state
END;
GO
