select
  date_trunc('day', hit_timestamp) as date,
  count(hit_id) as total_hits,
  (
    select count(*) from {{ ref('synced_impressions') }}
    where date_trunc('day', impression_timestamp) = date
  ) as total_impressions
from {{ ref('synced_hits') }}
group by 1
