
INSERT INTO Card (card_num,exp_date) VALUES
   (1234567891011121, CAST('2019-08-01' AS DATE)),     -- 1
   (1123456789101112, CAST('2020-09-01' AS DATE)),     -- 2
   (2112345678910111, CAST('2021-12-01' AS DATE)),     -- 3
   (1211234567891011, CAST('2027-11-01' AS DATE)),     -- 4
   (1121123456789101, CAST('2024-09-01' AS DATE)),     -- 5
   (1112112345678910, CAST('2023-06-01' AS DATE)),     -- 6
   (1011121123456789, CAST('2015-07-01' AS DATE)),     -- 7
   (9101112112345678, CAST('2023-04-01' AS DATE));     -- 8

INSERT INTO Passenger (passenger_id, fname, lname, phone_num, card_num) VALUES
   (1, 'Barbara', 'Litt', '4129990000', 1234567891011121),       -- 1
   (2, 'James', 'Bond', '4129990001', 1123456789101112),         -- 2
   (3, 'Kim', 'Kardashian', '4129990002', 2112345678910111),     -- 3
   (4, 'Hana', 'Ko', '4129990003', 1211234567891011),            -- 4
   (5, 'Patrick', 'Yang', '4129990004', 1121123456789101),       -- 5
   (6, 'Donald', 'Trump', '4129990005', 1112112345678910),       -- 6
   (7, 'Kendall', 'Jenner', '4129990006', 1011121123456789),     -- 7
   (8, 'Victoria', 'Beckham', '4129990007', 9101112112345678);   -- 8

INSERT INTO size_X (model_id, make, model, year) VALUES
   (1, 'Honda', 'Civic', 1999),          --1
   (2, 'Ford', 'Explorer', 2000),        --2
   (3, 'Lotus', 'Elisa', 1998),          --3
   (4, 'Aston Martin', 'Rapide', 2008),  --4
   (5, 'Audi', 'A4', 2013),                --5
   (6, 'Mini', 'Cooper', 2010),          --6
   (7, 'Nissan', 'Juke', 2011),          --7
   (8, 'Honda' ,'Accord', 2009);         --8

INSERT INTO size_XL (model_id, make, model, year) VALUES
   ('L1', 'Acura', 'RDX', 2007),              --1
   ('L2', 'Buick', 'Enclaves', 2006),         --2
   ('L3', 'Chevrolet', 'Equinox', 2008),      --3
   ('L4', 'Cadillac', 'Escalade', 2008),      --4
   ('L5', 'Cadillac', 'Escalade ESV', 2013),  --5
   ('L6', 'Buick', 'Encore', 2010),           --6
   ('L7', 'BMW', 'X1', 2011),                 --7
   ('L8', 'Acura', 'MDX', 2009);              --8

INSERT INTO Car (license_plate, purchase_date, curr_condition, model_id) VALUES
   ('2FAST4U',CAST('2014-01-01' AS DATE), 'fair', 7),   --1
   ('3HUA172',CAST('2014-10-02' AS DATE), 'new', 'L2'),   --2
   ('BB1B001',CAST('2012-11-01' AS DATE), 'fair', 5),   --3
   ('XCG6033',CAST('2015-01-07' AS DATE), 'new', 1),    --4
   ('BFEJ681',CAST('2013-09-10' AS DATE), 'fair', 8),   --5
   ('BMB6781',CAST('2014-08-17' AS DATE), 'fair', 'L6'),  --6
   ('GHG5269',CAST('2013-02-28' AS DATE), 'new', 4),    --7
   ('5A0J230',CAST('2009-05-23' AS DATE), 'fair', 'L3');  --8

