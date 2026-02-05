output "service_account_email" {
  description = "Service Account Email"
  value       = google_service_account.this.email
}

output "service_account_name" {
  description = "Resource Name"
  value       = google_service_account.this.name
}