view: gsod {
  sql_table_name: `bigquery-public-data.noaa_gsod.gsod*` ;;

  dimension: count_dewp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_dewp ;;
  }

  dimension: count_slp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_slp ;;
  }

  dimension: count_stp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_stp ;;
  }

  dimension: count_temp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_temp ;;
  }

  dimension: count_visib {
    hidden: yes
    type: number
    sql: ${TABLE}.count_visib ;;
  }

  dimension: count_wdsp {
    hidden: yes
    type: string
    sql: ${TABLE}.count_wdsp ;;
  }

  dimension: dewpoint {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.dewp = 9999.9 THEN NULL ELSE ${TABLE}.dewp END ;;
    }

  dimension: flag_max {
    hidden: yes
    type: string
    sql: ${TABLE}.flag_max ;;
  }

  dimension: flag_min {
    hidden: yes
    type: string
    sql: ${TABLE}.flag_min ;;
  }

  dimension: flag_prcp {
    hidden: yes
    type: string
    sql: ${TABLE}.flag_prcp ;;
  }

  dimension: fog {
    type: yesno
    sql: ${TABLE}.fog = '1' ;;
  }

  dimension: max_wind_gust {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.gust = 999.9 THEN NULL ELSE ${TABLE}.gust END ;;
    }

  dimension: severe_weather {
    type: yesno
    sql: ${hail}
      OR ${snow_ice_pellets}
      OR ${thunder}
      OR ${tornado_funnel_cloud} ;;
  }

  dimension: hail {
    type: yesno
    sql: ${TABLE}.hail = '1' ;;
  }

  dimension: temperature_max {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.max = 9999.9 THEN NULL ELSE ${TABLE}.max END ;;
  }

  dimension: temperature_min {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.min = 9999.9 THEN NULL ELSE ${TABLE}.min END ;;
    }

  dimension: max_windspeed {
    view_label: "Daily observations"
    type: string
    sql: CASE WHEN ${TABLE}.mxpsd = 999.9 THEN NULL ELSE ${TABLE}.mxpsd END ;;
    }

  dimension: precipitation {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.prcp = 99.99 THEN NULL ELSE ${TABLE}.prcp END ;;
  }

  dimension: rain_drizzle {
    type: yesno
    sql: ${TABLE}.rain_drizzle = '1' ;;
  }

  dimension: sea_level_pressure {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.slp = 9999.9 THEN NULL ELSE ${TABLE}.slp END ;;
    }

  dimension: snow_depth {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.sndp = 999.9 THEN NULL ELSE ${TABLE}.sndp END ;;
    }

  dimension: snow_ice_pellets {
    type: yesno
    sql: ${TABLE}.snow_ice_pellets = '1' ;;
  }

  dimension: stn {
    hidden: yes
    type: string
    sql: ${TABLE}.stn ;;
  }

  dimension: station_id {
    type: string
    sql: CONCAT(${TABLE}.stn, '-', ${TABLE}.wban) ;;
  }

  dimension: pressure {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.stp = 9999.9 THEN NULL ELSE ${TABLE}.stp END ;;
    }

  dimension: temperature {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.temp = 9999.9 THEN NULL ELSE ${TABLE}.temp END ;;
  }

  dimension: thunder {
    type: yesno
    sql: ${TABLE}.thunder = '1' ;;
  }

  dimension: tornado_funnel_cloud {
    type: yesno
    sql: ${TABLE}.tornado_funnel_cloud = '1' ;;
  }

  dimension: visibility {
    view_label: "Daily observations"
    type: number
    sql: CASE WHEN ${TABLE}.visib = 999.9 THEN NULL ELSE ${TABLE}.visib END ;;
    }

  dimension: wban {
    hidden: yes
    type: string
    sql: ${TABLE}.wban ;;
  }

  dimension: windspeed {
    view_label: "Daily observations"
    type: string
    sql: CASE WHEN ${TABLE}.wdsp = 999.9 THEN NULL ELSE ${TABLE}.wdsp END ;;
    }

  dimension_group: date {
    type: time
    datatype: yyyymmdd
    sql: cast(concat(${TABLE}.year, ${TABLE}.mo, ${TABLE}.da) AS INT64) ;;
    timeframes: [date, year, month, day_of_month, month_name, day_of_year, week, week_of_year]
  }

  dimension: decade {
    case: {
      when: {
        sql: ${date_year} < 1930 ;;
        label: "1920s"
      }
      when: {
        sql: ${date_year} >= 1930 AND ${date_year} < 1940 ;;
        label: "1930s"
      }
      when: {
        sql: ${date_year} >= 1940 AND ${date_year} < 1950 ;;
        label: "1940s"
      }
      when: {
        sql: ${date_year} >= 1950 AND ${date_year} < 1960 ;;
        label: "1950s"
      }
      when: {
        sql: ${date_year} >= 1960 AND ${date_year} < 1970 ;;
        label: "1960s"
      }
      when: {
        sql: ${date_year} >= 1970 AND ${date_year} < 1980 ;;
        label: "1970s"
      }
      when: {
        sql: ${date_year} >= 1980 AND ${date_year} < 1990 ;;
        label: "1980s"
      }
      when: {
        sql: ${date_year} >= 1990 AND ${date_year} < 2000 ;;
        label: "1990s"
      }
      when: {
        sql: ${date_year} >= 2000 AND ${date_year} < 2010 ;;
        label: "2000s"
      }
      when: {
        sql: ${date_year} >= 2010 AND ${date_year} < 2020 ;;
        label: "2010s"
      }
      else: "Other"

    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_temperature {
    label: "Average Temperature (˚F)"
    type: average
    sql: ${temperature} ;;
    value_format_name: decimal_1
    drill_fields: [detail*]
  }

  measure: average_pressure {
    label: "Average Pressure (Bar)"
    type: average
    sql: ${pressure} ;;
    value_format_name: decimal_1
    drill_fields: [detail*]
  }

  measure: average_dewpoint {
    label: "Average Dewpoint (˚F)"
    type: average
    sql: ${dewpoint} ;;
    value_format_name: decimal_1
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      stations.name,
      stations.location,
      date_month,
      average_temperature,
      average_pressure,
      average_dewpoint
    ]
  }
}
