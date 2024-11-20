Alhamdulillah ❤️❤️
My Lates Project : Sales Data Mart 

Objective: Develop a sales data mart based on the Adventure Works database to support analytical reporting and decision-making.

Key Steps:
1- Business Process Identification:
Focused on the "Sales" process, which encompasses the sale of items to customers.

2- Granularity Definition:
Determined that each row in the fact table represents an individual item sold in a transaction.

3- Fact Identification:
Selected key metrics to analyze, including:
Quantity of items sold
Unit price of each item
Line total (quantity × unit price)
Tax amount
Freight charges
Total due amount

4- Dimension Identification:
Defined the following dimensions:
Time: When the item was sold
Product: Details of the sold product
Store/Territory: The region where the sale occurred
Customer: Information about the purchaser

5- Fact Table Design:
Created a fact table with the following structure:
Keys: Sales order ID, line number, product key, customer key, territory key, order date key, ship date key, due date key
Metrics: Quantity, unit price, line total, tax amount, freight, total due

6- Dimension Table Design:
Designed dimension tables for Product, Customer, Territory, and Dates. Each dimension table includes attributes relevant to the dimension and supports Slowly Changing Dimensions (SCD) Type 2 to track historical changes with start and end dates.

7- Relationship Establishment:
Defined relationships between the fact table and dimension tables via foreign keys. For instance, the product key in the fact table links to the product dimension table.

8- Data Extraction and Loading:
Extracted and loaded relevant data from the Adventure Works database into the fact and dimension tables.

9- Testing and Validation:
Conducted rigorous testing to ensure data integrity and accuracy. Sample queries were executed, such as calculating total dues for specific products in designated territories, to verify the correctness of the data mart's outputs.
