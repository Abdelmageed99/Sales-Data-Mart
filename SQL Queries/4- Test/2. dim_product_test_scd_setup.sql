USE AWDataMart2022;
go

-- update product color 
UPDATE dim_product SET color = 'Dark-Green' 
WHERE product_key % 10 = 3
;

-- update reorder_point by adding 10% to the original value
UPDATE dim_product SET reorder_point = ROUND(reorder_point * 1.1,0)
WHERE product_key % 10 = 4
;
