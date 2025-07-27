{% macro label(value) %}
  {% if value is not none %}
    {{ value | upper }}
  {% else %}
    NULL
  {% endif %}
{% endmacro %}
