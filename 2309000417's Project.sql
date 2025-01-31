/*                                    Energy Consumption Management System Project
                                              By NHIAL NHIAL LUKA DENG 
											 	 Reg No: 2309000417 
												University Of Kigali
                                                   Musanze Campus
				----------------------------------------------------------------------------------------

*/

-- create the database
create database Energy_Consumption_Management_System;

show databases;

-- DCL: Create user and grant privileges
CREATE USER 'Nhial_Luka'@'127.0.0.1' IDENTIFIED BY '2309000417';
grant all privileges on cardealership.* to 'Nhial_Luka'@'127.0.0.1';

flush privileges;



-- Use database 
Use Energy_Consumption_Management_System;



-- create user table to store user information.
create table Users (
User_ID INT AUTO_INCREMENT PRIMARY KEY,
User_Name varchar(50) not null,
User_Email varchar(50) not null,
User_Password varchar(100) not null
);


-- create DeviceTypes table to categorize devices.
create table DeviceTypes (
DeviceType_ID int auto_increment primary key,
DeviceType_Name varchar(100) not null
);

-- create Devices table to track devices being monitored.
create table Devices (
Device_ID int auto_increment primary key,
Device_Name varchar(50) not null,
DeviceType_ID int,
User_ID int,
foreign key (User_ID) REFERENCES Users(User_ID),
foreign key  (DeviceType_ID) references DeviceTypes(DeviceType_ID)
);


-- Create EnergyConsumption table to record energy usage.
create table EnergyConsumption (
Record_ID int auto_increment primary key,
Device_ID int,
ConsumptionDate datetime not null,
EnergyUsed float not null,
foreign key (Device_ID) references Devices(Device_ID)
);


-- create Tips table to store energy-saving tips.
create table Tips (
Tip_ID int auto_increment primary key,
TipDescription text not null
);

-- create UserPreferences table to store user-specific preferences.
create table UserPreferences (
Preference_ID int auto_increment primary key,
Preference_Name varchar(50) not null,
Preference_Value varchar(50) not null,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);


-- create Alerts table to manage user notifications.
create table Alerts (
Alert_ID int auto_increment primary key,
Alert_Message text not null,
Alert_Date datetime not null,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);


-- create Reports table to store generated reports.
create table Reports (
Report_ID int auto_increment primary key,
Report_Date datetime not null,
Report_Content text not null,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);


-- create DeviceEnergyRatings table to store energy ratings.
create table DeviceEnergyRatings (
Rating_ID int auto_increment primary key,
Energy_Rating varchar(50),
DeviceType_ID int,
foreign key (DeviceType_ID) references DeviceTypes(DeviceType_ID)
);


-- create ActivityLogs table to track user activities.
create table ActivityLogs (
Log_ID int auto_increment primary key,
Activity_Description text not null,
Activity_Date date,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);

-- create EnergyPrice table to store energy prices for different periods.
create table EnergyPrice (
Price_ID int auto_increment primary key,
Price_Date date not null,
Price_PerUnit float 
);


-- create ConsumptionForecast table to store forecasted energy consumption.
create table ConsumptionForecast (
Forecast_ID int auto_increment primary key,
ForecastDate date not null,
Forecasted_Energy float not null,
Device_ID int,
foreign key (Device_ID) references Devices(Device_ID)
);


-- create WeatherData table to store weather information (useful for energy consumption analysis).
create table WeatherData (
Weather_ID int auto_increment primary key,
Weathe_rDate date not null,
Temperature float not null,
Humidity float not null
);


-- create MonthlySummaries table to store monthly summaries of energy consumption.
create table MonthlySummaries (
Summary_ID int auto_increment primary key,
Month_Year date not null,
Total_EnergyUsed float not null,
User_ID int,
foreign key (User_ID) references Users(User_ID)
);

-- create ApplianceProfiles table to store profiles of different appliance models and their typical energy usage.
create table ApplianceProfiles (
Profile_ID int auto_increment primary key,
Appliance_Model varchar(100) not null,
Average_EnergyUsage float not null
);

show tables;

-- add column Gender in the Users table 
alter table Users
add column Gender varchar(10) not null;



-- NAME: NHIAL NHIAL LUKA DENG
-- REG NO: 2309000417


