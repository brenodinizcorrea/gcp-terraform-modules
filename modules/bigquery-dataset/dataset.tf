resource "google_bigquery_dataset" "dataset" {
  project    = var.project_id
  dataset_id = var.dataset_id
  location   = var.location 
}

resource "google_bigquery_table" "main" {
  dataset_id               = var.dataset_id
  table_id                 = var.table_id
  }