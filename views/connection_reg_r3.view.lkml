view: connection_reg_r3 {
  sql_table_name: `datafusion_test.connection_reg_r3`
    ;;

  dimension: created_at {
    type: number
    alias: [created_att]
    sql: ${TABLE}.created_at ;;
  }

  dimension: expires_at {
    type: number
    sql: ${TABLE}.expires_at ;;
  }

  dimension: looker {
    type: string
    sql: ${created_at::string} ;;
  }

  dimension: reg_key {
    type: string
    sql: ${TABLE}.reg_key ;;
  }

  measure: count {
    type: count
    filters: [expires_at: "1"]
    drill_fields: [expires_at]
  }
}
