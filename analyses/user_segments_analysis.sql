-- User segmentation distribution
select
  segment,
  count(*) as user_count
from {{ ref('user_segments') }}
group by segment
order by user_count desc
