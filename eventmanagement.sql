DROP TABLE IF EXISTS Registrations;
DROP TABLE IF EXISTS Attendees;
DROP TABLE IF EXISTS Events;

CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name VARCHAR(200) NOT NULL,
    Event_Date DATE,
    Event_Location VARCHAR(300),
    Event_Description TEXT
);

-- Step 3: Create Attendees table
CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name VARCHAR(150) NOT NULL,
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(100)
);

-- Step 4: Create Registrations table with foreign key constraints
CREATE TABLE Registrations (
    Registration_id SERIAL PRIMARY KEY,
    Event_Id INTEGER,
    Attendee_Id INTEGER,
    Registration_Date DATE,
    Registration_Amount NUMERIC(10,2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);
-- Task 2: Data Creation - Insert Sample Data

-- Insert sample data into Events table
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Tech Conference 2024', '2024-03-15', 'Mumbai Convention Center', 'Annual technology conference featuring latest trends in AI and Cloud Computing'),
('Music Festival', '2024-04-20', 'Bangalore Palace Grounds', 'Three-day music festival with live performances from top artists'),
('Business Summit', '2024-05-10', 'Delhi International Hotel', 'Leadership and business strategy summit for entrepreneurs'),
('Food Carnival', '2024-06-05', 'Chennai Marina Beach', 'Celebration of regional cuisines and culinary arts'),
('Sports Championship', '2024-07-18', 'Kolkata Sports Complex', 'Inter-city sports tournament with multiple categories'),
('Art Exhibition', '2024-08-22', 'Pune Art Gallery', 'Contemporary art showcase featuring local and international artists');

-- Insert sample data into Attendees table
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
('Manirathinam', '9876543210', 'manirathinam@email.com', 'Mumbai'),
('Edison', '9876543211', 'edison@email.com', 'Delhi'),
('Jayashree', '9876543212', 'jayashree@email.com', 'Bangalore'),
('Dimpal', '9876543213', 'dimpal@email.com', 'Hyderabad'),
('Vidya', '9876543214', 'vidya@email.com', 'Chennai'),
('Aanchal', '9876543215', 'aanchal@email.com', 'Pune'),
('Javeeth', '9876543216', 'javeeth@email.com', 'Kolkata'),
('Subhashini', '9876543217', 'subhashini@email.com', 'Bangalore'),
('Vijay', '9876543218', 'vijay@email.com', 'Mumbai'),
('Siva', '9876543219', 'siva@email.com', 'Delhi');

-- Insert sample data into Registrations table
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 1, '2024-02-10', 1500.00),
(1, 3, '2024-02-12', 1500.00),
(1, 8, '2024-02-15', 1500.00),
(2, 2, '2024-03-05', 2000.00),
(2, 5, '2024-03-08', 2000.00),
(2, 9, '2024-03-10', 2000.00),
(3, 1, '2024-04-01', 3000.00),
(3, 2, '2024-04-03', 3000.00),
(3, 6, '2024-04-05', 3000.00),
(4, 4, '2024-05-10', 500.00),
(4, 5, '2024-05-12', 500.00),
(4, 7, '2024-05-15', 500.00),
(5, 3, '2024-06-20', 1000.00),
(5, 7, '2024-06-22', 1000.00),
(5, 10, '2024-06-25', 1000.00),
(6, 6, '2024-07-15', 800.00),
(6, 8, '2024-07-18', 800.00),
(6, 10, '2024-07-20', 800.00);

-- Task 3: Manage Event Details

-- a) Inserting a new event
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) 
VALUES ('Workshop on Data Science', '2024-09-25', 'Hyderabad Tech Park', 'Hands-on workshop covering Python, Machine Learning and Data Analytics');

-- View the newly inserted event
SELECT * FROM Events WHERE Event_Name = 'Workshop on Data Science';

--b) Updating an event's information
-- Update event date and location for Event_Id 2 (Music Festival)
UPDATE Events 
SET Event_Date = '2024-04-25', 
    Event_Location = 'Bangalore International Stadium'
WHERE Event_Id = 2;

-- View the updated event
SELECT * FROM Events WHERE Event_Id = 2;