-- Insert records into Users table 
-- Insert sample records into Users table with the new Gender column
insert into Users (User_Name, User_Email, User_Password, Gender) 
values
('John Doe', 'john.doe@example.com', 'password123', 'Male'),
('Jane Smith', 'jane.smith@example.com', 'password456', 'Female'),
('Emily Johnson', 'emily.johnson@example.com', 'password789', 'Female'),
('Michael Brown', 'michael.brown@example.com', 'password321', 'Male'),
('Sarah Davis', 'sarah.davis@example.com', 'password654', 'Female');



-- Insert records into device types table
insert into DeviceTypes (DeviceType_Name)
values
('Refrigerator'),
('Washing Machine'),
('Air Conditioner'),
('Heater'),
('Lighting');



-- Insert records into devices table
insert into Devices (Device_Name, DeviceType_ID, User_ID) 
values
('LG Refrigerator', 1, 1),
('Samsung Washing Machine', 2, 1),
('Daikin Air Conditioner', 3, 2),
('Philips Heater', 4, 3),
('GE Lighting', 5, 4);



-- Insert records into energy consumption table
insert into EnergyConsumption (Device_ID, ConsumptionDate, EnergyUsed) 
values
(1, '2025-01-25 12:00:00', 12.5),
(2, '2025-01-25 12:30:00', 11.8),
(3, '2025-01-25 13:00:00', 32.4),
(4, '2025-01-25 13:30:00', 24.1),
(5, '2025-01-25 14:00:00', 10.9);



-- Insert records into tips table
insert into Tips (TipDescription) 
values
('Turn off lights when not in use'),
('Use energy-efficient appliances'),
('Unplug devices when not in use'),
('Lower thermostat settings in winter'),
('Use natural lighting during the day');



-- Insert records into user preferences table
insert into  UserPreferences (Preference_Name, Preference_Value, User_ID) 
values
('Notification', 'Enabled', 1),
('Dark Mode', 'Enabled', 2),
('Language', 'English', 3),
('Email Updates', 'Subscribed', 4),
('SMS Alerts', 'Enabled', 5);



-- Insert records into alerts table
insert into Alerts (Alert_Message, Alert_Date, User_ID) 
values
('High energy usage detected!', '2025-01-25 14:00:00', 1),
('Monthly energy report available', '2025-01-25 15:00:00', 2),
('New energy-saving tip available', '2025-01-25 16:00:00', 3),
('Device disconnected', '2025-01-25 17:00:00', 4),
('Energy consumption exceeded threshold', '2025-01-25 18:00:00', 5);



-- Insert records into reports table
insert into Reports (Report_Date, Report_Content, User_ID) 
values
('2025-01-25', 'Monthly energy consumption report', 1),
('2025-01-25', 'Weekly energy usage analysis', 2),
('2025-01-25', 'Daily energy report', 3),
('2025-01-25', 'Device performance summary', 4),
('2025-01-25', 'Energy efficiency report', 5);



-- Insert records into device energy ratings table
insert into DeviceEnergyRatings (Energy_Rating, DeviceType_ID) 
values
('A++', 1),
('A+', 2),
('A', 3),
('B+', 4),
('B', 5);



-- Insert records into activity logs table
insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
values
('Logged in', '2025-01-25', 1),
('Updated device settings', '2025-01-25', 2),
('Viewed energy report', '2025-01-25', 3),
('Changed user preferences', '2025-01-25', 4),
('Received alert', '2025-01-25', 5);



-- Insert records into energy prices table
insert into EnergyPrice (Price_Date, Price_PerUnit) 
values
('2025-01-01', 0.25),
('2025-02-01', 0.26),
('2025-03-01', 0.27),
('2025-04-01', 0.28),
('2025-05-01', 0.29);



-- Insert records into consumption forecasts table
insert into ConsumptionForecast (ForecastDate, Forecasted_Energy, Device_ID) 
values
('2025-02-01', 2.8, 1),
('2025-02-02', 2.7, 2),
('2025-02-03', 3.0, 3),
('2025-02-04', 2.5, 4),
('2025-02-05', 1.9, 5);



-- Insert records into weather data table
insert into WeatherData (Weathe_rDate, Temperature, Humidity) 
values
('2025-01-25', 20.5, 60),
('2025-01-26', 22.3, 55),
('2025-01-27', 19.8, 65),
('2025-01-28', 21.0, 58),
('2025-01-29', 23.4, 52);



