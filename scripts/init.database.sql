/*
the script creates a new datawarehouse after checking if it already exists, if the database exists it is dropped and recreated 
*/


USE master;
GO

--drop and recreate the the 'DataWarehouse' db
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
Begin
	ALTER DATABASE DataWarehouse SET  SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--create 'DataWarehouse' db
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--create schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