INSERT INTO Driver (driver_id, fname, lname, working_hours, license_plate, avg_rating, num_ratings, phone_num) VALUES
   (1, 'Rheanna', 'Westbrook', 9, '2FAST4U', 4.6, 32, '4129990008'), --1
   (2, 'Loraine', 'Rowland', 4.3, '3HUA172', 1, 12, '4129990009'),   --2
   (3, 'Nova', 'Denman', 6.2, 'BB1B001', 5, 15, '4129990010'),       --3
   (4, 'Steven', 'Spilburgh', 3, 'XCG6033', 4.1, 7, '4129990011'),   --4
   (5, 'Mauricio', 'Wood', 24, 'BFEJ681', 4.9, 89, '4129990012'),    --5
   (6, 'Tom', 'Riddle', 0, 'BMB6781', null, 0, '4129990013'),        --6
   (7, 'John', 'Deer', 27, 'GHG5269', 4.5, 87, '4129990014'),    --7
   (8, 'Ritz', 'Carlton', 15, '5A0J230', 4.3, 64, '4129990015');     --8

INSERT INTO Requests (request_id, pickup_location, destination, request_time, surge, passenger_id) VALUES
   ('1', '123 Robin Court', '234 Main Street', CAST('2015-07-12 01:36:22' AS TIMESTAMP), TRUE, '1'),       --1
   ('2', '13 Broadway Street', '783 Park Street', CAST('2015-12-10 01:40:12' AS TIMESTAMP), FALSE, '2'),   --2
   ('3', '63527 1st Avenue', '2 Main Street', CAST('2015-12-10 02:00:01' AS TIMESTAMP), FALSE, '3'),       --3
   ('4', '27 Bear Road', '827 Park Street', CAST('2015-12-10 02:01:54' AS TIMESTAMP), TRUE, '4'),          --4
   ('5', '666 Forrest Court', '234 Warren Street', CAST('2015-12-10 02:02:17' AS TIMESTAMP), FALSE, '5'),  --5
   ('6', '839 Elm Street', '234 Cherry Street', CAST('2015-12-10 02:05:47' AS TIMESTAMP), TRUE, '6'),      --6
   ('7', '2048 Holly Drive', '224 Ivy Court', CAST('2015-12-10 02:07:21' AS TIMESTAMP), TRUE, '7'),        --7
   ('8', '1526 Willow Lane', '234 Belmont Avenue', CAST('2015-12-10 02:10:34' AS TIMESTAMP), FALSE, '8');  --8

INSERT INTO CurrRide (ride_id, pickup_location, destination, surge, elapsed_distance, elapsed_time, passenger_id, driver_id) VALUES
   ('1', '1 Bob Street','2 Read Street',TRUE,23,25.3,'1','1'),    --1
   ('2', '18 Leaf Avenue','908 Pickle Court',TRUE,3,10.5,'2','2'),     --2
   ('3', '1 Redwood Drive','2 Maple Lane',TRUE,10,5.1,'3','3'),     --3
   ('4', '9183 Academy Street', '41 East Street',TRUE,2,7.0,'4','4'),      --4
   ('5', '83 Blossom Street','63 Margaret Morrison',TRUE,7,6.7,'5','5'),      --5
   ('6', '836 Harrison Avenue','34 Augusta Drive',TRUE,15,6.2,'6','6'),   --6
   ('7', '52 Garfield Street','29 Morewood Avenue',TRUE,19,15.8,'7','7'),  --7
   ('8', '1060 Morewood Avenue','13 Beeler Street',TRUE,20,12.6,'8','8');    --8

INSERT INTO CompleteRide (ride_id, pickup_location, destination, surge, total_distance, total_time, passenger_id, driver_id, price) VALUES
   ('9', '12 Apple Street', '14 Banana Street', TRUE, 3, 10.2, '1','1',6.70),
   ('10', '98 Pear Avenue', '91 Orange', TRUE, 3, 10.2, '2','2',6.70),
   ('11', '3199 Water Avenue', '98 Rain Street', TRUE, 3, 10.2, '3','3',6.70),
   ('12', '19 5th Avenue', '21 Wilkens Street', TRUE, 3, 10.2, '4','4',6.70),
   ('13', '8594 Grape Road', '919 Cantaloupe Street', TRUE, 3, 10.2, '5','5',6.70),
   ('14', '745 Bramblewood Drive', '02 Antler Street', TRUE, 3, 10.2, '6','6',6.70),
   ('15', '17 Cranberry Road', '59 Oak Hill Drive', TRUE, 3, 10.2, '7','7',5.70),
   ('16', '55 Argyle Street', '91 Anchorage Court', TRUE, 3, 10.2, '8','8',6.70);

