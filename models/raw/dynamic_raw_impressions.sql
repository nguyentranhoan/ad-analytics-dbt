select
  impression_id,
  ad_id,
  impression_timestamp
from external_raw.raw_impressions
where
  year='{{ var("year") }}'
  and month='{{ var("month") }}'
  and day='{{ var("day") }}'
