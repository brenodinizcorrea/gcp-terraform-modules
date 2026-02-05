module "generic_sa" {
  source          = "../../resources/service-account"
  project_name    = var.project_name
  context         = var.context
  name            = var.name
  sa_display_name = var.sa_display_name
  sa_description  = var.sa_description
}

resource "google_project_iam_member" "this" {
  for_each = toset(var.roles)

  project = var.project_name
  role    = each.value
  member  = "serviceAccount:${module.generic_sa.service_account_email}"
}

resource "google_service_account_key" "this" {
  service_account_id = module.generic_sa.service_account_email
}

resource "google_secret_manager_secret" "this" {
  secret_id = "${var.project_name}-${var.context}-${var.name}-key"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "this" {
  secret      = google_secret_manager_secret.this.id
  secret_data = google_service_account_key.this.private_key
}