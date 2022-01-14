view: service_requests_opensource {
  sql_table_name: `poc-analytics-ai.looker_learning.service_requests_opensource`
    ;;


  # suggestions: no

  dimension: city {
    # type: yesno
    type: string
    sql: ${TABLE}.city ;;
  }

  filter: order_region {
    default_value: "Northeast"
  }

  parameter: order_count {
    type: string
    allowed_value: {
      label: "test"
      value: "<500"
    }
    full_suggestions: no
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
    suggest_dimension: comments.text
    suggest_explore: comments
    # suggestable: no
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
    # suggest_explore: post_answers
    # suggest_dimension: post_answers.favorite_count
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
    group_label: "Incident"
    group_item_label: "Address"
    suggestable: no

    type: string
    sql: ${TABLE}.incident_address ;;
  }

  dimension: incident_zip {
    group_label: "Incident"
    group_item_label: "ZIP"
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


  dimension: case_check {
    case: {
      when: {
        sql: ${street_name}="Akash" ;;
        label: "Label of Condition"
      }
      # possibly more when statements
      else: "Label If No Condition Met"
    }
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




  measure: lst {
    type: list
    list_field: street_name
  }

  measure: count {
    type: count
    sql: ${council_district_code} ;;
    drill_fields: [street_name]
  }

  measure: average_zip {
    type: average
    sql: ${incident_zip} ;;
  }

  measure: sum_longitutde {
    type: sum
    sql: ${longitude} ;;
  }

  measure: new_count {
    type: average
    sql: ${latitude}  ;;
  }

  measure: bad_measure {
    type: number
    sql: ${sum_longitutde}  + ${sum_cdc} ;;

  }
  measure: sum_cdc {
    type: sum
    sql: ${council_district_code} ;;
    # filters: [order_count: "{ % order_count % }"]
  }
}
