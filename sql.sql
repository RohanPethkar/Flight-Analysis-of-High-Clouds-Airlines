# Some KPI's

# 1. Find the load Factor percentage on a yearly , Quarterly , Monthly basis ( Transported passengers / Available seats)

select Year,sum(`# Transported Passengers`/`# Available Seats`)*100 as LoadfactorPercentage
from maindata_final
group by Year;

select `Month (#)`,sum(`# Transported Passengers`/`# Available Seats`)*100 as LoadfactorPercentage
from maindata_final
group by `Month (#)`;
#--------------------------------------------------------------------------------------------

#2. Find the load Factor percentage on a Carrier Name basis ( Transported passengers / Available seats)
select `Carrier Name`,
(`# Transported Passengers`/`# Available Seats`)*100 as Load_factorpercentage
from maindata_final;
#--------------------------------------------------------------------------------------------

#3. Identify Top 10 Carrier Names based passengers preference 
Select 
`Carrier Name`,
sum(`# Transported Passengers`) as PassengersPreference
from maindata_final 
group by `Carrier Name`
limit 10;
#--------------------------------------------------------------------------------------------

#4. Display top Routes ( from-to City) based on Number of Flights 
select `From - To City`,count(`# Transported Freight`) as Number_of_Flights
from maindata_final
group by `From - To City`;
#--------------------------------------------------------------------------------------------

#5. Identify the how much load factor is occupied on Weekend vs Weekdays.
select
case
	when weekday(concat(Year,'-',`Month (#)`,'-',Day)) <= 5 then 'Weekday'
    else 'Weekend'
end as daytype,
sum(`# Transported Passengers`/`# Available Seats`)*100 as Loadfactorpercentage
from maindata_final
group by daytype ;
  #--------------------------------------------------------------------------------------------  

#6. Identify number of flights based on Distance groups
SELECT 
distancegroups.`Distance Interval`,
count(maindata_final.`# Transported Freight`) as Number_of_flights
FROM maindata_final
INNER JOIN distancegroups ON maindata_final.`%Distance Group ID` = distancegroups.`%Distance Group ID`
group by `Distance Interval`;
#--------------------------------------------------------------------------------------------