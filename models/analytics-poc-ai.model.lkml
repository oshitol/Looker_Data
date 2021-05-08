connection: "analytics-poc-ai"

# include all the views
include: "/views/**/*.view"


datagroup: akash_test_datagroup {
  sql_trigger: SELECT max(id) FROM `poc-analytics-ai.looker_learning.pdt_sql_trigger_check`;;
  max_cache_age: "100 minutes"
}

datagroup: analytics {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

# persist_with: analytics-poc-ai_default_datagroup

explore: connection_reg_r3 {
  # persist_with: analytics
  # # persist_for: "2 hour"
}

explore: test_derived_table {}

explore: service_requests_opensource {}

# explore: service_requests_opensource {
#   join: bikeshare_stations_opensource {
#     type: left_outer
#     sql_on: ${service_requests_opensource.longitude} = ${bikeshare_stations_opensource.longitude};;
#   }
# }

explore: sample {}

explore: games_post_wide_opensource {}

explore: bikeshare_stations_opensource {}

explore: comments {
  label: "StackOverFlow Comments"
}

explore: posts_answers {
  label: "StackOverFlow Post Answers"
  persist_for: "10 minutes"
}

explore: posts_questions {
  label: "StackOverFlow Post Questions"
}


explore: stackoverflow_posts {
  join: posts_answers {
    # outer_only: yes
    type: left_outer
    relationship: one_to_many
    # foreign_key: owner_user_id
    sql_on: ${stackoverflow_posts.owner_user_id} = ${posts_answers.owner_user_id};;
  }

  join: posts_questions {
    type: left_outer
    relationship: one_to_many
    # required_joins: [posts_answers]
    sql_on: ${posts_questions.user_id} = ${stackoverflow_posts.owner_user_id};;
  }

  # conditionally_filter: {
  #   filters: [id: "1"]
  #   unless: [owner_user_id,body,comment_count,parent_id,id]
  # }
  always_filter: {
    filters: [id: "123"]
  }
  # sql_always_where: ${owner_user_id} >= '1' ;;

  # access_filter: {
  #   field: body
  #   user_attribute: number_format
  # }
  label: "StackOverFlow Posts"
}



# explore: stackoverflow_posts {
#   join: posts_answers {
#     type: left_outer
#     # sql_table_name:posts_questions;;
#     # outer_only: yes
#     relationship: one_to_many
#     sql_on: ${stackoverflow_posts.owner_user_id} = ${posts_answers.owner_user_id};;
#     # foreign_key: owner_user_id
#     #view_label: "desired label for the view"
#     # fields: [answer_count]
#   }
#   label: "StackOverFlow POSTS TEST"
# }







# explore: posts_tag_wiki {
#   join: posts_tag_owner_user_id {
#     from: posts_tag_wiki_excerpt
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${posts_tag_wiki.owner_user_id} = ${posts_tag_owner_user_id.owner_user_id};;
#   }

#   join: posts_tag_accepted_answer_id {
#     from:posts_tag_wiki_excerpt
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${posts_tag_wiki.accepted_answer_id} = ${posts_tag_accepted_answer_id.accepted_answer_id};;
#   }

  # join: posts_wiki_placeholder {
  #   type: left_outer
  #   relationship: one_to_many
  #   sql_on: ${posts_wiki_placeholder.owner_user_id} = ${posts_tag_wiki_excerpt.owner_user_id};;
  # }
  # label: "StackOverFlow Post Tag WIKI"
#}








# explore: posts_tag_wiki {
#   join: posts_tag_wiki_excerpt {
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${posts_tag_wiki.owner_user_id} = ${posts_tag_wiki_excerpt.owner_user_id};;
#   }

#   join: posts_wiki_placeholder {
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${posts_wiki_placeholder.owner_user_id} = ${posts_tag_wiki_excerpt.owner_user_id};;
#   }
#   label: "StackOverFlow Post Tag WIKI"
# }


explore: posts_tag_wiki_excerpt {

  # access_filter: {
  #   field: posts_tag_wiki_excerpt.body
  #   user_attribute: akash_test_attribute
  # }
  # access_filter: {
  #   field: posts_tag_wiki_excerpt.accepted_answer_id
  #   user_attribute: akash_test_attribute
  # }
  required_access_grants: [can_view_body]
  # label: "StackOverFlow Post Tag WIKI EXCERPT"
}
explore: posts_wiki_placeholder{
  label: "StackOverFlow Post Tag WIKI PLACEHOLDER"
}
access_grant: can_view_body {
  user_attribute: akash_test_attribute
  allowed_values: ["allowed"]
}

access_grant: can_view_body_attribute {
  user_attribute: akash_test_attribute
  allowed_values: ["allowe"]
}
