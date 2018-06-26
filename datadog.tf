# Create a new Datadog monitor
resource "datadog_monitor" "foo" {
  name               = "${var.service_name}-CPU"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: @pagerduty-${var.service_name}"
  escalation_message = "Ruh Roh!! We're in trouble! message @pagerduty-${var.service_name}"

  query = "avg:system.load.1{service:${var.service_name}} by {host}"

  thresholds {
    ok                = 0
    warning           = 2
    warning_recovery  = 1
    critical          = 0.10
    critical_recovery = 3
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["service:${var.service_name}", "environment:${var.env}"]
}