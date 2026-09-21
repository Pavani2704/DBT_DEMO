WITH BIKE AS(

select
distinct 
start_statio_id as station_id,
start_station_name as station_name,
start_lat as station_lat,
start_lng as station_lng

from
{{ source('demo', 'bike') }}

limit 10
)

SELECT 
* 
FROM BIKE