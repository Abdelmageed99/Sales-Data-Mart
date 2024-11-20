USE AWDataMart2022

go

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_customer')
  DROP TABLE dim_customer

go

CREATE TABLE dim_customer
  (
     customer_key       INT NOT NULL IDENTITY(1, 1),
     customer_id        INT NOT NULL,
     customer_name      NVARCHAR(150),
     address1           NVARCHAR(100),
     city               NVARCHAR(30),
     phone              NVARCHAR(25),
     source_system_code TINYINT NOT NULL,
     start_date         DATETIME NOT NULL DEFAULT (Getdate()),
     end_date           DATETIME NULL,
	 
     is_current         TINYINT NOT NULL DEFAULT (1),
     CONSTRAINT pk_dim_customer PRIMARY KEY CLUSTERED (customer_key)
  );

-- Insert unknown record
SET IDENTITY_INSERT dim_customer ON

INSERT INTO dim_customer
            (customer_key,
             customer_id,
             customer_name,
             address1,
          
             city,
             phone,
             source_system_code,
             start_date,
             end_date,
			
             is_current)
VALUES      (0,
             0,
             'Unknown',
     
             'Unknown',
             'Unknown',
             'Unknown',
             0,
             '1900-01-01',
             NULL,
		
             1 )

SET IDENTITY_INSERT dim_customer OFF

-- Create Indexes
CREATE INDEX dim_customer_customer_id
  ON dim_customer(customer_id);

CREATE INDEX dim_customer_city
  ON dim_customer(city); 