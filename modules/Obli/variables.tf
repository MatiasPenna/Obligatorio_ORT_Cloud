# Se define el perfil de AWS
variable "perfilmodule" {
    type = string
}

# Se define la region de AWS
variable "regionmodule" {
  type = string
}

# Se definen porcion de red
variable "cidr_blockmodule" {
  type = string
}

variable "regionmodule" {
  type = string
}

variable "AZAmodule" {
  type = string
}

variable "AZA2module" {
  type = string
}

variable "perfilmomodule" {
  type = string
}

variable "rolmomodule" {
  type = string
}

variable "namesgmodule" {
  type = string
}

variable "namevpcmodule" {
    type = string  
}

variable "typemodule" {
  type = string
}

variable "public-keymodule" {
  type = string
}

variable "nameigwmodule" {
  type = string
}

variable "namertbmodule" {
  type = string
}
#ELASTIC CACHE

variable "nameecmodule" {
  type = string
}
variable "descecmodule" {
  type = string
}
variable "namegrecmodule" {
  type = string
}
variable "familygrecmodule" {
  type = string
}
variable "clusteridecmodule" {
  type = string
}
variable "engineclusterecmodule" {
  type = string
}
variable "engineverecmodule" {
  type = string
}
variable "nodetypeecmodule" {
  type = string
}
variable "nodecachenodesecmodule" {
  type = number
}