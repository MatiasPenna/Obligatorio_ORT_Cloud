# Se define el perfil de AWS
variable "perfil" {
    default = "default"
}

# Se define la region de AWS
variable "region" {
  default = "us-east-1"
}

# Se definen porcion de red
variable "cidr_block" {
    default = "10.0."
}

variable "repository_list" {
  description = "List of repository names"
  type = list
  default = ["adservice", "checkoutservice", "currencyservice", "emailservice", "frontend", "loadgenerator", "paymentservice", "productcatalogservice", "recommendationservice", "shippingservice", "redis"]
}

resource "random_string" "suffix" {
  length = 8
  special = false
}

variable "arn_id" {
  description = "ARN ID"
  default = "320466714090"
}