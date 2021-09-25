# test: order_id_is_unique {
#   explore_source: posts_answers {
#     column: id {
#     }
#     column: count {}
#     sorts: [posts_answers.count: desc]
#     # limit: 1
#   }
#   assert: order_id_is_unique {
#     # expression: NOT is_null(${posts_answers.id}) ;;
#     expression: ${posts_answers.count} = 1 ;;
#   }
# }

view: posts_answers {
  # view_label: "desired label name"
  sql_table_name: `poc-analytics-ai.stackoverflow.posts_answers`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accepted_answer_id {
    # primary_key: yes
    type: string
    sql: ${TABLE}.accepted_answer_id ;;
    # hidden: yes
  }

  dimension: answer_count {
    type: string
    sql: ${TABLE}.answer_count ;;
  }

  dimension: body {
    type: string
    # type: yesno
    # sql: ${TABLE}.body = "California" OR ${TABLE}.body = "New York" ;;
    sql: ${TABLE}.body ;;
  }

  dimension: comment_count {
    type: number
    sql: ${TABLE}.comment_count ;;
  }

  # dimension: test {
  #   type: string
  #   sql: ${post_questions.body} ;;
  # }

  dimension_group: community_owned {
    type: time
    label: "Test"
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


  dimension_group: time_diff {
    type: duration
    intervals: [
      hour,
      day,
      week
    ]
    drill_fields: [body]
    alias: [time_diff]
    sql_start: ${creation_raw} ;;
    sql_end:  ${community_owned_raw};;
  }

  dimension: created_week {
    type: date_week
    suggest_persist_for: "30 minutes"
    sql: ${TABLE}.creation_date ;;
  }

  dimension: created_year {
    type: date_year
    sql: ${TABLE}.creation_date ;;
  }

  dimension: year_tier {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: classic # the default value, could be excluded
    sql: ${created_year} ;;
  }


  dimension: favorite_count {
    type: string
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


  dimension_group: time_diff3 {
    type: duration
    intervals: [day, hour]
    sql_start: ${creation_raw} ;;
    sql_end: ${last_activity_raw};;
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

  dimension: owner_user_id {
    type: number
    sql: ${TABLE}.owner_user_id ;;
  }

  dimension: parent_id {
    type: number
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

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
    #group_label: "TESTING GROUP LABEL"
  }

  dimension: view_count {
    type: string
    sql: ${TABLE}.view_count ;;
    #group_label: "TESTING GROUP LABEL"
  }

  measure: average_id {
    type: average
    sql: ${TABLE}.id ;;
    #group_label: "TESTING GROUP LABEL"
  }

  measure: count {
    type: count
    drill_fields: [id, owner_display_name, last_editor_display_name,title]
  }

  measure: title_list {
    type: list
    list_field: body
  }
}
