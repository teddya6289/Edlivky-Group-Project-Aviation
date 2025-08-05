
This task of leveraging SQL developer to create database objects for this aviation project is going to span through various procedures and step that will be exhaustively highlighted in this note  

---
## Step 1: 
Collecting and cleaning of dummy data- this step involves gathering of dummy data that is related to aviation from various 
source which included internet, journals etc. it should be noted that this data are only for testing purposes as real-time data will be 
used when the project is completed, tested and deployed.  

---
## Step 2: 
This step encompasses creation of relevant tables/database model that will house data for the client (aviation company) i.e., 
it involves the use of SQL to create a backend database models in the form of relevant tables. 
For the sake of this project we will be using the SQL developer on an ORACLE database to create our objects, indicating the different procedures and scripts for it, 
thus, procedures given below.
For this project we are going to utilize 13 relational different objects that will be created with SQL in their preceding order.
1.	Booking Agency table
2.	Booking table
3.	Payment table
4.	Seat table
5.	Ticket table
6.	Aircraft procurement table
7.	Airport table
8.	Flight Service table
9.	Crew table
10.	Trip table
11.	Meal table
12.	Flight table
13.	Passenger table

Database object SQL creation script ['script.sql'](Project_Aviation.sql)

---

It should be noted that creating table in preceding order is mainly due to the relationships between this table (i.e. the primary and foreign key relationships). 
Preceding order: there will be no child without a parent in other words you cannot create a table referencing a primary key without first creating the table
that have the primary key been referenced.Having said that, we can now proceed to creating the aforementioned tables in their preceding order. Please find attached SQL file for the scripts

---
**Key Data Integrity Constraint applied**  

- **Primary key:** 
This is the unique identifier that defines a particular row or record in a table. This constraint ensures no duplicate row in database objects. It holds true to
the maxim that “there cannot be any two persons with the same exact disposition” that been said every single row is uniquely identified by this key. 
Any database objects that host this key is usually referred to as a parent table, because it has the possibility to connect a record to another row in another table, 
more like a parent bearing a child

- **Foreign Key:** 
It is an identifier that relates/connect one or more tables together by linking records of one table to another using a unique precedent (Primary key).

- **Check Constraints:**
Check Constraints is a way of maintaining the integrity of a data structure in a table by ensuring inputs into a column/feature in the table meets a specified data criterion.
When a check constraint is on a column/feature, it means no inputs will be allowed into the column if it was not validated by the check constraint.

- **Default Constraint:** 
It is a variable either number or character that should be in a record with no value instead of a null.

- **Virtual Column:** 
Virtual column which carries derived values computed from other columns, this column is usually used for data consistency, and also because it is not stored in the disk i.e. 
it does not require space allocation to function, which in the long-run improve database and query efficiency.

---
## Note: 
This project is a part of a major project, as a member of the team I was assigned this responsibility to build a fully active and functional development environment of the 
database objects aforementioned leveraging SQL developer, test it with dummy data’s to observe data flow and consistency. 
Moving forward, final decision concerning modification of this project before deployment is exclusively the decision of the team lead.
