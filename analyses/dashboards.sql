-- Sample: Summary dashboard for daily hits and impressions

select
  date,
  sum(total_hits) as total_hits,
  sum(total_impressions) as total_impressions
from {{ ref('daily_hits_impressions') }}
group by date
order by date desc
