SELECT * FROM uber.`uber data`;

-- Trip Status Distribution
SELECT Status, COUNT(*) AS total_trips
FROM `uber`.`uber data`
GROUP BY Status;

-- Pickup Point-wise Cancellation
SELECT pickup_point, Status, COUNT(*) AS total
FROM `uber`.`uber data`
WHERE Status != 'Trip Completed'
GROUP BY pickup_point, Status;

-- SELECT `Gap Type`, COUNT(*) AS total_gaps
SELECT `Request Hour`, COUNT(*) AS total_requests
FROM  `uber`.`uber data`
GROUP BY `Request Hour`
ORDER BY total_requests DESC;

-- Daypart Demand Analysis
SELECT Daypart, COUNT(*) AS total_requests
FROM  `uber`.`uber data`
GROUP BY Daypart
ORDER BY total_requests DESC;


SELECT 
    (SELECT COUNT(*) FROM `uber`.`uber data` WHERE Status = 'Cancelled') AS cancelled_trips,
    (SELECT COUNT(*) FROM `uber`.`uber data`) AS total_trips,
    ROUND((SELECT COUNT(*) FROM `uber`.`uber data` WHERE Status = 'Cancelled') / 
          (SELECT COUNT(*) FROM `uber`.`uber data`) * 100, 2) AS cancellation_rate_percent;

-- Driver Availability
SELECT COUNT(*) AS no_cars_available
FROM `uber`.`uber data`
WHERE Status = 'No Cars Available';

-- Driver-wise Completed Trips
SELECT driver_id, COUNT(*) AS completed_trips
FROM `uber`.`uber data`
WHERE Status = 'Trip Completed'
GROUP BY driver_id
ORDER BY completed_trips DESC;

--  City vs Airport Total Demand
SELECT pickup_point, COUNT(*) AS total_requests
FROM `uber`.`uber data`
GROUP BY pickup_point
ORDER BY total_requests DESC;

-- Total number of requests
SELECT COUNT(*) AS total_requests
FROM `uber`.`uber data`;


--  Number of completed trips
SELECT COUNT(*) AS completed_trips
FROM `uber`.`uber data`
WHERE Status = 'Trip Completed';

-- Number of cancelled trips
SELECT COUNT(*) AS cancelled_trips
FROM `uber`.`uber data`
WHERE Status = 'Cancelled';



