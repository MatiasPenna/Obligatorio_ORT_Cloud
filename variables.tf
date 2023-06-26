# Provider

variable "region" {
  type = string
}

variable "perfil" {
  type = string
}

# Network

variable "AZA" {
  type = string
}

variable "AZA2" {
  type = string
}

variable "namesg" {
  type = string
}

variable "namevpc" {
    type = string  
}

variable "nameig" {
  type = string
}

variable "namertb" {
  type = string
}

# EKS

variable "instancetype" {
  type = string
}

variable "public-key" {
  type = string
}

variable "nameclustereks" {
  type = string
}

variable "versioneks" {
  type = string
}

variable "nodegrpeks" {
  type = string
}

variable "desiredeks" {
  type = number
}

variable "maxeks" {
  type = number
}

variable "mineks" {
  type = number
}

# Data

variable "rol"{
  type = string
}

#ELASTIC CACHE

variable "nameec" {
  type = string
}
variable "descec" {
  type = string
}
variable "namegrec" {
  type = string
}
variable "familygrec" {
  type = string
}
variable "clusteridec" {
  type = string
}
variable "engineclusterec" {
  type = string
}
variable "engineverec" {
  type = string
}
variable "nodetypeec" {
  type = string
}
variable "nodecachenodesec" {
  type = number
}

#Repositorio

variable "namerepoecr" {
  type = number
}