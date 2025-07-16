locals {
  tables = { for table in var.tables : table["table_id"] => table }
}

resource "google_bigquery_table" "main" {
  for_each                 = local.tables
  dataset_id               = var.dataset_id
  friendly_name            = each.value["table_name"] != null ? "${var.prefix}-bq-${each.value["table_name"]}" : "${var.prefix}-bq-${each.key}"
  table_id                 = each.key
  description              = each.value["description"]
  labels                   = merge(var.labels, each.value["labels"])
  schema                   = each.value["schema"]
  clustering               = each.value["clustering"]
  expiration_time          = each.value["expiration_time"] != null ? each.value["expiration_time"] : 0
  project                  = var.project_id
  deletion_protection      = coalesce(each.value["deletion_protection"], var.deletion_protection)
  require_partition_filter = each.value["require_partition_filter"]

}