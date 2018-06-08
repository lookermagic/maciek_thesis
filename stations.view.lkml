view: stations {
  sql_table_name: noaa_thesis.stations ;;

  dimension: call_sign {
    type: string
    sql: ${TABLE}.call ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: elevation {
    type: string
    sql: CAST(REGEXP_EXTRACT(${TABLE}.elev,r"[0-9+-.]+") AS FLOAT64) ;;
    label: "Elevation (m)"
  }

  dimension_group: begin {
    type: time
    datatype: yyyymmdd
    timeframes: [year, month, month_name, date]
    sql: CAST(${TABLE}.begin AS INT64) ;;
  }

  dimension_group: end {
    type: time
    datatype: yyyymmdd
    timeframes: [year, month, month_name, date]
    sql: CAST(${TABLE}.`end` AS INT64) ;;
  }

  dimension: location {
    type: location
    sql_latitude: ROUND(${TABLE}.lat,1) ;;
    sql_longitude: ROUND(${TABLE}.lon,1) ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: usaf {
    type: string
    sql: ${TABLE}.usaf ;;
  }

  dimension: wban {
    type: string
    sql: ${TABLE}.wban ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_elevation {
    type: average
    sql: ${elevation} ;;
    value_format_name: decimal_1
    drill_fields: [detail*]
  }

  measure: max_elevation {
    type:  max
    sql: ${elevation} ;;
    value_format_name: decimal_1
    drill_fields: [detail*]
  }

  measure: min_elevation {
    type:  min
    sql: ${elevation} ;;
    value_format_name: decimal_1
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      name,
      call_sign,
      state,
      country,
      location,
      elevation,
      begin_date,
      end_date
    ]
  }
}
