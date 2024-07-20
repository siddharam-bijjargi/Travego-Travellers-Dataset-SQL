CREATE DATABASE IF NOT EXISTS Travego_travellers;
USE Travego_travellers;

DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS Price_0;

CREATE TABLE Passenger (
       Passenger_id INT,
       Passenger_name VARCHAR(20),
       Category VARCHAR(20),
       Gender VARCHAR(20),
       Boarding_city VARCHAR(20),
       Destination_city VARCHAR(20),
       Distance INT,
       Bus_Type VARCHAR(20)
       );
 
 
 INSERT INTO Passenger(Passenger_id, Passenger_name, Category, Gender, Boarding_city, Destination_city, Distance, Bus_Type )
 VALUES
    (1, 'Sejal', 'AC', 'F', 'Bangaluru', 'Chennai', 350, 'Sleeper'),
    (2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
    (3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
    (4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
    (5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
    (6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
    (7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
    (8, 'Manish', 'Non-AC', 'M', 'Hydrabad', 'Bangaluru', 500, 'Sitting'),
    (9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 500, 'Sitting');
    
       
    SELECT * FROM Passenger;
    
    
 CREATE TABLE Price_0 (
        id INT,
        Bus_type VARCHAR(20),
        Distance INT,
        Price_1 INT
        );
        

 
INSERT INTO Price_0 (id, Bus_type, Distance, Price_1)
VALUES
      (1, 'Sleeper', 350, 770),
      (2, 'Sleeper', 500, 1100),
      (3, 'Sleeper', 600, 1320),
      (4, 'Sleeper', 700, 1540),
      (5, 'Sleeper', 1000, 2200),
      (6, 'Sleeper', 1200, 2640),
      (7, 'Sleeper', 1500, 2700),
      (8, 'Sitting', 500, 620),
      (9, 'Sitting', 600, 744),
      (10, 'Sitting', 700, 868),
      (11, 'Sitting', 1000, 1240),
      (12, 'Sitting', 1200, 1488),
      (13, 'Sitting', 1500, 1860);      
      
      
 SELECT * FROM Price_0;
 
#a.How many female passengers traveled a minimum distance of 600KMs?
 SELECT * FROM Passenger WHERE Distance <= 600 && Gender = 'F';

#b.Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
SELECT * FROM Passenger WHERE Distance > 500 && Bus_type = 'Sleeper';

#c.Select passenger names whos names start with the character'S'.
SELECT * FROM Passenger WHERE Passenger_name LIKE 'S%';

#d.Calculate the price charged for each passenger,displaying the Passenger name,Boarding City,Destination City, Bustype,and Price in the output.
SELECT Passenger.Passenger_id, Passenger.Passenger_name, Passenger.Boarding_city, Passenger.Destination_city, Price_0.Price_1
FROM Passenger
LEFT JOIN Price_0 ON Passenger.Distance=Price_0.Distance && Passenger.Bus_Type=Price_0.Bus_type;

#e. What are the passenger name(s) and the ticket price for those who traveled 1000Kms sitting in a bus?
 SELECT Passenger.Passenger_name, Passenger.Distance, Passenger.Bus_Type, Price_0.Price_1 
 FROM Passenger 
 LEFT JOIN Price_0 ON Passenger.Bus_Type=Price_0.Bus_type && Passenger.Distance=Price_0.Distance WHERE Passenger.Distance=1000;
 
#f. What will be the Sitting and sleeper bus charge for Pallavi to travel from Panaji to Bangaluru?
SELECT Passenger.Passenger_name, Passenger.Boarding_city, Passenger.Destination_city, Price_0.Price_1
FROM Passenger
LEFT JOIN Price_0 ON Passenger.Bus_Type=Price_0.Bus_type  && Passenger.Distance=Price_0.Distance WHERE Passenger.Passenger_name='Pallavi';

#g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper?
 UPDATE Passenger SET Category = 'Sleeper' WHERE Category = 'Non-AC'; 
 SELECT * FROM Passenger;

#h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
DELETE FROM Passenger WHERE Passenger_id=9;
SELECT * FROM Passenger;

#i. Truncate the table passenger and comment on the number of rows in the table.
TRUNCATE TABLE Passenger;
SELECT COUNT(*) FROM passenger;

#j. Delete the table passenger from the database.
DROP TABLE passenger;
SELECT * FROM Passenger;
