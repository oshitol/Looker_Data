view: looker_yesno {
  sql_table_name: `poc-analytics-ai.looker_learning.looker_yesno`
    ;;

  dimension: data_values1 {
    type: string
    alias: [data_values]
    sql: ${TABLE}.data_values;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
