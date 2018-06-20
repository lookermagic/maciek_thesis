connection: "lookerdata_publicdata_standard_sql"

include: "*.view.lkml"

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
