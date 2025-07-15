resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "test_dataset"  
  location                    = "us-central1"
  project                     = "personal-finance-445622"
} 