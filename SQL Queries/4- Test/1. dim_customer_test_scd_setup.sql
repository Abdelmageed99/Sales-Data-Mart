USE AWDataMart2022
go

-- update city for ~10% in dim_customer 
UPDATE dim_customer 
SET    city = 'cairo' 
WHERE  city = 'paris'; 

-- update phone number 
UPDATE dim_customer 
SET    phone = Substring(phone, 10, 3) 
               + Substring(phone, 4, 5) + Substring(phone, 9, 1) 
               + Substring(phone, 1, 3) 
WHERE  Len(phone) = 12 
       AND LEFT(phone, 3) BETWEEN '101' AND '125'; 



