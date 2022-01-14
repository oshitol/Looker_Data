view: comments {
  sql_table_name: `poc-analytics-ai.stackoverflow.comments`
    ;;
  drill_fields: [id]
  set: my_set {
    fields: [total_sales_price]
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: new_id {
    type: yesno
    sql: ${id} ;;
  }

  measure: total_sales_price {
    type: sum
    sql: ${new_id} ;;
  }


  filter: display_name {
    default_value: "Akash"
  }

  parameter: metric_selection {
    type: string
    allowed_value: {
      label: "Sold Count"
      value: "sold_count"
    }
    allowed_value: {
      label: "Sold Percent"
      value: "sold_percent"
    }

  }

  dimension_group: creation {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.creation_date ;;
  }

  # dimension: dgt {
  #   type: number
  #   sql:${creation} ;;
  # }

  dimension: creation_string {
    type: string
    sql: ${creation_raw} ;;
  }




  # measure: bad_measure {
  #   type: number
  #   sql: ${post_id} + ${count} ;;
  # }

  # measure: count_post_id {
  #   type: sum
  #   sql: ${post_id} ;;
  # }

  # measure: good_measure {
  #   type: number
  #   sql: ${count_post_id} + ${count} ;;
  # }

  dimension: post_id {
    type: number
    sql: ${TABLE}.post_id ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: bin_score {
    type: tier tiers: [0,30,60]
    style: classic sql: ${score} ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
    link: {
      label: "LINK"
      url: "https://mediaagility.looker.com/explore/analytics-poc-ai/test_sample"
    }
  }

  dimension: user_display_name {
    type: string
    sql: ${TABLE}.user_display_name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  set: s1 {
    fields: [score,text,user_display_name]
  }

  # measure: convert_count {
  #   type: number
  #   sql: ${count} ;;
  # }

  # measure: akash {
  #   type: number
  #   sql: ${count_post_id} + ${count} ;;
  # }

  # measure: avg {
  #   type: sum
  #   sql: ${count} ;;
  # }

  measure: sum_id {
    type: number
    sql: SUM(${id}) ;;
  }

  # measure: count_sum_id {
  #   type: sum
  #   sql: ${sum_id} ;;
  # }


  measure: count {
    type: count
    drill_fields: [s1*]
    # filters: [comments.post_id :">=10"]
  }

}
