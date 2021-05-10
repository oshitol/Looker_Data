view: sql_runner_derived_query {
  derived_table: {
    sql: select * from `poc-analytics-ai.looker_learning.bikeshare_stations_opensource`
      ;;
      datagroup_trigger: akash_test_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: station_id {
    type: number
    sql: ${TABLE}.station_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: test_column {
    type: string
    sql: ${TABLE}.test_column ;;
  }

  dimension: column1 {
    type: string
    sql: ${TABLE}.column1 ;;
  }

  dimension: column2 {
    type: string
    sql: ${TABLE}.column2 ;;
  }

  dimension: column3 {
    type: string
    alias: [test]
    sql: ${TABLE}.column3 ;;
  }

  dimension: column4 {
    type: string
    sql: ${TABLE}.column4 ;;
  }

  set: detail {
    fields: [
      station_id,
      name,
      status,
      latitude,
      longitude,
      location,
      test_column,
      column1,
      column2,
      column3,
      column4
    ]
  }
}
