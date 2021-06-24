view: derived {
    derived_table: {
      # publish_as_db_view: yes
      explore_source: connection_reg_r3 {
        column: created_at {}
        column: expires_at {}
        column: looker {}
      }
      # datagroup_trigger:akash_test_datagroup
    }
    dimension: created_at {
      type: number
    }
    dimension: expires_at {
      type: number
    }
    dimension: looker {}
    dimension: reg_key {}

}
