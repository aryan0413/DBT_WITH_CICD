{%- set apples = ["Gala", "Fuji", "Honeycrisp", "Granny Smith", "Red Delicious"] -%}

{% for i in apples %}

    {% if i != "Gala" %}
        {{ i }}
    {% else %}
        I don't like {{ i }}
    {% endif %}
{% endfor %}

