resource "newrelic_one_dashboard" "exampledash" {
    for_each = var.widget_map
    name        = var.dashboard.name
    permissions = var.dashboard.permissions

    page {
        name = var.dashboard.page.name

        widget_billboard {
            title  = each.value.widget_billboard.title
            row    = each.value.widget_billboard.row
            column = each.value.widget_billboard.column
            width  = each.value.widget_billboard.width
            height = each.value.widget_billboard.height

            nrql_query {
                query = each.value.widget_billboard.nrql_query.query
            }
        }


        widget_bar {
            title  = each.value.widget_bar.title
            row    = each.value.widget_bar.row
            column = each.value.widget_bar.column
            width  = each.value.widget_bar.width
            height = each.value.widget_bar.height

            nrql_query {
                query = each.value.widget_bar.nrql_query.query

            }

        }


        widget_line {
            title = each.value.widget_line.title
            row = each.value.widget_line.row
            column = each.value.widget_line.column
            width = each.value.widget_line.width
            height = each.value.widget_line.height
            ignore_time_range = each.value.widget_line.ignore_time_range
            y_axis_left_max = each.value.widget_line.y_axis_left_max
            y_axis_left_min = each.value.widget_line.y_axis_left_min
            legend_enabled = each.value.widget_line.legend_enabled
            
            nrql_query {
                query = each.value.widget_line.nrql_query.query
            }
            
            null_values {
                null_value = each.value.widget_line.null_values.null_value
                series_overrides { 
                    null_value = each.value.widget_line.null_values.series_overrides.null_value
                    series_name = each.value.widget_line.null_values.series_overrides.series_name
                }
            }
            
            units {
                unit = each.value.widget_line.units.unit
                series_overrides { 
                    unit = each.value.widget_line.units.series_overrides.unit
                    series_name = each.value.widget_line.units.series_overrides.series_name
                }
            }
            
            colors {
                color = each.value.widget_line.colors.color
                series_overrides {
                color = each.value.widget_line.colors.series_overrides.color
                series_name = each.value.widget_line.colors.series_overrides.series_name
                }
            }
            
            y_axis_left_zero = each.value.widget_line.y_axis_left_zero
            
            y_axis_right {
                y_axis_right_max = each.value.widget_line.y_axis_right.y_axis_right_max
                y_axis_right_min = each.value.widget_line.y_axis_right.y_axis_right_min
                y_axis_right_series = each.value.widget_line.y_axis_right.y_axis_right_series
                y_axis_right_zero = each.value.widget_line.y_axis_right.y_axis_right_zero
            }
            
            threshold {
                name = each.value.widget_line.threshold.name
                from = each.value.widget_line.threshold.from
                to = each.value.widget_line.threshold.to
                severity = each.value.widget_line.threshold.severity
            }
            
            is_label_visible = each.value.widget_line.is_label_visible
        }
    }

  # variable {
  #     default_values     = ["value"]
  #     is_multi_selection = true
  #     item {
  #       title = "item"
  #       value = "ITEM"
  #     }
  #     name = "variable"
  #     nrql_query {
  #       # account_ids = [12345]
  #       query       = "FROM Transaction SELECT average(duration) FACET appName"
  #     }
  #     replacement_strategy = "default"
  #     title                = "title"
  #     type                 = "nrql"
  # }
}