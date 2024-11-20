SELECT
	c.customerID AS customer_id,
	CAST( 
		(ISNULL(p.FirstName, '') +' ' + ISNULL(p.MiddleName, '') +' '+ ISNULL(p.LAStName, '') ) 
	AS NVARCHAR(150)) AS customer_name,
	a2.AddressLine1 AS address1,
	a2.City,
	pp.PhoneNumber AS phone
FROM Sales.Customer c
	left join Person.Person AS p
		on p.BusinessEntityID = c.PersonID 
	LEFT JOIN Person.BusinessEntityAddress AS a1 
		ON p.BusinessEntityID = a1.BusinessEntityID 
	LEFT JOIN Person.Address AS a2 
		ON a2.AddressID = a1.AddressID 
	LEFT JOIN Person.PersonPhone AS pp
		ON p.BusinessEntityID = pp.BusinessEntityID
