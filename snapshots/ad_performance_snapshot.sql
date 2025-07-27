{% snapshot ad_performance_snapshot %}
  {{
    config(
      target_schema='snapshots',
      target_database='your_db',
      unique_key='ad_id',
      strategy='timestamp',
      updated_at='last_updated'
    )
  }}

  select
    ad_id,
    campaign_id,
    impressions,
    clicks,
    current_timestamp() as last_updated
  from {{ ref('your_source_table') }}
{% endsnapshot %}
