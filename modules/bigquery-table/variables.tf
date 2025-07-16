variable "project_id" {
  description = "The project to deploy resources to"
  type        = string
}

variable "prefix" {
  description = "The prefix to use for all resources in this module"
  type        = string
}

variable "region" {
  description = "The region to deploy resources to"
  type        = string
  default     = "southamerica-east1"
}

variable "labels" {
  description = "The labels to apply to all resources in this module"
  type        = map(string)
  default     = {}
}

variable "deletion_protection" {
  description = "Whether or not to allow Terraform to destroy the instance. Unless this field is set to false in Terraform state, a terraform destroy or terraform apply that would delete the instance will fail"
  type        = bool
  default     = false
}

###############################################################################
# BigQuery variables
###############################################################################

variable "dataset_id" {
  description = "Unique ID for the dataset being provisioned."
  type        = string
}

variable "tables" {
  description = "A list of objects which include table_id, table_name, schema, clustering, time_partitioning, range_partitioning, expiration_time and labels."
  default     = []
  type = list(object({
    table_id                 = string,
    description              = optional(string),
    table_name               = optional(string),
    schema                   = string,
    clustering               = optional(list(string)),
    require_partition_filter = optional(bool),
    time_partitioning = optional(object({
      expiration_ms = string,
      field         = string,
      type          = string,
    })),
    range_partitioning = optional(object({
      field = string,
      range = object({
        start    = string,
        end      = string,
        interval = string,
      }),
    })),
    expiration_time     = string,
    deletion_protection = optional(bool),
    labels              = map(string),
  }))
}