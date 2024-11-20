USE AWDataMart2022

go

IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_sales')
  DROP TABLE fact_sales;

CREATE TABLE fact_sales
  (
     sales_order_id VARCHAR(50) NOT NULL,
     line_number    INT NOT NULL,

	 product_key    INT NOT NULL,
     customer_key   INT NOT NULL,
     territory_key  INT NOT NULL,

     order_date_key INT NOT NULL,
	 ship_date_Key  INT NOT NULL,
	 due_date_key   INT NOT NULL,

     quantity       INT,
	 unit_price     Money,
     line_total     MONEY,

     tax_amount     MONEY,
     freight        MONEY,
	 total_due      Money,
     
     created_at     DATETIME NOT NULL DEFAULT(Getdate()),
     CONSTRAINT pk_fact_sales PRIMARY KEY CLUSTERED (sales_order_id, line_number
     ),
     CONSTRAINT fk_fact_sales_dim_product FOREIGN KEY (product_key) REFERENCES
     dim_product(product_key),
     CONSTRAINT fk_fact_sales_dim_customer FOREIGN KEY (customer_key) REFERENCES
     dim_customer(customer_key),
     CONSTRAINT fk_fact_sales_dim_territory FOREIGN KEY (territory_key)
     REFERENCES dim_territory(territory_key),
     CONSTRAINT fk_fact_sales_dim_date FOREIGN KEY (order_date_key) REFERENCES
     dim_date(date_key)
  );

-- Create Indexes
CREATE INDEX fact_sales_dim_product
  ON fact_sales(product_key);


CREATE INDEX fact_sales_dim_customer
  ON fact_sales(customer_key);


CREATE INDEX fact_sales_dim_territory
  ON fact_sales(territory_key);


CREATE INDEX fact_sales_dim_date
  ON fact_sales(order_date_key); 
