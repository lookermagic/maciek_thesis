view: icoads_core_2015 {
  sql_table_name: noaa_thesis.icoads_core_2015 ;;

  dimension: adaptive_qc_flags {
    type: string
    sql: ${TABLE}.adaptive_qc_flags ;;
  }

  dimension: air_temperature {
    type: number
    sql: ${TABLE}.air_temperature ;;
  }

  dimension: amt_pressure_tend {
    type: number
    sql: ${TABLE}.amt_pressure_tend ;;
  }

  dimension: attm_count {
    type: number
    sql: ${TABLE}.attm_count ;;
  }

  dimension: box_system_indicator {
    type: string
    sql: ${TABLE}.box_system_indicator ;;
  }

  dimension: callsign {
    type: string
    sql: ${TABLE}.callsign ;;
  }

  dimension: characteristic_of_ppp {
    type: number
    sql: ${TABLE}.characteristic_of_ppp ;;
  }

  dimension: cloud_height {
    type: string
    sql: ${TABLE}.cloud_height ;;
  }

  dimension: cloud_height_indicator {
    type: number
    sql: ${TABLE}.cloud_height_indicator ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: deck {
    type: number
    sql: ${TABLE}.deck ;;
  }

  dimension: dewpoint_temperature {
    type: number
    sql: ${TABLE}.dewpoint_temperature ;;
  }

  dimension: dpt_indicator {
    type: number
    sql: ${TABLE}.dpt_indicator ;;
  }

  dimension: dup_check {
    type: number
    sql: ${TABLE}.dup_check ;;
  }

  dimension: dup_status {
    type: number
    sql: ${TABLE}.dup_status ;;
  }

  dimension: external {
    type: number
    sql: ${TABLE}.external ;;
  }

  dimension: high_cloud_type {
    type: string
    sql: ${TABLE}.high_cloud_type ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: id_indicator {
    type: number
    sql: ${TABLE}.id_indicator ;;
  }

  dimension: imma_version {
    type: number
    sql: ${TABLE}.imma_version ;;
  }

  dimension: indicator_for_temp {
    type: number
    sql: ${TABLE}.indicator_for_temp ;;
  }

  dimension: intermediate_reject_flag {
    type: number
    sql: ${TABLE}.intermediate_reject_flag ;;
  }

  dimension: landlocked_flag {
    type: number
    sql: ${TABLE}.landlocked_flag ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: latlong_indicator {
    type: number
    sql: ${TABLE}.latlong_indicator ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: low_cloud_type {
    type: string
    sql: ${TABLE}.low_cloud_type ;;
  }

  dimension: lower_cloud_amount {
    type: number
    sql: ${TABLE}.lower_cloud_amount ;;
  }

  dimension: middle_cloud_type {
    type: string
    sql: ${TABLE}.middle_cloud_type ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: national_source_indicator {
    type: number
    sql: ${TABLE}.national_source_indicator ;;
  }

  dimension: ncdc_qc_flags {
    type: string
    sql: ${TABLE}.ncdc_qc_flags ;;
  }

  dimension: nightday_flag {
    type: number
    sql: ${TABLE}.nightday_flag ;;
  }

  dimension: one_degree_box_number {
    type: number
    sql: ${TABLE}.one_degree_box_number ;;
  }

  dimension: past_weather {
    type: number
    sql: ${TABLE}.past_weather ;;
  }

  dimension: platform_type {
    type: number
    sql: ${TABLE}.platform_type ;;
  }

  dimension: present_weather {
    type: number
    sql: ${TABLE}.present_weather ;;
  }

  dimension: pressure_bias {
    type: number
    sql: ${TABLE}.pressure_bias ;;
  }

  dimension: release_no_primary {
    type: number
    sql: ${TABLE}.release_no_primary ;;
  }

  dimension: release_no_secondary {
    type: number
    sql: ${TABLE}.release_no_secondary ;;
  }

  dimension: release_no_tertiary {
    type: number
    sql: ${TABLE}.release_no_tertiary ;;
  }

  dimension: release_status_indicator {
    type: number
    sql: ${TABLE}.release_status_indicator ;;
  }

  dimension: sea_level_pressure {
    type: number
    sql: ${TABLE}.sea_level_pressure ;;
  }

  dimension: sea_surface_temp {
    type: number
    sql: ${TABLE}.sea_surface_temp ;;
  }

  dimension: second_country_code {
    type: number
    sql: ${TABLE}.second_country_code ;;
  }

  dimension: ship_course {
    type: number
    sql: ${TABLE}.ship_course ;;
  }

  dimension: ship_speed {
    type: number
    sql: ${TABLE}.ship_speed ;;
  }

  dimension: source_exclusion_flags {
    type: number
    sql: ${TABLE}.source_exclusion_flags ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: sst_measurement_method {
    type: number
    sql: ${TABLE}.sst_measurement_method ;;
  }

  dimension: swell_direction {
    type: number
    sql: ${TABLE}.swell_direction ;;
  }

  dimension: swell_height {
    type: number
    sql: ${TABLE}.swell_height ;;
  }

  dimension: swell_period {
    type: number
    sql: ${TABLE}.swell_period ;;
  }

  dimension: swell_period_indicator {
    type: number
    sql: ${TABLE}.swell_period_indicator ;;
  }

  dimension: ten_degree_box_number {
    type: number
    sql: ${TABLE}.ten_degree_box_number ;;
  }

  dimension: time_indicator {
    type: number
    sql: ${TABLE}.time_indicator ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: total_cloud_amount {
    type: number
    sql: ${TABLE}.total_cloud_amount ;;
  }

  dimension: track_check {
    type: number
    sql: ${TABLE}.track_check ;;
  }

  dimension: trimming_flags {
    type: string
    sql: ${TABLE}.trimming_flags ;;
  }

  dimension: unique_report_id {
    type: string
    sql: ${TABLE}.unique_report_id ;;
  }

  dimension: visibility {
    type: number
    sql: ${TABLE}.visibility ;;
  }

  dimension: visibility_indicator {
    type: number
    sql: ${TABLE}.visibility_indicator ;;
  }

  dimension: wave_direction {
    type: number
    sql: ${TABLE}.wave_direction ;;
  }

  dimension: wave_height {
    type: number
    sql: ${TABLE}.wave_height ;;
  }

  dimension: wave_period {
    type: number
    sql: ${TABLE}.wave_period ;;
  }

  dimension: wave_period_indicator {
    type: number
    sql: ${TABLE}.wave_period_indicator ;;
  }

  dimension: wbt_indicator {
    type: number
    sql: ${TABLE}.wbt_indicator ;;
  }

  dimension: wetbulb_temperature {
    type: number
    sql: ${TABLE}.wetbulb_temperature ;;
  }

  dimension: wind_direction_indicator {
    type: number
    sql: ${TABLE}.wind_direction_indicator ;;
  }

  dimension: wind_direction_true {
    type: number
    sql: ${TABLE}.wind_direction_true ;;
  }

  dimension: wind_speed {
    type: number
    sql: ${TABLE}.wind_speed ;;
  }

  dimension: wind_speed_indicator {
    type: number
    sql: ${TABLE}.wind_speed_indicator ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
