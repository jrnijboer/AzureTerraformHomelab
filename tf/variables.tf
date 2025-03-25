variable "subscription_id" {
  type        = string
  description = "Azure subscription id"
  # https://portal.azure.com/#@jrnijboerhotmail.onmicrosoft.com/resource/subscriptions/6ef9ed97-0307-44d1-a389-abc57c45de2d/overview
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant id"
  # f1c48361-ecf4-42f7-8179-35b6c5836975
}

variable "client_id" {
  type        = string
  description = "Azure app registration client id"
  # https://portal.azure.com/#view/Microsoft_AAD_RegisteredApps/ApplicationMenuBlade/~/Overview/appId/280d3758-d450-449d-8919-09cde5ee1ab3/isMSAApp~/false
}

variable "client_secret" {
  type        = string
  description = "Secret used by the client id"
  # https://portal.azure.com/#view/Microsoft_AAD_RegisteredApps/ApplicationMenuBlade/~/Credentials/appId/280d3758-d450-449d-8919-09cde5ee1ab3/isMSAApp~/false
}

variable "terraform_sp_object_id" {
  type        = string
  description = "The object_id of the Terraform service principal"
  # https://portal.azure.com/#view/Microsoft_AAD_IAM/ManagedAppMenuBlade/~/Overview/objectId/b1aa7125-cbf8-473f-a1fe-f37f8ff798c5/appId/280d3758-d450-449d-8919-09cde5ee1ab3
}
