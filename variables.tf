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