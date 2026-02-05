variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "context" {
  description = "Service Account Context"
  type        = string
}

variable "name" {
  description = "Service Account Name"
  type        = string
}

variable "roles" {
  description = "List of roles GCP for the Service Account"
  type        = list(string)
  default     = []
}