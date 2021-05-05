view: service_requests_opensource {
  sql_table_name: `poc-analytics-ai.looker_learning.service_requests_opensource`
    ;;

  dimension: city {
    # type: yesno
    type: string
    sql: ${TABLE}.city ;;
    # sql: ${TABLE}.city = "AUST" OR ${TABLE}.city = "ATX" ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.close_date ;;
  }

  dimension: complaint_description {
    type: string
    sql: ${TABLE}.complaint_description ;;
  }

  dimension: complaint_type {
    type: string
    sql: ${TABLE}.complaint_type ;;
  }

  dimension: council_district_code {
    type: number
    sql: ${TABLE}.council_district_code ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: incident_address {
    type: string
    sql: ${TABLE}.incident_address ;;
  }

  dimension: incident_zip {
    type: number
    sql: ${TABLE}.incident_zip ;;
  }

  dimension_group: last_update {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_update_date ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: map_page {
    type: string
    sql: ${TABLE}.map_page ;;
  }

  dimension: map_tile {
    type: string
    sql: ${TABLE}.map_tile ;;
  }

  dimension: owning_department {
    type: string
    sql: ${TABLE}.owning_department ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: state_plane_x_coordinate {
    type: string
    sql: ${TABLE}.state_plane_x_coordinate ;;
  }

  dimension: state_plane_y_coordinate {
    type: number
    sql: ${TABLE}.state_plane_y_coordinate ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: status_change {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.status_change_date ;;
  }

  dimension: street_name {
    type: string
    sql: ${TABLE}.street_name ;;
  }

  dimension: street_number {
    type: string
    sql: ${TABLE}.street_number ;;
  }

  dimension: unique_key {
    type: string
    sql: ${TABLE}.unique_key ;;
  }

  dimension_group: dtime {
    type: duration
    intervals: [month, year]
    sql_start: ${created_date::date} ;;
    sql_end: ${close_date::date} ;;
  }

  measure: count {
    type: count
    # sql: ${TABLE}.incident_zip ;;
    drill_fields: [street_name]
  }
  measure: average_zip {
    type: average
    sql: ${TABLE}.incident_zip ;;
  }


  # dimension: station_id {
  #   type: number
  #   sql: ${bikeshare_stations_opensource.unique_key} ;;
  # }


}
