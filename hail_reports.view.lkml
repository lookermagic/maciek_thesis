view: hail_reports {
  sql_table_name: noaa_thesis.hail_reports ;;

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location_name{
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude: ROUND(${latitude},1) ;;
    sql_longitude: ROUND(${longitude},1) ;;
  }

  dimension: rough_location {
    description: "Location to within 1˚ lat/lon"
    type: location
    sql_latitude: ROUND(${latitude},0) ;;
    sql_longitude: ROUND(${longitude},0) ;;
  }

  dimension: size {
    label: "Size (1/100ths inch)"
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      day_of_year,
      week_of_year,
      month_num,
      month_name,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [detail_average*]
  }

  measure: average_size {
    label: "Average size (1/100ths inch)"
    type: average
    sql:  ${size} ;;
    value_format_name: decimal_1
    drill_fields: [detail*]
  }

  set: detail_average {
    fields: [
      timestamp_date,
      average_size,
    ]
  }

  set: detail {
    fields: [
      timestamp_date,
      county,
      state,
      size
    ]
  }

}
