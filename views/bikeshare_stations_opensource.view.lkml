view: bikeshare_stations_opensource {
  sql_table_name: `poc-analytics-ai.looker_learning.bikeshare_stations_opensource`
    ;;

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;

  }

  dimension: get_first_day_of_month {
    type: date
    sql: CURRENT_TIMESTAMP() ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name1 {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: station_id {
    type: number
    sql: ${TABLE}.station_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: test_column {
    type: string
    sql: ${TABLE}.test_column ;;
  }

  # measure: row_count {
  #   type: count
  #   sql:  1;;
  #   drill_fields: [ station_id, name, status, latitude, longitude, location, test_column]
  # }

  # set: ib_product_drill_list {
  #   # fields: [id, serial_number, product_type, source_facility, end_user_name,end_user_name_quality, end_user_country_name, customer_name, customer_name_quality, sales_region, year, install_date, order_booked_date, order_ship_date, market, segment, brand, quantity, api, clean_or_contaminated, year_range, quantity, end_user_tier, end_user_tier_quality, customer_tier_quality, customer_tier, api_code, site, site_location, operational_units, sales_sub_region]
  #   fields:[ station_id, name, status, latitude, longitude, location, test_column]
  # }



}
