{% macro test_greater_than_zero(model, column) %}
select
  *
from {{ model }}
where {{ column }} <= 0
{% endmacro %}
