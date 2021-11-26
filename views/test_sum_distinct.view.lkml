view: test_sum_distinct {
  sql_table_name: `poc-analytics-ai.looker_learning.test_sum_distinct`
    ;;
  drill_fields: [id]

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: shipping_amount {
    type: number
    sql: ${TABLE}.shipping_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  # measure: total_shipping {
  #   type: sum
  #   sql: ${shipping_amount} ;;
  # }
  measure: total_shipping {
    type: sum_distinct
    sql_distinct_key: ${item_id} ;;
    sql: ${shipping_amount} ;;
  }



}
