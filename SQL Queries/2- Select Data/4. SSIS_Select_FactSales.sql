--create FactSales
select 
	od.SalesOrderID, 
	od.SalesOrderDetailID,

	od.ProductID,
	o.CustomerID,
	o.TerritoryID, 
	
	o.OrderDate,
	o.ShipDate, 
	o.DueDate, 
	
	od.OrderQty, 
	od.UnitPrice,
	od.LineTotal ,
	
	
	CAST((od.LineTotal / o.SubTotal) * o.TaxAmt AS DECIMAL(8, 2)) as TaxAmount,
	CAST((od.LineTotal / o.SubTotal) * o.Freight AS DECIMAL(8, 2)) as Freight ,
	CAST((od.LineTotal / o.SubTotal) * o.TotalDue AS DECIMAL(8, 2)) as TotalDue
from 
	Sales.SalesOrderDetail od
	inner join Sales.SalesOrderHeader o
		on o.SalesOrderID = od.SalesOrderID
where 
	od.ModifiedDate > ? AND od.ModifiedDate < ?