-- Insert records into monthly summaries table
insert into MonthlySummaries (Month_Year, Total_EnergyUsed, User_ID) 
values
('2025-01-01', 150, 1),
('2025-01-01', 170, 2),
('2025-01-01', 160, 3),
('2025-01-01', 140, 4),
('2025-01-01', 180, 5);



-- Insert records into appliance profiles table
insert into ApplianceProfiles (Appliance_Model, Average_EnergyUsage) 
values
('LG Model X', 1.5),
('Samsung Model Y', 2.2),
('Daikin Model Z', 3.0),
('Philips Model A', 1.8),
('GE Model B', 0.9);



-- NAME: NHIAL NHIAL LUKA DENG
-- REG NO: 2309000417

SELECT * FROM Users;


-- Create a new user table
insert into Users (User_Name, User_Email, User_Password, Gender) 
values ('Alice Johnson', 'alice.johnson@example.com', 'password999', 'Female');


-- Update a user's email
update Users
set User_Email = 'alice.new@example.com'
where User_ID = 6;

-- Delete a user
delete from Users
where User_ID = 6;

-- Count the number of users
select COUNT(*) from Users;

-- Calculate the average User_ID
select avg(User_ID) from Users;

-- Calculate the sum of User_IDs
select SUM(User_ID) from Users;


-- Create a new device type
insert into DeviceTypes (DeviceType_Name) 
value ('Microwave');


-- Update a device type name
update DeviceTypes
set DeviceType_Name = 'Smart Microwave'
where DeviceType_ID = 6;

-- Delete a device type
delete from DeviceTypes
where DeviceType_ID = 6;

-- Count the number of device types
select COUNT(*) from DeviceTypes;

-- Calculate the average DeviceType_ID
select avg(DeviceType_ID) from DeviceTypes;

-- Calculate the sum of DeviceType_IDs 
select SUM(DeviceType_ID) from DeviceTypes;



-- Create a new device
insert into DeviceTypes (DeviceType_ID, DeviceType_Name) 
values (6, 'Microwave');

insert into Devices (Device_Name, DeviceType_ID, User_ID) 
values ('LG Smart Microwave', 6, 1);

select * from Devices;

-- Update a device name
update Devices
set Device_Name = 'LG New Microwave'
where Device_ID = 6;

-- Delete a device
delete from Devices
where Device_ID = 6;

-- Count the number of devices
select COUNT(*) from Devices;

-- Calculate the average Device_ID
select avg(Device_ID) from Devices;

-- Calculate the sum of Device_IDs
select SUM(Device_ID) from Devices;



-- Create a new energy consumption record
INSERT INTO Devices (Device_Name, DeviceType_ID, User_ID) 
VALUES ('LG Smart Microwave', 1, 1);

-- Insert energy consumption record
insert EnergyConsumption (Device_ID, ConsumptionDate, EnergyUsed) 
values (10, '2025-01-26 12:00:00', 15.2);

select * from EnergyConsumption;

-- Update the energy used in a record
update EnergyConsumption
set EnergyUsed = 16.3
where Record_ID = 6;

-- Delete an energy consumption record
delete from EnergyConsumption
where Record_ID = 6;

-- Count the number of energy consumption records
select COUNT(*) from EnergyConsumption;

-- Calculate the average energy used
select(EnergyUsed) from EnergyConsumption;

-- Calculate the total energy used
select SUM(EnergyUsed) from EnergyConsumption;


-- Create a new tip
insert into Tips (TipDescription) 
values ('Use the microwave instead of the oven');

select * from Tips;

-- Update a tip description
update Tips
set TipDescription = 'Use the microwave efficiently'
where Tip_ID = 6;

-- Delete a tips
delete from Tips
where Tip_ID = 6;

-- Count the number of tips
select COUNT(*) from Tips;

-- Calculate the average Tip_ID 
 select avg(Tip_ID) from Tips;

-- Calculate the sum of Tip_IDs 
select SUM(Tip_ID) from Tips;


-- Create a new user preference
insert into UserPreferences (Preference_Name, Preference_Value, User_ID) 
values ('Weekly Summary', 'Enabled', 1);

select * from UserPreferences;

-- Update a user preference value
update UserPreferences
set Preference_Value = 'Disabled'
where Preference_ID = 6;

