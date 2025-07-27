select
  visit_id,
  user_id,
  session_id,
  visit_timestamp
from external_raw.raw_visits
where
  year='{{ var("year") }}'
  and month='{{ var("month") }}'
  and day='{{ var("day") }}'
