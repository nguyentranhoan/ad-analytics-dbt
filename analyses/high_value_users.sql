-- Find users with high engagement
select
  user_id,
  total_hits,
  segment
from {{ ref('user_segments') }}
where segment = 'High'
order by total_hits desc
limit 100
