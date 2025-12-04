# Event Management System

## Project Overview
A PostgreSQL-based Event Management System designed to efficiently create, manage, and track events, attendees, and registrations. The system provides comprehensive functionality for event organizers to handle event details, monitor attendee information, and manage registration processes.

## Database Structure

### Database
* **Database Name:** EventsManagement

### Tables

#### 1. Events Table
Stores complete event information and details.

**Columns:**
* `Event_Id` (Integer) - Primary Key
* `Event_Name` (Varchar) - Name of the Event
* `Event_Date` (Date) - Scheduled Date
* `Event_Location` (Varchar) - Venue/Location
* `Event_Description` (Text) - Event Details

#### 2. Attendees Table
Maintains attendee contact and personal information.

**Columns:**
* `Attendee_Id` (Integer) - Primary Key
* `Attendee_Name` (Varchar) - Attendee Name
* `Attendee_Phone` (Numeric) - Contact Number
* `Attendee_Email` (Varchar) - Email Address
* `Attendee_City` (Varchar) - City of Residence

#### 3. Registrations Table
Tracks event registrations and links attendees to events.

**Columns:**
* `Registration_id` (Integer) - Primary Key
* `Event_Id` (Integer) - Foreign Key (References Events)
* `Attendee_Id` (Integer) - Foreign Key (References Attendees)
* `Registration_Date` (Date) - Date of Registration
* `Registration_Amount` (Numeric) - Registration Fee

## Features

### 1. Database Creation
* Created dedicated EventsManagement database
* Designed three interconnected tables
* Implemented foreign key constraints for data integrity
* Established relationships between Events, Attendees, and Registrations

### 2. Data Entry
* Inserted sample records for Events table
* Added diverse attendee profiles
* Created registration records with proper relationships
* Comprehensive test data covering various scenarios

### 3. Event Management Operations
* **Insert New Event** - Add upcoming events to the system
* **Update Event Information** - Modify event details, dates, or locations
* **Delete Event** - Remove cancelled or completed events

### 4. Attendee & Registration Management
* **Insert New Attendee** - Add new attendee profiles to the database
* **Register Attendee for Event** - Create registration records linking attendees to events
* **Track Registration Status** - Monitor registration details and amounts

### 5. Reporting and Analytics
* **Event Information Retrieval** - Query complete event details
* **Attendee List Generation** - Generate attendee lists for specific events
* **Attendance Statistics** - Calculate event attendance metrics
* **Registration Tracking** - Monitor registration counts and revenue
* **Multi-event Analysis** - Track attendees registered for multiple events

## Technologies Used
* **Database:** PostgreSQL
* **Language:** SQL

## Key SQL Concepts Demonstrated
* Database creation and management
* Multiple table creation with relationships
* Foreign key constraints implementation
* INSERT operations across related tables
* UPDATE statements for data modification
* DELETE operations with referential integrity
* SELECT queries with JOIN operations
* Aggregate functions (COUNT, SUM, AVG)
* GROUP BY for statistical analysis
* WHERE clause filtering
* Date handling and comparisons

## Project Files
* `eventmanagement.sql` - Complete SQL code with all tasks
* `output screenshot` - Folder containing output images for all queries

## How to Use
1. Create the EventsManagement database using the provided script
2. Execute table creation statements for Events, Attendees, and Registrations
3. Insert sample data into all three tables
4. Run event management queries (INSERT, UPDATE, DELETE)
5. Execute attendee and registration operations
6. Run analytical queries to generate reports and statistics
7. Test relationships and foreign key constraints

## Learning Outcomes
* Understanding relational database design
* Implementing foreign key constraints
* Working with multiple related tables
* Performing CRUD operations (Create, Read, Update, Delete)
* Writing JOIN queries across tables
* Using aggregate functions for analytics
* Managing referential integrity
* Generating reports from relational data
* Handling event-driven data scenarios
* Implementing real-world business logic in SQL

## Author
[MANIRATHINAM]

## Date
December 2025
