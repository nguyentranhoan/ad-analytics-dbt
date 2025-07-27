with user_hits as (
  select
    user_id,
    count(*) as total_hits
  from {{ ref('synced_hits') }}
  group by user_id
)

select
  user_id,
  case
    when total_hits > 1000 then 'High'
    when total_hits between 500 and 1000 then 'Medium'
    else 'Low'
  end as segment
from user_hits
with user_hits as (
  select
    user_id,
    count(*) as total_hits
  from {{ ref('synced_hits') }}
  group by user_id
)

select
  user_id,
  case
    when total_hits > 1000 then 'High'
    when total_hits between 500 and 1000 then 'Medium'
    else 'Low'
  end as segment
from user_hits
