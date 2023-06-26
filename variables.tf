variable "region" {
  type = string
}

variable "AZA" {
  type = string
}

variable "AZA2" {
  type = string
}

variable "perfil" {
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

variable "public-key" {
  type = string
}

variable "type"{
  type = string
}

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