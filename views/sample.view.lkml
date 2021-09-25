view: sample {
  sql_table_name: `datafusion_test.sample`
    ;;

  dimension: product_id {
    alias: [test_alias]
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: run_id {
    type: string
    sql: ${TABLE}.run_id ;;
  }

  measure: count {
    type: count
    drill_fields: [run_id]
  }
}
