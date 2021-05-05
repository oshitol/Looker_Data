connection: "analytics-poc-ai"

# include all the views
include: "/views/**/*.view"

datagroup: orders_datagroup {
  sql_trigger: SELECT '1';;
  max_cache_age: "1 hour"
}

persist_with: orders_datagroup

explore: connection_reg_r3 {}

explore: sample {}