-- Delete a user preference
delete from UserPreferences
where Preference_ID = 6;

-- Count the number of user preferences
select COUNT(*) from UserPreferences;

-- Calculate the average Preference_ID
select AVG(Preference_ID) from UserPreferences;

-- Calculate the sum of Preference_IDs 
select SUM(Preference_ID) from UserPreferences;


-- Create a new alert
insert into Alerts (Alert_Message, Alert_Date, User_ID) 
values ('Device maintenance required', '2025-01-26 12:00:00', 1);

select * from Alerts;

-- Update an alert message
update Alerts
set Alert_Message = 'Device maintenance completed'
where Alert_ID = 6;

-- Delete an Alert
delete from Alerts
where Alert_ID = 6;

-- Count the number of alerts
select COUNT(*) from Alerts;

-- Calculate the average Alert_ID 
select AVG(Alert_ID) from Alerts;

-- Calculate the sum of Alert_IDs
select SUM(Alert_ID) from Alerts;



-- Create a new report
insert into Reports (Report_Date, Report_Content, User_ID) 
values ('2025-01-26', 'Weekly energy consumption report', 1);

select * from Reports;

-- Update a report content
update Reports
set Report_Content = 'Updated weekly energy consumption report'
where Report_ID = 6;

-- Delete a Report
delete from Reports
where Report_ID = 6;

-- Count the number of reports
select COUNT(*) from Reports;

-- Calculate the average Report_ID
select AVG(Report_ID) from Reports;

-- Calculate the sum of Report_IDs
select SUM(Report_ID) from Reports;



-- Create a new device energy rating
insert into DeviceEnergyRatings (Energy_Rating, DeviceType_ID) 
values ('A++', 6);

select * from DeviceEnergyRatings;

-- Update an energy rating
update DeviceEnergyRatings
set Energy_Rating = 'A'
where Rating_ID = 6;

-- Delete an energy rating
delete from DeviceEnergyRatings
where Rating_ID = 6;

-- Count the number of device energy ratings
select COUNT(*) from DeviceEnergyRatings;

-- Calculate the average Rating_ID
select AVG(Rating_ID) from DeviceEnergyRatings;

-- Calculate the sum of Rating_IDs
select SUM(Rating_ID) from DeviceEnergyRatings;



-- Create a new activity log
insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
values ('Logged out', '2025-01-26', 1);

select * from ActivityLogs;

-- Retrieve all activity logs
update ActivityLogs
set Activity_Description = 'Logged back in'
where Log_ID = 6;

-- Delete an activity log
delete from ActivityLogs
where Log_ID = 6;

-- Count the number of activity logs
select COUNT(*) from ActivityLogs;

-- Calculate the average Log_ID
select AVG(Log_ID) from ActivityLogs;

-- Calculate the sum of Log_IDs
select SUM(Log_ID) from ActivityLogs;



-- Create a new energy price record
insert into EnergyPrice (Price_Date, Price_PerUnit) 
values ('2025-06-01', 0.30);

select * from EnergyPrice;


-- Update the price per unit
update EnergyPrice
set Price_PerUnit = 0.31
where Price_ID = 6;

-- Delete an energy price record
delete from EnergyPrice
where Price_ID = 6;

-- Count the number of energy price records
select COUNT(*) from EnergyPrice;

-- Calculate the average Price_PerUnit
select AVG(Price_ID) from EnergyPrice;

-- Calculate the total Price_PerUnit
select SUM(Price_ID) from EnergyPrice;



-- Create a new consumption forecast
insert into ConsumptionForecast (ForecastDate, Forecasted_Energy, Device_ID) 
values ('2025-02-06', 3.1, 1);

select * from ConsumptionForecast;

-- Update the forecasted energy
update ConsumptionForecast
set Forecasted_Energy = 3.2
where Forecast_ID = 6;

-- Delete a consumption forecast
delete from ConsumptionForecast
where Forecast_ID = 6;

-- Count the number of consumption forecasts
select COUNT(*) from ConsumptionForecast;

-- Calculate the average Forecasted_Energy
select AVG(Forecasted_Energy) from ConsumptionForecast;

-- Calculate the total Forecasted_Energy
select SUM(Forecasted_Energy) from ConsumptionForecast;



