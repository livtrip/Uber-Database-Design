

\echo -----------------------------------------------------------------
\echo  * User Story 1: Driver wants to know whether or not there will be surge 
\echo    pricing to the passengers. 
\echo -----------------------------------------------------------------
\echo
  SELECT request_id, surge 
    FROM Requests;

\echo -----------------------------------------------------------------
\echo  * User Story 2: Manager wants to pull out Nova Denman working hours
\echo -----------------------------------------------------------------
\echo
  SELECT working_hours
    FROM Driver
   WHERE fname='Nova' AND lname='Denman';

\echo -----------------------------------------------------------------
\echo  * User Story 3: Passenger wants to make a request for a ride from 
\echo    1060 Morewood Ave to 418 S Craig Street at 1:14:04 on Nov. 30th, 2015.
\echo -----------------------------------------------------------------
\echo
INSERT INTO Requests VALUES
   (2015, '1060 Morewood Ave', '418 S Craig Street', CAST('2015-11-30 01:14:04' AS TIMESTAMP), False, 1); 

\echo -----------------------------------------------------------------
\echo  * User Story 4: Passenger, James Bond, wants to view previous destinations
\echo -----------------------------------------------------------------
\echo
--4. James Bond view past destinations he has been to(should work, run and see)
    SELECT p.fname, p.lname, c.destination
      FROM CompleteRide AS c
INNER JOIN Passenger AS p ON c.passenger_id = p.passenger_id
     WHERE p.fname = 'James' and p.lname = 'Bond';

\echo -----------------------------------------------------------------
\echo  * User Story 5: Manager wants to view condition of car 3HUA172
\echo -----------------------------------------------------------------
\echo
--5. Manager views condition of a car
    SELECT curr_condition
      FROM Car
     WHERE license_plate = '3HUA172';

\echo -----------------------------------------------------------------
\echo  * User Story 7: Driver wants to view all possible pickup locations
\echo -----------------------------------------------------------------
\echo

SELECT request_id, pickup_location
   FROM Requests;

\echo -----------------------------------------------------------------
\echo  * User Story 8: Driver wants to access a passenger phone number
\echo -----------------------------------------------------------------
\echo
--8. Driver get access to passenger’s number
    SELECT p.fname, p.lname, p.phone_num
      FROM Passenger AS p
INNER JOIN CurrRide AS c ON p.passenger_id = c.passenger_id
     WHERE c.driver_id = '2';

