WITH daily_weather_CTE AS(

select

date(time) as daily_weather,
weather,
temp,
pressure,
humidity,
clouds

from
{{ source('demo', 'weather') }}


),

daily_weather_agg as (

select 
daily_weather,
weather,
--count(weather),
round(avg(temp), 2) AS AVG_temp,
round(avg(pressure),2) AS AVG_pressure,
round(avg(humidity), 2) AS AVG_Humidity,
round(avg(clouds)) AS AVG_clouds
--row_number() over (partition by daily_weather order by count(weather) desc) as ROW_NUMBER

from daily_weather_CTE 

group by daily_weather, weather

qualify ROW_NUMBER() over (partition by daily_weather order by count(weather) desc) = 1
)

SELECT 
* 
FROM daily_weather_agg 