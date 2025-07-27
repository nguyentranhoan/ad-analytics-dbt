select distinct
  impression_id,
  ad_id,
  impression_timestamp
from {{ ref('raw/raw_impressions') }}
