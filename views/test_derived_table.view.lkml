# If necessary, uncomment the line below to include explore_source.

# include: "analytics-poc-ai.model.lkml"

view: test_derived_table {
  derived_table: {
    persist_for: "10 minutes"
    explore_source: service_requests_opensource {
      column: complaint_type {
        field: service_requests_opensource.complaint_type
      }
      column: complaint_description {}
      column: council_district_code {}
      column: county {}
      derived_column: average_customer_order {
        sql:  concat(complaint_type,'+',county) ;;
      }

      # filters: [service_requests_opensource.complaint_type: "90 days",service_requests_opensource.complaint_description: "90 days"]
    }
  }
  dimension: complaint_type {}
  dimension: complaint_description {}
  dimension: council_district_code {
    type: number
  }
  dimension: county {}
  dimension: average_customer_order {}
}
