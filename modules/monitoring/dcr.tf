# resource "azurerm_monitor_data_collection_rule" "dcr_shared_main_sea" {
#   name                = "dcr-shared-main-sea-001"
#   resource_group_name = var.resource_group_name
#   location            = var.resource_group_location

#   destinations {
#     log_analytics {
#       name                  = "log-destination-shared-main-sea-001"
#       workspace_resource_id = data.azurerm_log_analytics_workspace.log_shared.id
#     }

#     azure_monitor_metrics {
#       name = "metrics-destination-shared-main-sea-001"
#     }
#   }

#   data_sources {
#     performance_counter {
#       streams                       = ["Microsoft-Perf", "Microsoft-InsightsMetrics"]
#       sampling_frequency_in_seconds = 60
#       counter_specifiers            = ["Processor(*)\\% Processor Time"]
#       name                          = "datasource-perfcounter"
#     }
#   }

#   data_flow {
#     streams      = ["Microsoft-InsightsMetrics"]
#     destinations = ["log-destination-shared-main-sea-001", "metrics-destination-shared-main-sea-001"]
#   }

#   lifecycle {
#     ignore_changes = [
#       data_sources,
#     ]
#   }
# }
