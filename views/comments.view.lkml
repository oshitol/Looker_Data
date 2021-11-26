view: comments {
  sql_table_name: `poc-analytics-ai.stackoverflow.comments`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
      raw
      # time,
      # date,
      # week,
      # month,
      # quarter,
      # year
    ]
    sql: ${TABLE}.creation_date ;;
  }

  # dimension_group: time_diff {
  #   type: duration
  #   sql_start:  ${creation_date} ;;
  #   sql_end: ${creation_date} ;;
  #   intervals: [day]
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
    type: tier
    bins: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
    style: classic
    sql: ${score} ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
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

  measure: count {
    type: count
    drill_fields: [s1*]
    # filters: [comments.post_id :">=10"]
  }

}
