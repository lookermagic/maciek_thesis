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
    case: {
      when: {
        sql: ${begin_year} < 1930 ;;
        label: "1920s"
      }
      when: {
        sql: ${begin_year} >= 1930 AND ${begin_year} < 1940 ;;
        label: "1930s"
      }
      when: {
        sql: ${begin_year} >= 1940 AND ${begin_year} < 1950 ;;
        label: "1940s"
      }
      when: {
        sql: ${begin_year} >= 1950 AND ${begin_year} < 1960 ;;
        label: "1950s"
      }
      when: {
        sql: ${begin_year} >= 1960 AND ${begin_year} < 1970 ;;
        label: "1960s"
      }
      when: {
        sql: ${begin_year} >= 1970 AND ${begin_year} < 1980 ;;
        label: "1970s"
      }
      when: {
        sql: ${begin_year} >= 1980 AND ${begin_year} < 1990 ;;
        label: "1980s"
      }
      when: {
        sql: ${begin_year} >= 1990 AND ${begin_year} < 2000 ;;
        label: "1990s"
      }
      when: {
        sql: ${begin_year} >= 2000 AND ${begin_year} < 2010 ;;
        label: "2000s"
      }
      when: {
        sql: ${begin_year} >= 2010 AND ${begin_year} < 2020 ;;
        label: "2010s"
      }
      else: "Other"
    }
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

  dimension: latitude {
    type: number
    sql: ROUND(${TABLE}.lat,0) ;;
  }

  dimension: climate_band {
    case: {
      when: {
        sql:  ${TABLE}.lat > 60 ;;
        label: "Northern Polar"
      }
      when: {
        sql:  ${TABLE}.lat > 30 AND ${TABLE}.lat <= 60;;
        label: "Northern Temperate"
      }
      when: {
        sql:  ${TABLE}.lat > 10 AND ${TABLE}.lat <= 30;;
        label: "Northern Subtropical"
      }
      when: {
        sql:  ${TABLE}.lat > -10 AND ${TABLE}.lat <= 10;;
        label: "Tropical"
      }
      when: {
        sql:  ${TABLE}.lat > -30 AND ${TABLE}.lat <= -10;;
        label: "Southern Subtropical"
      }
      when: {
        sql:  ${TABLE}.lat > -60 AND ${TABLE}.lat <= -30;;
        label: "Southern Temperate"
      }
      when: {
        sql: ${TABLE}.lat <= -60 ;;
        label: "Southern Polar"
      }
      else:"Unknown"
    }
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
