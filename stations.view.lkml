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
    sql: ${TABLE}.elev ;;
    label: "Elevation (m)"
  }

  dimension_group: begin {
    type: time
    datatype: yyyymmdd
    timeframes: [year, month, month_name, raw]
    sql: ${TABLE}.begin ;;
  }

  dimension_group: end {
    type: time
    datatype: yyyymmdd
    timeframes: [year, month, month_name, raw]
    sql: ${TABLE}.`end` ;;
  }

  dimension: latitutde {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.lon ;;
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
    drill_fields: [name]
  }
}
