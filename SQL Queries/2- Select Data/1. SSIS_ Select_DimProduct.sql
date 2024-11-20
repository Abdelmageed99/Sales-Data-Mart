use AdventureWorks2022
go

select 
	p.ProductID , 
	p.Name as Product, 
	sc.Name as SubCategory, 
	c.Name as Category, 
	p.StandardCost as standerd_cost,
	p.Color as color,
	p.ReorderPoint as reorder_point
FROM
	Production.Product p 
	left JOIN Production.ProductSubcategory sc
		on sc.ProductSubcategoryID = p.ProductSubcategoryID
    left JOIN Production.ProductCategory c 
		on c.ProductCategoryID = sc.ProductCategoryID