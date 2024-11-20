USE AWDataMart2022
go


-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  NAME = 'dim_territory'
            )
  DROP TABLE dim_territory

go

CREATE TABLE dim_territory
  (
     territory_key      INT NOT NULL IDENTITY(1, 1),
     territory_id       INT NOT NULL,
     territory_name     NVARCHAR(50),
     territory_group    NVARCHAR(50),
     source_system_code TINYINT NOT NULL,
     CONSTRAINT pk_dim_territory PRIMARY KEY CLUSTERED (territory_key)
  );

-- Insert unknown record
SET IDENTITY_INSERT dim_territory ON

INSERT INTO dim_territory
            (territory_key,
             territory_id,
             territory_name,
             territory_group,
             source_system_code
            )
VALUES     (0,
            0,
            'Unknown',
            'Unknown',
            0
            )

SET IDENTITY_INSERT dim_territory OFF


-- create indexes
CREATE INDEX dim_territory_territory_id
  ON dim_territory(territory_id); 
