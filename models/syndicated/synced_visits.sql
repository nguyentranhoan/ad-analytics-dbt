select distinct
  visit_id,
  user_id,
  session_id,
  visit_timestamp
from {{ ref('raw/raw_visits') }}
