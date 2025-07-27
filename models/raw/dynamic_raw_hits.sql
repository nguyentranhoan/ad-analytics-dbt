-- Raw data query, filtered by date variables
select
  hit_id,
  user_id,
  session_id,
  impressions,
  clicks,
  hit_timestamp
from external_raw.raw_hits
where
  year='{{ var("year") }}'
  and month='{{ var("month") }}'
  and day='{{ var("day") }}'
