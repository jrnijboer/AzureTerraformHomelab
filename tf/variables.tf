variable "subscription_id" {
  type        = string
  description = "Azure subscription id"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant id"
}

variable "client_id" {
  type        = string
  description = "Azure app registration client id"
}

variable "client_secret" {
  type        = string
  description = "Secret used by the client id"
}

variable "terraform_sp_object_id" {
  type = string
  description = "The object_id of the Terraform service principal"
}
