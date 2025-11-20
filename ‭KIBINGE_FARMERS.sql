CREATE DATABASE KIBINGE_FARMERS_DB
    DEFAULT CHARACTER SET = 'utf8mb4';

    USE KIBINGE_FARMERS_DB;

    DROP TABLE Farmer;
    CREATE TABLE Farmer (
        Farmer_ID int PRIMARY KEY,
        Name VARCHAR(35),
        Address VARCHAR(30),
        Contact_Number VARCHAR(15));
CREATE Table Crop(
        Crop_ID INT PRIMARY KEY,
        Crop_Name VARCHAR(20),
        Type VARCHAR(15),
        Season VARCHAR(10));

        CREATE TABLE Farmer_Crop(
                Farmer_Crop_ID INT PRIMARY KEY,
                Farmer_ID INT,
                Crop_ID INT,
                Area_Cultivated DECIMAL(10,2),
                Yield DECIMAL(10,2)
        );

        DROP TABLE Market;
        CREATE Table Market(
                Market_ID  INT PRIMARY KEY,
                Market_Name VARCHAR(30),
                Location VARCHAR(15)
        );
        DROP TABLE Sales_Transaction;
        CREATE TABLE Sales_Transaction(
                Transaction_ID INT PRIMARY KEY,
                Farmer_Crop_ID INT,
                Market_ID INT,
                Date DATE,
                Quantity_Sold DECIMAL(10,2),
                Price_Per_Unit DECIMAL(10,2),
                Total_Amount DECIMAL(10,2));
                

                INSERT INTO Farmer (Farmer_ID, Name, Address, Contact_Number)
                VALUES
                (1, "Johhn Kyambadde", "Kibinge Village", "+256700111111" ),
                (2, "Sarah Nambi", "Kiwangala Town", "+256700222222"),
                (3, "Paul Okello", "Lwengo District", "+256700333333");

                INSERT INTO Crop ( Crop_ID, Crop_Name,Type, Season )
                VALUES
                (101, "Coffee", "Cash Crop", "Rainy"),
                (102, "Maize", "Food Crop", "Dry"),
                (103, "Beans", "Food Crop", "Rainy");

                INSERT INTO Market(Market_ID, Market_Name, Location)
                 VALUES
                 (201, "Kibinge Market", "Kibinge"),
                 (202, "Masaka Centeral Market", "Masaka"),
                 (203, "Lwengo Farmers Market", "Lwengo");

                 INSERT INTO Farmer_Crop(Farmer_Crop_ID, Farmer_ID, Crop_ID, Area_Cultivated, Yield)
                  VALUES
                  (1,1,101,5,1000),
                  (2,1,102,3.5,700),
                  (3,3,103,2,400);

                  INSERT INTO Sales_Transaction (Transaction_ID, Farmer_Crop_ID, Market_ID, Date, Quantity_Sold, Price_Per_Unit, Total_Amount)
                   VALUES
                   (301, 1, 201, 2024-01-15, 500, 3, 1500),
                   (302, 2, 202, 2024-02-10, 300, 2.5, 750),
                   (303, 1, 203, 2024-03-05, 150, 4, 600);

CREATE VIEW view2b
AS 
SELECT * FROM Crop WHERE Type LIKE 'F%'; 

CREATE VIEW view2c AS
SELECT
    FC.Farmer_ID,
    SUM(ST.Total_Amount) AS Total_Collection
FROM
    Sales_transaction AS ST
JOIN
    Farmer_crop AS FC
    ON ST.Farmer_Crop_ID = FC.Farmer_Crop_ID
GROUP BY
    FC.Farmer_ID;
CREATE VIEW view2d
SELECT 
F.Name
FROM Farmer
JOIN
    Crop AS C
ON
    Farmer.Name = C.Crop_Name;

DROP VIEW view2c;
CREATE OR REPLACE VIEW view2d AS
SELECT
    F.Name AS Farmer_Name,
    C.Crop_Name
FROM
    Farmer_crop AS FC
JOIN
    Farmer AS F
    ON FC.Farmer_ID = F.Farmer_ID
JOIN
    Crop AS C
    ON FC.Crop_ID = C.Crop_ID;

    CREATE VIEW 3a AS
    SELECT DISTINCT
    Type 
    FROM crop
    ORDER BY Type ASC;

    ALTER  TABLE Farmer ADD COLUMN Email VARCHAR(50);


