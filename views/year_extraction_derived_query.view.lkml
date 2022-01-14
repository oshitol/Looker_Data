view: sql_runner_query {
  derived_table: {
    sql: WITH get_first_query AS (SELECT
          service_requests_opensource.city  AS service_requests_opensource_city,
              (DATE(service_requests_opensource.created_date , 'America/Los_Angeles')) AS service_requests_opensource_created_date
      FROM `poc-analytics-ai.looker_learning.service_requests_opensource`
           AS service_requests_opensource
      GROUP BY
          1,
          2
      ORDER BY
          2 DESC
      LIMIT 500),

      get_second_query AS (
      SELECT CONCAT(% sql_runner_query.year%,"-01-01") AS date_new
      )



      SELECT * FROM get_second_query
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date_new ;;
  }

  dimension: service_requests_opensource_city {
    type: string
    sql: ${TABLE}.service_requests_opensource_city ;;
  }

  dimension: year {
    type: number
    sql: EXTRACT( YEAR FROM ${service_requests_opensource_created_date_date}) ;;
  }

  dimension_group: service_requests_opensource_created_date {
    type: time
    timeframes: [date]
    datatype: date
    sql: ${TABLE}.service_requests_opensource_created_date ;;
  }

  set: detail {
    fields: [service_requests_opensource_city, service_requests_opensource_created_date_date]
  }
}
