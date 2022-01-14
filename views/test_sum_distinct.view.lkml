# The name of this view in Looker is "Test Sum Distinct"
view: test_sum_distinct {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `poc-analytics-ai.looker_learning.test_sum_distinct`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  measure: total_shipping {
    type: sum_distinct
    sql_distinct_key: ${item_id}  ;;
    sql: ${shipping_amount} ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Item ID" in Explore.

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  measure: sum_item_id {
    type: sum
    filters: [item_id: "!=1 AND !=2"]
    sql: ${item_id} ;;
  }

  dimension: shipping_amount {
    type: number
    sql: ${TABLE}.shipping_amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_shipping_amount {
  #   type: sum
  #   sql: ${groupby.sales_price} ;;
  # }

  measure: average_shipping_amount {
    type: average
    sql: ${shipping_amount} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
