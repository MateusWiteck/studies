-- 6. Consider the year 2003. Separately for phone rate and month, analyze the (i) average daily income
-- and the (ii) average income for number of calls.

select datemonth, PHONERATETYPE, sum(price)/ sum(NUMBEROFCALLS)  as average_income_per_calls, sum(price)/count(daydate) as average_income_per_calls
    from facts
    inner join timedim on facts.ID_TIME = timedim.ID_TIME
    inner join phonerate on facts.ID_PHONERATE = phonerate.ID_PHONERATE
where dateyear = 2003
group by datemonth, PHONERATETYPE;


-- 7. Select the daily number of calls for each caller region and the daily number of calls for each caller
-- province.

-- Solution 1:
select REGION, Province, sum(NUMBEROFCALLS) / count(distinct daydate)
from facts
    inner join location on facts.ID_LOCATION_CALLER = location.ID_LOCATION
    inner join timedim on facts.id_time = timedim.id_time
group by rollup (REGION, Province);


-- Solution 2:

SELECT Region, Province, SUM(SUM(NumberOfCalls)) OVER (PARTITION BY Region)/COUNT(DISTINCT DayDate), SUM(NumberOfCalls)/COUNT(DISTINCT DayDate)
FROM facts F, TimeDim T, Location L
WHERE F.Id_time = T.Id_time and F.id_location_caller = L.id_location
GROUP BY Region, Province


-- 8. Consider the year 2003. Separately for phone rate and month, analyze the
-- (i) total income,
-- (ii) the percentage of income with respect to the total revenue considering all the phone rates,
-- (iii) the percentage of income with respect to the total revenue considering all the months.
--

select PHONERATETYPE, DATEMONTH,
    sum(price) as total_income,
    100 * sum(price) / sum(sum(price)) over (partition by PHONERATETYPE) as phonerate_percent_in_this_month,
    100 * sum(price) / sum(sum(price)) over (partition by DATEMONTH) as month_percent_in_this_phoneratetype
from facts
    inner join phonerate on facts.id_phonerate = phonerate.id_phonerate
	inner join timedim on facts.id_time = timedim.id_time
where dateyear = 2003
group by PHONERATETYPE, DATEMONTH


-- 9. For each caller province, analyze
-- (i) the total number of calls
-- (ii) the percentage of number of calls with respect to the total number of calls considering the corresponding region.

select region, province,
    sum(numberofcalls) as province_num_calls,
    sum(numberofcalls) / sum(sum(numberofcalls)) over (partition by region)
from facts
	inner join location on facts.ID_location_Caller = location.ID_location
group by region, province


-- 10. For each receiver region, select the monthly number of calls and the cumulative monthly number of
-- calls from the beginning of the year.


select Region, dateyear, datemonth,
    sum(numberofcalls) as num_calls,
    sum(sum(numberofcalls)) over (
    	partition by dateyear, Region
    	order by datemonth
    	rows between unbounded preceding and current row)
	    as year_cumulative
from facts
	inner join location on facts.ID_location_Receiver = location.ID_location
    inner join timedim on facts.id_time = timedim.id_time
group by dateyear, datemonth, Region






