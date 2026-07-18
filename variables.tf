variable "project_id" {
  description = "ID of the project in which to create the service accounts."
  type        = string
}

variable "accounts" {
  description = "Service accounts to create, keyed by account id (the part before @)."
  type = map(object({
    display_name = optional(string)
    description  = optional(string)
    create_key   = optional(bool, false)
  }))
  default = {}
}

variable "project_roles" {
  description = "Project roles to grant, keyed by \"<account_id>|<role>\"; the referenced account must exist in var.accounts."
  type        = map(string)
  default     = {}
}
