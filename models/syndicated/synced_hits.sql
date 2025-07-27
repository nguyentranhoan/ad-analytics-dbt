select distinct
  hit_id,
  user_id,
  session_id,
  impressions,
  clicks,
  hit_timestamp
from {{ ref('raw/raw_hits') }}
