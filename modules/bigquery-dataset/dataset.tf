resource "google_bigquery_dataset" "dataset" {
  project    = var.project_id_test
  dataset_id = var.dataset_id
  location   = var.location 
}