# Network
variable "cidr_blockmodule" {
  type = string
}

variable "AZAmodule" {
  type = string
}

variable "AZA2module" {
  type = string
}

variable "namesgmodule" {
  type = string
}

variable "namevpcmodule" {
    type = string  
}

variable "nameigwmodule" {
  type = string
}

variable "namertbmodule" {
  type = string
}

#Data

variable "rolmodule" {
  type = string
}

#EKS

variable "instancetypemodule" {
  type = string
}

variable "public-keymodule" {
  type = string
}

variable "nameclustereksmodule" {
  type = string
}

variable "versioneksmodule" {
  type = string
}

variable "nodegrpeksmodule" {
  type = string
}

variable "desiredeksmodule" {
  type = number
}

variable "maxeksmodule" {
  type = number
}

variable "mineksmodule" {
  type = number
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

#Repositorio

variable "namerepoecrmodule" {
  type = number
}