-- c) Deleting an event
-- First, delete all registrations associated with the event
DELETE FROM Registrations 
WHERE Event_Id = 6;

-- Then delete the event with Event_Id 6 (Art Exhibition)
DELETE FROM Events 
WHERE Event_Id = 6;

-- View all events after deletion
SELECT * FROM Events;

-- Task 4: Manage Track Attendees & Handle Events

-- a) Inserting a new attendee
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES ('Ramesh', '9876543220', 'ramesh@email.com', 'Chennai');

-- View the newly inserted attendee
SELECT * FROM Attendees WHERE Attendee_Name = 'Ramesh';

-- b) Registering an attendee for an event
-- Register Ramesh (Attendee_Id 11) for Tech Conference 2024 (Event_Id 1)
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) 
VALUES (1, 11, '2024-02-20', 1500.00);

-- View the registration details
SELECT * FROM Registrations WHERE Attendee_Id = 11;


/*
TASK 5 OVERVIEW:
This section contains 6 essential queries to retrieve event information, generate attendee lists, 
and calculate event attendance statistics:

Query 1: Retrieve all event information (sorted by date)
Query 2: Generate attendee list for a specific event with registration details
Query 3: Generate complete attendee list showing all event registrations
Query 4: Calculate attendance statistics per event (total attendees, revenue, average fee)
Query 5: Overall system statistics (total events, attendees, registrations, revenue)
Query 6: Identify attendees who registered for multiple events

These queries provide comprehensive insights for event management and reporting.
*/

-- Query 1: Retrieve all event information
SELECT 
    Event_Id,
    Event_Name,
    Event_Date,
    Event_Location,
    Event_Description
FROM Events
ORDER BY Event_Date;


-- Query 2: Generate attendee list for a specific event (Example: Event_Id = 1 - Tech Conference)
SELECT 
    e.Event_Name,
    e.Event_Date,
    a.Attendee_Name,
    a.Attendee_Email,
    a.Attendee_Phone,
    a.Attendee_City,
    r.Registration_Date,
    r.Registration_Amount
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
JOIN Attendees a ON r.Attendee_Id = a.Attendee_Id
WHERE e.Event_Id = 1
ORDER BY r.Registration_Date;

-- Query 3: Generate complete attendee list for all events
SELECT 
    e.Event_Name,
    e.Event_Date,
    a.Attendee_Name,
    a.Attendee_City,
    r.Registration_Amount
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
JOIN Attendees a ON r.Attendee_Id = a.Attendee_Id
ORDER BY e.Event_Date, a.Attendee_Name;


-- Query 4: Calculate attendance statistics for each event
SELECT 
    e.Event_Name,
    e.Event_Date,
    e.Event_Location,
    COUNT(r.Registration_id) AS Total_Attendees,
    SUM(r.Registration_Amount) AS Total_Revenue,
    AVG(r.Registration_Amount) AS Average_Registration_Fee
FROM Events e
LEFT JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Id, e.Event_Name, e.Event_Date, e.Event_Location
ORDER BY Total_Attendees DESC;

-- Query 5: Overall event management statistics
SELECT 
    COUNT(DISTINCT e.Event_Id) AS Total_Events,
    COUNT(DISTINCT a.Attendee_Id) AS Total_Unique_Attendees,
    COUNT(r.Registration_id) AS Total_Registrations,
    SUM(r.Registration_Amount) AS Total_Revenue
FROM Events e
LEFT JOIN Registrations r ON e.Event_Id = r.Event_Id
LEFT JOIN Attendees a ON r.Attendee_Id = a.Attendee_Id;

-- Query 6: Find attendees registered for multiple events
SELECT 
    a.Attendee_Name,
    a.Attendee_Email,
    a.Attendee_City,
    COUNT(r.Registration_id) AS Events_Registered,
    SUM(r.Registration_Amount) AS Total_Amount_Paid
FROM Attendees a
JOIN Registrations r ON a.Attendee_Id = r.Attendee_Id
GROUP BY a.Attendee_Id, a.Attendee_Name, a.Attendee_Email, a.Attendee_City
HAVING COUNT(r.Registration_id) > 1
ORDER BY Events_Registered DESC;