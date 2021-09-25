view: posts_questions {
  sql_table_name: `poc-analytics-ai.stackoverflow.posts_questions`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accepted_answer_id {
    type: number
    sql: ${TABLE}.accepted_answer_id ;;
    # hidden: yes

  }

  dimension: answer_count {
    type: number
    sql: ${TABLE}.answer_count ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: modified_body {
    type: string
    sql: concat('akash' ,'-', ${TABLE}.body) ;;
  }

  filter: order_region {
    type: string
    sql: {% condition order_region %} ${body} {% endcondition %} ;;
  }

  dimension: comment_count {
    type: number
    sql: ${TABLE}.comment_count ;;
  }

  dimension_group: community_owned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.community_owned_date ;;
  }

  dimension_group: creation {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.creation_date ;;
  }

  dimension: favorite_count {
    type: number
    sql: ${TABLE}.favorite_count ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension_group: last_edit {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_edit_date ;;
  }

  dimension: last_editor_display_name {
    type: string
    sql: ${TABLE}.last_editor_display_name ;;
  }

  dimension: last_editor_user_id {
    type: number
    sql: ${TABLE}.last_editor_user_id ;;
  }

  dimension: owner_display_name {
    type: string
    sql: ${TABLE}.owner_display_name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.owner_user_id ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: post_type_id {
    type: number
    sql: ${TABLE}.post_type_id ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: question_title {
    type: string
    # alias:[title]
    sql: ${TABLE}.title ;;
  }

  dimension: view_count {
    type: number
    sql: ${TABLE}.view_count ;;
  }

  measure: count {
    type: count
    drill_fields: [id, owner_display_name, last_editor_display_name]
  }

  # measure: row_count {
  #   type: count
  #   sql:  1;;
  #   drill_fields: [answer_count]
  # }
  # required_access_grants: [can_view_body_attribute]

}
