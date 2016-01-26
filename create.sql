
-------------------------
-- Create Passenger table
-------------------------

CREATE TABLE Passenger
(
  passenger_id  varchar(15)     NOT NULL,
  fname         varchar(50)     NOT NULL,
  lname         varchar(50)     NOT NULL,
  phone_num     varchar(10)     NOT NULL,
  card_num      bigint          NOT NULL
);

--------------------------
-- Create Requests table
--------------------------
CREATE TABLE Requests
(
  request_id        varchar(15) NOT NULL,
  pickup_location   varchar(50) NOT NULL,
  destination       varchar(50) NOT NULL,
  request_time      timestamp   NOT NULL,
  surge             boolean     NOT NULL,
  passenger_id      varchar(15) NOT NULL 
);


----------------------
-- Create Driver table
----------------------
CREATE TABLE Driver
(
  driver_id     varchar(15)      NOT NULL,
  fname         varchar(50)      NOT NULL,
  lname         varchar(50)      NOT NULL,
  working_hours decimal(8,2)     NOT NULL,
  license_plate varchar(7)       NOT NULL,
  avg_rating    decimal(3,1)     NULL, --set initially to null
  num_ratings   int              NOT NULL,
  phone_num     varchar(10)      NOT NULL
);

-----------------------
-- Create CurrRide table
-----------------------
CREATE TABLE CurrRide 
(
  ride_id            varchar(15)    NOT NULL,
  pickup_location    varchar(50)    NOT NULL,
  destination        varchar(50)    NOT NULL,
  surge              boolean        NOT NULL,
  elapsed_distance   int            NOT NULL,
  elapsed_time       numeric        NOT NULL,
  passenger_id       varchar(15)    NOT NULL,
  driver_id          varchar(15)    NOT NULL
);

-----------------------
-- Create CompleteRide table
-----------------------
CREATE TABLE CompleteRide  
(
  ride_id            varchar(15)    NOT NULL,
  pickup_location    varchar(50)    NOT NULL,
  destination        varchar(50)    NOT NULL,
  surge              boolean        NOT NULL,
  total_distance     int            NOT NULL,
  total_time         numeric        NOT NULL,
  passenger_id       varchar(15)    NOT NULL,
  driver_id          varchar(15)    NOT NULL,
  price              decimal(8,2)   NOT NULL
);

-----------------------
-- Create Car table
-----------------------
CREATE TABLE Car  
(
  license_plate      varchar(7)     NOT NULL, 
  purchase_date      date           NOT NULL,
  curr_condition     varchar(50)    NOT NULL,    
  model_id           varchar(15)    NOT NULL
);

-----------------------
-- Create size_X table
-----------------------
CREATE TABLE size_X  
(
  model_id           varchar(15)    NOT NULL,
  make               varchar(50)    NOT NULL,
  model              varchar(50)    NOT NULL,
  year               int            NOT NULL
);

-----------------------
-- Create size_XL table
-----------------------
CREATE TABLE size_XL  
(
  model_id           varchar(15)    NOT NULL,
  make               varchar(50)    NOT NULL,
  model              varchar(50)    NOT NULL,
  year               int            NOT NULL
);

-----------------------
-- Create card table
-----------------------
CREATE TABLE Card 
(
  card_num           bigint NOT NULL,
  exp_date           date   NOT NULL
);


----------------------
-- Define primary keys
----------------------
ALTER TABLE Passenger ADD PRIMARY KEY (passenger_id);
ALTER TABLE Requests ADD PRIMARY KEY (request_id); 
ALTER TABLE Driver ADD PRIMARY KEY (driver_id);
ALTER TABLE CurrRide ADD PRIMARY KEY (ride_id);
ALTER TABLE CompleteRide ADD PRIMARY KEY (ride_id);
ALTER TABLE Card ADD PRIMARY KEY (card_num);
ALTER TABLE Car ADD PRIMARY KEY (license_plate);
ALTER TABLE size_X ADD PRIMARY KEY (model_id);
ALTER TABLE size_XL ADD PRIMARY KEY (model_id);

----------------------
-- Define foreign keys
----------------------
ALTER TABLE Requests ADD CONSTRAINT FK_Passenger_Requests FOREIGN KEY (passenger_id) REFERENCES Passenger (passenger_id);
ALTER TABLE Passenger ADD CONSTRAINT FK_Card_Passenger FOREIGN KEY (card_num) REFERENCES Card (card_num);
ALTER TABLE Driver ADD CONSTRAINT FK_Car_Driver FOREIGN KEY (license_plate) REFERENCES Car (license_plate);
ALTER TABLE CurrRide ADD CONSTRAINT FK_Passenger_CurrRide FOREIGN KEY (passenger_id) REFERENCES Passenger (passenger_id);
ALTER TABLE CurrRide ADD CONSTRAINT FK_Driver_CurrRide FOREIGN KEY (driver_id) REFERENCES Driver (driver_id);
ALTER TABLE CompleteRide ADD CONSTRAINT FK_Passenger_CompleteRide FOREIGN KEY (passenger_id) REFERENCES Passenger (passenger_id);
ALTER TABLE CompleteRide ADD CONSTRAINT FK_Driver_CompleteRide FOREIGN KEY (driver_id) REFERENCES Driver (driver_id);
