view: sample {
  sql_table_name: `datafusion_test.sample`
    ;;

  dimension: product_id {
    alias: [test_alias]
    type: string
    primary_key: yes
    sql: ${TABLE}.product_id ;;
  }


  # measure: measure {
  #   type: yesno
  #   sql: ${product_id} ;;
  #   filters: [run_id: "101"]

  # }

  dimension: run_id {
    type: string
    sql: ${TABLE}.run_id ;;
    # required_access_grants: [can_view_body]
  }

  measure: count {
    type: count
    sql: ${product_id} ;;
    drill_fields: [run_id]
  }

  dimension: joined_dim {
    type: string
    sql: comments.user_display_name ;;
  }
}