-- Create a new weather data record
insert into WeatherData (Weathe_rDate, Temperature, Humidity) 
values ('2025-01-30', 24.1, 50);

select * from WeatherData;

-- Update the temperature
update WeatherData
set Temperature = 24.5
where Weather_ID = 6;

-- Delete a weather data record
delete from WeatherData
where Weather_ID = 6;

-- Count the number of weather data records
select COUNT(*) from WeatherData;

-- Calculate the average temperature
select AVG(Temperature) from WeatherData;

-- Calculate the total humidity
select SUM(Humidity) from WeatherData;



-- Create a new monthly summary
insert MonthlySummaries (Month_Year, Total_EnergyUsed, User_ID) 
values ('2025-02-01', 155, 1);

select * from MonthlySummaries;

-- Update the total energy used in a summary
update MonthlySummaries
set Total_EnergyUsed = 160
where Summary_ID = 6;

-- Delete
delete from MonthlySummaries
where Summary_ID = 6;

-- Delete a monthly summary
select COUNT(*) from MonthlySummaries;

-- Calculate the average Total_EnergyUsed
select AVG(Summary_ID) from MonthlySummaries;

-- Calculate the sum of Total_EnergyUsed
select SUM(Summary_ID) from MonthlySummaries;



-- Create a new appliance profile
insert ApplianceProfiles (Appliance_Model, Average_EnergyUsage) 
values ('GE Model C', 1.2);

select * from ApplianceProfiles;

-- Update the average energy usage for a profile
update ApplianceProfiles
set Average_EnergyUsage = 1.3
where Profile_ID = 6;

-- Delete an appliance profile
delete from ApplianceProfiles
where Profile_ID = 6;

-- Count the number of appliance profiles
select COUNT(*) from ApplianceProfiles;

-- Calculate the average Average_EnergyUsage
select AVG(Profile_ID) from ApplianceProfiles;

-- Calculate the sum of Average_EnergyUsage
select SUM(Profile_ID) from ApplianceProfiles;



-- Create a view named UserDevices to show user names and their devices
create view UserDevices as
select Users.User_Name, Devices.Device_Name
from Users
join Devices on Users.User_ID = Devices.User_ID;


-- Create a view named DeviceConsumption to show device names and their total energy used
create view DeviceConsumption as
select Devices.Device_Name, SUM(EnergyConsumption.EnergyUsed) as TotalEnergyUsed
from Devices
join EnergyConsumption on Devices.Device_ID = EnergyConsumption.Device_ID
group by Devices.Device_Name;


-- Create a view named UserAlerts to show user names and their alerts
create view UserAlerts as
select Users.User_Name, Alerts.Alert_Message, Alerts.Alert_Date
from Users
join Alerts on Users.User_ID = Alerts.User_ID;


-- Create a view named UserReports to show user names and their reports
create view UserReports as
select Users.User_Name, Reports.Report_Date, Reports.Report_Content
from Users
join Reports on Users.User_ID = Reports.User_ID;


-- Create a view named DeviceEnergyRatingsView to show device type names and their energy ratings
create view  DeviceEnergyRatingsView as
select DeviceTypes.DeviceType_Name, DeviceEnergyRatings.Energy_Rating
from DeviceTypes
join DeviceEnergyRatings on DeviceTypes.DeviceType_ID = DeviceEnergyRatings.DeviceType_ID;


-- Create a view named MonthlyUserSummaries to show user names and their monthly energy summaries
create view MonthlyUserSummaries as
select Users.User_Name, MonthlySummaries.Month_Year, MonthlySummaries.Total_EnergyUsed
from Users
join MonthlySummaries on Users.User_ID = MonthlySummaries.User_ID;


-- Create a stored procedure named InsertUser to insert a new user
DELIMITER $$
create procedure InsertUser(
    in p_User_Name varchar(50), 
    in p_User_Email varchar(50), 
    in p_User_Password varchar(100), 
    in p_Gender varchar(10)
)
BEGIN
    insert into Users (User_Name, User_Email, User_Password, Gender) 
    values (p_User_Name, p_User_Email, p_User_Password, p_Gender);
END $$
DELIMITER ;


-- Create a stored procedure named UpdateUserEmail to update a user's email
DELIMITER $$
create procedure UpdateUserEmail(
    in p_User_ID int,
    in p_NewEmail varchar(50)
)
BEGIN
    update Users
    set User_Email = p_NewEmail
    where User_ID = p_User_ID;
