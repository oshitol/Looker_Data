view: add_a_unique_name_1620820995 {
  derived_table: {
    datagroup_trigger: test_dg
    explore_source: posts_answers {
      column: body {}
      column: creation_year {}
      column: creation_month {}
      column: count {}
    }
  }
  dimension: body {}
  dimension: creation_year {
    type: date_year
  }
  dimension: creation_month {
    type: date_month
  }
  dimension: count {
    type: number
  }
}
