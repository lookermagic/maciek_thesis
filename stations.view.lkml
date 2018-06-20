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

  dimension: decade_began {
    type: tier
    tiers: [1900,1910,1920,1930,1940,1950,1960,1970,1980,1990,2000,2010,2020]
    sql: SAFE_CAST( SUBSTR(${TABLE}.begin, 1, 4) AS INT64) ;;
  }

  dimension_group: end {
    type: time
    datatype: yyyymmdd
    timeframes: [year, month, month_name, date]
    sql: CAST(${TABLE}.`end` AS INT64) ;;
  }

  dimension: years_operating {
    type: number
    sql: ${end_year} - ${begin_year} ;;
  }

  dimension: location {
    type: location
    sql_latitude: ROUND(${TABLE}.lat,1) ;;
    sql_longitude: ROUND(${TABLE}.lon,1) ;;
    drill_fields: [detail_no_geo*]
  }

  dimension: rough_location {
    type: location
    sql_latitude: ROUND(${TABLE}.lat,0) ;;
    sql_longitude: ROUND(${TABLE}.lon,0) ;;
    drill_fields: [detail_no_geo*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Search on station name"
      url: "http://google.com/search?q={{value}}+weather+station"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: buoy_id {
    type: string
    sql:  REGEXP_EXTRACT(${name}, r"BUOY ([0-9]+)") ;;
    link: {
      label: "buoy"
      url: "http://www.ndbc.noaa.gov/station_page.php?station={{value}}"
      icon_url: "https://www.wrh.noaa.gov/favicon.ico"
    }

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

  dimension: is_buoy {
    type: yesno
    sql: name LIKE '%BUOY%' ;;
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

  set: detail_no_geo {
    fields: [
      name,
      call_sign,
      country,
      elevation,
      begin_date,
      end_date
    ]
  }

}
