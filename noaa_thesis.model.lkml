connection: "lookerdata_publicdata_standard_sql"

include: "*.view.lkml"         # include all views in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: stations {
  sql_always_where: ${location} IS NOT NULL ;;
}

explore: gsod {
  join: stations {
    type: left_outer
    sql_on: ${gsod.stn} = ${stations.usaf} AND ${gsod.wban} = ${stations.wban};;
    relationship: many_to_one
  }
}

explore: hail_reports {
  join: stations {
    type: left_outer
    sql_on: ${hail_reports.location} = ${stations.location} ;;
    relationship: many_to_many
  }
  join: gsod {
    type: inner
    sql_on:  ${hail_reports.location} = ${stations.location}
      AND ${gsod.stn} = ${stations.usaf}
      AND ${gsod.wban} = ${stations.wban}
      AND ${hail_reports.timestamp_date} = ${gsod.date_date} ;;
    relationship: many_to_many
  }
}
