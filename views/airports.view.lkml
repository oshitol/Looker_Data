# The name of this view in Looker is "Airports"
view: airports {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `poc-analytics-ai.alaska_airlines.airports`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Destination Airport Name" in Explore.

  dimension: destination_airport_name {
    type: string
    sql: ${TABLE}.destination_airport_name ;;
  }

  dimension: destination_city {
    type: string
    sql: ${TABLE}.destination_city ;;
  }

  dimension: destination_latitude {
    type: number
    sql: ${TABLE}.destination_latitude ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_destination_latitude {
    type: sum
    sql: ${destination_latitude} ;;
  }

  measure: average_destination_latitude {
    type: average
    sql: ${destination_latitude} ;;
  }

  dimension: destination_longitude {
    type: number
    sql: ${TABLE}.destination_longitude ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: flight {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.flight_date ;;
  }

  dimension: origin_airport_name {
    type: string
    sql: ${TABLE}.origin_airport_name ;;
  }

  dimension: origin_city {
    type: string
    sql: ${TABLE}.origin_city ;;
  }

  dimension: origin_latitude {
    type: number
    sql: ${TABLE}.origin_latitude ;;
  }

  dimension: origin_longitude {
    type: number
    sql: ${TABLE}.origin_longitude ;;
  }

  measure: count {
    type: count
    drill_fields: [id, origin_airport_name, destination_airport_name]
  }
}