END $$
DELIMITER ;


-- Create a stored procedure named DeleteUser to delete a user
DELIMITER $$
create procedure DeleteUser(
in p_User_ID int)
BEGIN
    delete from Users where User_ID = p_User_ID;
END $$
DELIMITER ;


-- Create a stored procedure named InsertDevice to insert a new device
DELIMITER $$
create procedure InsertDevice(
    in p_Device_Name varchar(50),
    in p_DeviceType_ID int,
    in p_User_ID int
)
BEGIN
    insert into Devices (Device_Name, DeviceType_ID, User_ID) 
    values (p_Device_Name, p_DeviceType_ID, p_User_ID);
END $$
DELIMITER ;


-- Create a stored procedure named UpdateDeviceEnergyRating to update the energy rating of a device
DELIMITER $$
create procedure UpdateDeviceEnergyRating(
    in p_Rating_ID int,
    in p_NewEnergy_Rating varchar(50)
)
BEGIN
    update DeviceEnergyRatings
    set Energy_Rating = p_NewEnergy_Rating
    where Rating_ID = p_Rating_ID;
END $$
DELIMITER ;


-- Create a stored procedure named GenerateUserActivityLog to generate a user activity log
DELIMITER $$
create procedure GenerateUserActivityLog(
    in p_Activity_Description text,
    in p_User_ID int
)
BEGIN
   insert into ActivityLogs (Activity_Description, Activity_Date, User_ID)
    values (p_Activity_Description, CURDATE(), p_User_ID);
END $$
DELIMITER ;


-- NAME: NHIAL NHIAL LUKA DENG
-- REG NO : 2309000417

