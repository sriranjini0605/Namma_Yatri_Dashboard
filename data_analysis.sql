--total trips

select count(distinct tripid) as total_trips from trips_details;

--total drivers

select count(distinct driverid)as total_drivers from trips;

-- total earnings

select sum(fare) as total_earnings from trips;

-- total Completed trips

select sum(end_ride) as total_completed_trips from trips_details;

--total searches

select sum(searches) as total_searches,sum(searches_got_estimate) as total_searches_got_estimate,sum(searches_for_quotes) as total_searches_for_quotes,
sum(searches_got_quotes) as total_searches_got_quotes,
sum(customer_not_cancelled) as total_searches_customer_not_cancelled, sum(driver_not_cancelled) as total_searches_driver_not_cancelled,
sum(otp_entered)as total_searches_otp_entered,sum(end_ride)as total_searches_end_ride
from trips_details;


--total searches which got quotes
select sum(searches_got_quotes) as total_searches_got_quotes from trips_details;

--total driver cancelled
select count(*) - sum(driver_not_cancelled) as driver_cancelled from trips_details;

--total customer cancelled
select count(*) - sum(customer_not_cancelled) as customer_cancelled from trips_details;

--total otp entered
select sum(otp_entered) as otp_entered from trips_details;

--total end ride
select sum(end_ride) as total_end_ride from trips_details;

--average distance per trip
select avg(distance) from trips;

--average fare per trip

select sum(fare)/count(*) as average_fare_per_trip from trips;

--distance travelled
select sum(distance) as distance_travelled from trips;

-- which is the most used payment method 

select a.method from payment a
inner join 
(select top 1 faremethod, count(faremethod) cnt from trips
group by faremethod
order by count(faremethod) desc) b
on a.id = b.faremethod;

-- which duration got the highest trips and fares

select * from
(select *, dense_rank() over (order by total_trips,fare desc) rnk 
from
(select duration,count(distinct tripid)total_trips,sum(fare)fare from trips
group by duration
)a)b
where rnk=1

-- which two locations had the most trips

select * from
(select *, dense_rank() over (order by trip desc) rnk 
from
(select loc_from,loc_to,count(tripid)trip from trips
group by loc_from,loc_to
)a)b
where rnk=1

--top 5 earning drivers

select * from
(select *,dense_rank() over (order by total_fare desc) rnk
from
(select driverid,sum(fare) total_fare from trips
group by driverid)a)b
where rnk<=5;

-- which duration had more trips

select * from 
(select *, rank() over (order by total_trip_ids desc) rnk
from
(select duration, count(tripid) as total_trip_ids from trips
group by duration)a)b
where rnk=1;

-- which driver , customer pair had more orders
select * from 
(select *, rank() over (order by cnt desc) as rnk from
(select custid,driverid,count(distinct tripid) as cnt from trips
group by custid, driverid)a)b
where rnk=1;

-- search to estimate rate

select sum(searches_got_estimate) * 100.0 / sum(searches) from trips_details;

-- estimate to search for quote rates

select sum(searches_for_quotes) * 100.0 / sum(searches) from trips_details;

-- which area got highest trips in which duration

select * from
(select *, rank() over (partition by duration order by cnt desc)rnk from
(select duration,loc_from,count(distinct tripid) as cnt from trips
group by duration, loc_from)a)b
where rnk=1;

-- which area got the highest fares, cancellations,trips,

--Highest fares
select * from 
(select *, rank() over (order by fare desc) as rnk from
(select loc_from,sum(fare) as fare from trips
group by loc_from)a)b
where rnk=1;

--Highest cancellations (from driver)
select * from 
(select *, rank() over (order by cancelled desc) as rnk from
(select loc_from,count(*) - sum(driver_not_cancelled) cancelled
from trips_details
group by loc_from)a)b
where rnk=1;
