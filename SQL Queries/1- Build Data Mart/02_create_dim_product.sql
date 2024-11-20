USE AWDataMart2022

go

if exists(select 
				name
			from 
				sys.tables
			where
				name = 'dim_product'
		)
	
		drop table dim_product
	

CREATE TABLE dim_product
	(
		product_key         INT NOT NULL IDENTITY(1, 1),-- surrogate key
		product_id          INT NOT NULL,--business key ,  PK of the Source Table
		product_name        NVARCHAR(50),
		product_subcategory NVARCHAR(50),
		product_category    NVARCHAR(50),
		color               NVARCHAR(15),
     
		reorder_point       SMALLINT,
		standard_cost       MONEY,
		-- Metadata
		source_system_code  TINYINT NOT NULL,
		-- SCD
		start_date          DATETIME NOT NULL DEFAULT (Getdate()),
		end_date            DATETIME NULL,
		modified_date       DATETIME NULL,
		is_current          TINYINT NOT NULL DEFAULT (1),
		CONSTRAINT pk_dim_product PRIMARY KEY CLUSTERED (product_key)
	);
	
-- Insert unknown record
SET IDENTITY_INSERT dim_product ON

INSERT INTO dim_product
            (product_key,
             product_id,
             product_name,
             product_subcategory,
             product_category,
             color,
             reorder_point,
             standard_cost,
             source_system_code,
             start_date,
             end_date,
			 modified_date,
             is_current)
VALUES      (0,
             0,
             'Unknown',
             'Unknown',
             'Unknown',
             'Unknown',
             0,
             0,
             0,
             '1900-01-01',
             NULL,
			 NULL,
             1)

SET IDENTITY_INSERT dim_product OFF

-- create indexes
CREATE INDEX dim_product_product_id
  ON dim_product(product_id);

CREATE INDEX dim_prodct_product_category
  ON dim_product(product_category); 