-- For Users table
-- Create a trigger named AfterUserInsert to log activities after insert on Users
DELIMITER $$ 
create trigger AfterUserInsert 
after insert on Users 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('User table insert', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterUserUpdate to log activities after update on Users
DELIMITER $$ 
create trigger AfterUserUpdate 
after update on Users 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('User table update', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterUserDelete to log activities after delete on Users
DELIMITER $$ 
create trigger AfterUserDelete 
after delete on Users 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('User table delete', CURDATE(), old.User_ID); 
END $$ 
DELIMITER ;



-- For DeviceTypes table
-- Create a trigger named AfterDeviceTypesInsert to log activities after insert on DeviceTypes
DELIMITER $$ 
create trigger AfterDeviceTypesInsert 
after insert on DeviceTypes 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('DeviceTypes table insert', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterDeviceTypesUpdate to log activities after update on DeviceTypes
DELIMITER $$ 
create trigger AfterDeviceTypesUpdate 
after update on DeviceTypes 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('DeviceTypes table update', CURDATE()); 
END $$ 
DELIMITER ;



-- Create a trigger named AfterDeviceTypesDelete to log activities after delete on DeviceTypes
DELIMITER $$ 
create trigger AfterDeviceTypesDelete 
after delete on DeviceTypes 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('DeviceTypes table delete', CURDATE()); 
END $$ 
DELIMITER ;




-- For Devices table
-- Create a trigger named AfterDevicesInsert to log activities after insert on Devices
DELIMITER $$ 
create trigger AfterDevicesInsert 
after insert on Devices 
for each row
BEGIN 
    insert ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Devices table insert', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterDevicesUpdate to log activities after update on Devices
DELIMITER $$ 
create trigger AfterDevicesUpdate 
after update on Devices 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Devices table update', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterDevicesDelete to log activities after delete on Devices
DELIMITER $$ 
create trigger AfterDevicesDelete 
after delete on Devices 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Devices table delete', CURDATE(), old.User_ID); 
END $$ 
DELIMITER ;



-- For EnergyConsumption table
-- Create a trigger named AfterEnergyConsumptionInsert to log activities after insert on EnergyConsumption
DELIMITER $$ 
create trigger AfterEnergyConsumptionInsert 
after insert on EnergyConsumption 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('EnergyConsumption table insert', CURDATE()); 
END $$ 
DELIMITER ;

-- Create a trigger named AfterEnergyConsumptionUpdate to log activities after update on EnergyConsumption
DELIMITER $$ 
create trigger AfterEnergyConsumptionUpdate 
after update on EnergyConsumption 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('EnergyConsumption table update', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterEnergyConsumptionDelete to log activities after delete on EnergyConsumption
DELIMITER $$ 
create trigger AfterEnergyConsumptionDelete 
after delete on EnergyConsumption 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('EnergyConsumption table delete', CURDATE()); 
END $$ 
DELIMITER ;



-- For Tips table
-- Create a trigger named AfterTipsInsert to log activities after insert on Tips
DELIMITER $$ 
create trigger AfterTipsInsert 
after insert on Tips 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('Tips table insert', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterTipsUpdate to log activities after update on Tips
DELIMITER $$ 
create trigger AfterTipsUpdate 
after update on Tips 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('Tips table update', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterTipsDelete to log activities after delete on Tips
DELIMITER $$ 
create trigger AfterTipsDelete 
after delete on Tips 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('Tips table delete', CURDATE()); 
END $$ 
DELIMITER ;




-- For UserPreferences table
-- Create a trigger named AfterUserPreferencesInsert to log activities after insert on UserPreferences
DELIMITER $$ 
create trigger AfterUserPreferencesInsert 
after insert on UserPreferences 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('UserPreferences table insert', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterUserPreferencesUpdate to log activities after update on UserPreferences
DELIMITER $$ 
create trigger AfterUserPreferencesUpdate 
after update on UserPreferences 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('UserPreferences table update', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterUserPreferencesDelete to log activities after delete on UserPreferences
DELIMITER $$ 
create trigger AfterUserPreferencesDelete 
after delete on UserPreferences 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('UserPreferences table delete', CURDATE(), old.User_ID); 
END $$ 
DELIMITER ;




-- For Alerts table
-- Create a trigger named AfterAlertsInsert to log activities after insert on Alerts
DELIMITER $$ 
create trigger AfterAlertsInsert 
after insert on Alerts 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Alerts table insert', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterAlertsUpdate to log activities after update on Alerts
DELIMITER $$ 
create trigger AfterAlertsUpdate 
after update on Alerts 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Alerts table update', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterAlertsDelete to log activities after delete on Alerts
DELIMITER $$ 
create trigger AfterAlertsDelete 
after delete on Alerts 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Alerts table delete', CURDATE(), old.User_ID); 
END $$ 
DELIMITER ;




-- For Reports table
-- Create a trigger named AfterReportsInsert to log activities after insert on Reports
DELIMITER $$ 
create trigger AfterReportsInsert 
after insert on Reports 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Reports table insert', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterReportsUpdate to log activities after update on Reports
DELIMITER $$ 
create trigger AfterReportsUpdate 
after update on Reports 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Reports table update', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterReportsDelete to log activities after delete on Reports
DELIMITER $$ 
create trigger AfterReportsDelete 
after delete on Reports 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('Reports table delete', CURDATE(), old.User_ID); 
END $$ 
DELIMITER ;




-- For DeviceEnergyRatings table
-- Create a trigger named AfterDeviceEnergyRatingsInsert to log activities after insert on DeviceEnergyRatings
DELIMITER $$ 
create trigger AfterDeviceEnergyRatingsInsert 
after insert on DeviceEnergyRatings 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('DeviceEnergyRatings table insert', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterDeviceEnergyRatingsUpdate to log activities after update on DeviceEnergyRatings
DELIMITER $$ 
create trigger AfterDeviceEnergyRatingsUpdate 
after update on DeviceEnergyRatings 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('DeviceEnergyRatings table update', CURDATE()); 
END $$ 
DELIMITER ;

-- Create a trigger named AfterDeviceEnergyRatingsDelete to log activities after delete on DeviceEnergyRatings
DELIMITER $$ 
create trigger AfterDeviceEnergyRatingsDelete 
after delete on DeviceEnergyRatings 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('DeviceEnergyRatings table delete', CURDATE()); 
END $$ 
DELIMITER ;




-- For ActivityLogs table
-- Create a trigger named AfterActivityLogsInsert to log activities after insert on ActivityLogs
DELIMITER $$ 
create trigger AfterActivityLogsInsert 
after insert on ActivityLogs 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('ActivityLogs table insert', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterActivityLogsUpdate to log activities after update on ActivityLogs
DELIMITER $$ 
create trigger AfterActivityLogsUpdate 
after update on ActivityLogs 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('ActivityLogs table update', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;



-- For EnergyPrice table
-- Create a trigger named AfterEnergyPriceInsert to log activities after insert on EnergyPrice
DELIMITER $$ 
create trigger AfterEnergyPriceInsert 
after insert on EnergyPrice 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('EnergyPrice table insert', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterEnergyPriceUpdate to log activities after update on EnergyPrice
DELIMITER $$ 
create trigger AfterEnergyPriceUpdate 
after update on EnergyPrice 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('EnergyPrice table update', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterEnergyPriceDelete to log activities after delete on EnergyPrice
DELIMITER $$ 
create trigger AfterEnergyPriceDelete 
after delete on EnergyPrice 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('EnergyPrice table delete', CURDATE()); 
END $$ 
DELIMITER ;



-- For ConsumptionForecast table
-- Create a trigger named AfterConsumptionForecastInsert to log activities after insert on ConsumptionForecast
DELIMITER $$ 
create trigger AfterConsumptionForecastInsert 
after insert on ConsumptionForecast 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('ConsumptionForecast table insert', CURDATE()); 
END $$ 
DELIMITER ;

-- Create a trigger named AfterConsumptionForecastUpdate to log activities after update on ConsumptionForecast
DELIMITER $$ 
create trigger AfterConsumptionForecastUpdate 
AFTER UPDATE on ConsumptionForecast 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('ConsumptionForecast table update', CURDATE()); 
END $$ 
DELIMITER ;



-- Create a trigger named AfterConsumptionForecastDelete to log activities after delete on ConsumptionForecast
DELIMITER $$ 
create trigger AfterConsumptionForecastDelete 
after delete on ConsumptionForecast 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('ConsumptionForecast table delete', CURDATE()); 
END $$ 
DELIMITER ;




-- For WeatherData table
-- Create a trigger named AfterWeatherDataInsert to log activities after insert on WeatherData
DELIMITER $$ 
create trigger AfterWeatherDataInsert 
after insert on WeatherData 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('WeatherData table insert', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterWeatherDataUpdate to log activities after update on WeatherData
DELIMITER $$ 
create trigger AfterWeatherDataUpdate 
after update on WeatherData 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('WeatherData table update', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterWeatherDataDelete to log activities after delete on WeatherData
DELIMITER $$ 
create trigger AfterWeatherDataDelete 
after delete on WeatherData 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('WeatherData table delete', CURDATE()); 
END $$ 
DELIMITER ;


-- For MonthlySummaries table
-- Create a trigger named AfterMonthlySummariesInsert to log activities after insert on MonthlySummaries
DELIMITER $$ 
create trigger AfterMonthlySummariesInsert 
after insert on MonthlySummaries 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('MonthlySummaries table insert', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterMonthlySummariesUpdate to log activities after update on MonthlySummaries
DELIMITER $$ 
create trigger AfterMonthlySummariesUpdate 
after update on MonthlySummaries 
for each row 
BEGIN 
    insert ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('MonthlySummaries table update', CURDATE(), new.User_ID); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterMonthlySummariesDelete to log activities after delete on MonthlySummaries
DELIMITER $$ 
create trigger AfterMonthlySummariesDelete 
after delete on MonthlySummaries 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date, User_ID) 
    values ('MonthlySummaries table delete', CURDATE(), old.User_ID); 
END $$ 
DELIMITER ;


-- For ApplianceProfiles table
-- Create a trigger named AfterApplianceProfilesInsert to log activities after insert on ApplianceProfiles
DELIMITER $$ 
create trigger AfterApplianceProfilesInsert 
after insert on ApplianceProfiles 
for each row 
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('ApplianceProfiles table insert', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterApplianceProfilesUpdate to log activities after update on ApplianceProfiles
DELIMITER $$ 
create trigger AfterApplianceProfilesUpdate 
after update on ApplianceProfiles 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('ApplianceProfiles table update', CURDATE()); 
END $$ 
DELIMITER ;


-- Create a trigger named AfterApplianceProfilesDelete to log activities after delete on ApplianceProfiles
DELIMITER $$ 
create trigger AfterApplianceProfilesDelete 
after delete on ApplianceProfiles 
for each row
BEGIN 
    insert into ActivityLogs (Activity_Description, Activity_Date) 
    values ('ApplianceProfiles table delete', CURDATE()); 
END $$ 
DELIMITER ;

























 








































