
--1

BEGIN
	SELECT HumanResources.EmployeePayHistory.BusinessEntityID, FirstName, LastName, Rate
	FROM HumanResources.EmployeePayHistory INNER JOIN Person.Person
	ON HumanResources.EmployeePayHistory.BusinessEntityID = Person.Person.BusinessEntityID
	WHERE Rate < (SELECT AVG(Rate)FROM HumanResources.EmployeePayHistory);
END;
GO


--2

CREATE OR ALTER FUNCTION shipping_date(@SalesID INT) RETURNS DATETIME
AS
BEGIN
	DECLARE @date DATETIME;
	SELECT @date = ShipDate FROM Sales.SalesOrderHeader WHERE SalesOrderID = @SalesID;

	RETURN @date
END;
GO


DECLARE @SalesID INT = 43888;
SELECT @SalesID AS SalesID, dbo.shipping_date(@SalesID) AS ShippedDate;


--3

GO 
CREATE OR ALTER PROCEDURE print_id_num_av(@name VARCHAR(30))
AS
BEGIN
	DECLARE @id INT= (SELECT ProductID FROM Production.Product WHERE Name = @name);
	DECLARE @amount INT = (SELECT SUM(Quantity) FROM Production.ProductInventory WHERE ProductID = @id);
	SELECT ProductID, Name, ProductNumber, @amount AS Amount FROM Production.Product WHERE Name = @name;
END;
GO


DECLARE @name VARCHAR(30) = 'Adjustable Race';
EXEC print_id_num_av @name;


--4

GO
CREATE OR ALTER FUNCTION card_num(@order_num INT) RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @num VARCHAR(20);

	SELECT @num = Sales.CreditCard.CardNumber 
	FROM Sales.CreditCard INNER JOIN Sales.SalesOrderHeader 
	ON Sales.CreditCard.CreditCardID = Sales.SalesOrderHeader.CreditCardID 
	WHERE Sales.SalesOrderHeader.SalesOrderID = @order_num;

	RETURN @num
END;
GO


DECLARE @order_num INT =  43888;
SELECT @order_num AS OrderNum, dbo.card_num(@order_num) AS CreditCardNum;


--5

GO
CREATE OR ALTER PROCEDURE division(@num1 FLOAT, @num2 FLOAT)
AS 
BEGIN
	DECLARE @result FLOAT;

	IF @num1 < @num2
		SELECT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe' AS Warning;
		ELSE
		BEGIN
			SET @result = @num1/@num2 
			SELECT @result AS Result
		END;
END;
GO
DECLARE @num1 FLOAT = 30;
DECLARE @num2 FLOAT = 9;
EXEC  division @num1, @num2;


--6

GO
CREATE OR ALTER PROCEDURE person_days_off(@preson_id VARCHAR(20))
AS
BEGIN
	SELECT JobTitle, VacationHours/8 AS VacationDays, SickLeaveHours/8 AS SickLeaveDays
	FROM AdventureWorks2019.HumanResources.Employee
	WHERE NationalIDNumber = @preson_id; 
END;
GO


DECLARE @id VARCHAR(20);
SET @id = 264306399
EXEC person_days_off @id;


--7

GO
CREATE OR ALTER PROCEDURE currency_calc(@amount FLOAT, @curr_code1 VARCHAR(4), @curr_code2 VARCHAR(4), @date DATETIME)
AS
BEGIN
	DECLARE @rate FLOAT;
	DECLARE @result FLOAT;
	IF @curr_code1 = 'USD'
		BEGIN
			SELECT @rate = AverageRate FROM Sales.CurrencyRate WHERE ToCurrencyCode = @curr_code2 AND CurrencyRateDate = @date;
			SET @result = @rate * @amount;
		END;
	ELSE
		BEGIN
			SELECT @rate = AverageRate FROM Sales.CurrencyRate WHERE ToCurrencyCode = @curr_code1 AND CurrencyRateDate = @date;
			SET @result = @amount/@rate;
		END;
	SELECT @amount AS Amount, @curr_code1 AS FromCurrency, @curr_code2 AS ToCurrency, ROUND(@result, 2) AS Result;
END;
GO

DECLARE @curr_code1 VARCHAR(4) = 'USD';
DECLARE @curr_code2 VARCHAR(4) = 'EUR';
DECLARE @amount FLOAT = 1000;
DECLARE @date DATETIME = '2014-05-31 00:00:00.000'
EXEC currency_calc @amount, @curr_code1, @curr_code2, @date;