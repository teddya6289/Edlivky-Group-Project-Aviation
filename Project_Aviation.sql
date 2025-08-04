-- PROJECT AVIATION----- EDLIVKY TEAM


-- 1st to run
 create table Booking_Agency
 ( Agency_ID        number (5) primary key,
  Agency_Name       varchar2 (20) not null,
  Years_Of_Contract varchar2 (15) not null);
  
  
-- 2nd to run
 Create table Booking (
Booking_ID          varchar2 (10) primary key,
Trip_Type           varchar2(40) not null,
Booking_Date        Date not null,
Return_Date         Date null,
Booking_Time        Varchar2(15)not null,
Adult               number (5) not null,
Children            number (5) null,
Agency_ID           number (5) null, 
constraint Fk_Agency_ID foreign key (Agency_ID) references Booking_Agency(Agency_ID));
  
  
  

-- 3rd to run
 create table Payments
 ( Payment_ID       varchar2 (10) primary key,
 Amount             number (7) not null check(Amount > 0),
 Discount           number (7,3) null,
 Amount_Payable     generated always as (Amount - (Amount*Discount)),
 Booking_ID         varchar2 (10) not null,
constraint Fk_BookingID foreign key (Booking_ID) references Booking(Booking_ID));
 
 
-- 4th to Run
create table Seat(
Seat_No	            varchar2 (20) primary key,
Transit_Seat        varchar2 (10) null,
Number_Of_Passenger	number (7) not null,
Payment_ID          varchar2 (10) not null,
constraint FK_PaymentID foreign key(Payment_ID)references Payments(Payment_ID));


-- 5th to run
  create table Ticket(
  Ticket_No	            varchar2 (45) primary key,
  Payment_ID            varchar2 (10) not null,
  Seat_No               varchar2 (20) not null references Seat(Seat_No),	
  Booking_ID            varchar2 (10) not null,	
  Number_Stops          number (7) null,
  Departure_Date        date not null,	
  Departure_Time        varchar2 (15) not null,	
  Arrival_Date	         date not null,
  Arrival_Time          varchar2 (15) not null,
  constraint Fk_PaymentID2 foreign key(payment_ID) references payments(Payment_ID),
  constraint Fk_BookingID2 foreign key(Booking_ID) references Booking(Booking_ID));


-- 6th to run
 create table Aircraft_Procurement(
 Aircraft_Code          varchar2 (15) primary key,
 Aircraft_Name          varchar2 (20) not null,
 Man_Com                varchar2 (15) not null,
 Man_Date               date not null,
 Expected_LifeSpan      number (7) not null,
 Cost	                  number (7) not null,
 Procure_Officer        varchar2 (20) not null);
 
-- 7th to Run
 create table Airport (
 Airport_ID	        varchar2 (7) primary key,
 Airport_Name       varchar2 (55) not null,	
 City_Country       varchar2 (20) not null,	
 Continent          varchar (15) not null,
 Aircraft_Available	varchar2 (50) not null,
 D_Allowed_Domestic varchar2 (10) null,
 D_Allowed_Inter    varchar2 (20) null,
 constraint FK_Aircraft foreign key (Aircraft_Available) references Aircraft_Procurement(Aircraft_Code));
 
 
 
-- 8th to Run
create table Flight_Service(
SerVice_ID          varchar2 (7) primary key,
Aircraft_Code       varchar2 (15) not null,
Service_Engineer    varchar2 (30) not null,
Man_Date            date not null,
last_Service_Date   date not null,
Next_Service_Date   date not null,	
Service_Category    varchar2 (5) not null,
Cost_of_Servcing    number (10) not null,
constraint FK_Aircraft_code foreign key (Aircraft_Code)references Aircraft_Procurement(Aircraft_Code));


--9th to Run    
create table Crew(
Crew_ID             number (7) not null,
Flight_Crew_Name    varchar2 (20) primary key,
Crew_Captain        varchar2 (35) not null unique);


--10th to run
create table Trip (
Trip_ID         number (7) primary key,
Trip_Code       varchar2 (10),
Transit_Airport varchar2 (10) null,
Return_trip     varchar2 (5) null check(Return_trip in( 'YES', 'NO')));


-- 11th to Run
create table Meal(
Meal_ID	    number (7) primary key,
Menu        varchar2 (65) not null,	
Cheff       varchar2 (25) not null);

-- 12th to run
 create table Flight (
Flight_ID           varchar2 (15) null,
Passenger_ID        number (7) not null,
Use	                varchar2 (25) not null,
Departure_Airport   varchar2 (45) not null,	
Departure_Day       varchar2 (15) not null,	
Arrival_Airport     varchar2 (45) not null,
Arrival_Day	        varchar2 (15) not null,
Trip_ID	            number (7) not null,
Seat_No             varchar2 (20) not null,
Flight_Crew_Name    varchar2 (20) not null,	
SerVice_ID          varchar2 (7) not null,
Meal_ID             number (7) not null,
constraint FK_Meal foreign key (Meal_ID) references Meal(Meal_ID),
constraint FK_Servicing foreign key (SerVice_ID)references Flight_Service(SerVice_ID),
constraint FK_Flight_Crew foreign key (Flight_Crew_Name)references Crew(Flight_Crew_Name),
constraint Fk_FlightID_Aircraft_Code foreign key (Flight_ID) references Aircraft_Procurement(Aircraft_Code),
constraint Fk_TripID foreign key (Trip_ID) references Trip(Trip_ID),
constraint fk_SeatNo foreign key (Seat_No) references Seat(Seat_No),
constraint PK_FlightID primary key (Flight_ID)); 
  
  
-- 13th to run
Create table Passenger(
  Flight_ID	varchar2 (10) not null,
  Passenger_ID	number (7) primary key,
  Ticket_No	varchar2 (45) not null,
  Passenger_First_Name varchar2 (15) not null,
  Passenger_Last_Name  varchar2 (15) not null,
  Spouse_Name	 varchar2 (25)  null,
  Child_Name_1	 varchar2 (25)  null,
  Child_Name_2	 varchar2 (25)  null,
  Number_of_Luggages number (7) null,
  Luggage_Weight varchar2 (7) null,
  Phone	varchar2 (15) not null unique,
  Email varchar2 (45) not null unique,
  Age varchar2 (20) not null,
  constraint FK_Ticket foreign key (Ticket_No) references Ticket(Ticket_No),
  constraint Fk_FlightID Foreign key (Flight_ID) references Flight(Flight_ID));
  
Alter table Flight
add constraint Flight_passenger_R foreign key (Passenger_ID) references Passenger(Passenger_ID);



--PROJECT AVAVIATION ENDS


