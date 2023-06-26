module "deploy-boutique" {
source = "./modules/obli"
count = 1

# Network
AZAmodule =  var.AZA
AZA2module = var.AZA2
namesgmodule =  var.namesg
namevpcmodule = var.namevpc
nameigwmodule = var.nameig
namertbmodule = var.namertb
cidr_blockmodule = var.cidr_block

# Data
rolmodule = var.rol

# EKS

instancetypemodule = var.instancetype
public-keymodule = var.public-key
nameclustereksmodule = var.nameclustereks
versioneksmodule = var.versioneks
nodegrpeksmodule = var.nodegrpeks
desiredeksmodule = var.desiredeks
maxeksmodule = var.maxeks
mineksmodule = var.mineks

# ELASTIC CACHE

nameecmodule = var.nameec
descecmodule = var.descec
namegrecmodule = var.namegrec
familygrecmodule = var.familygrec
clusteridecmodule = var.clusteridec
engineclusterecmodule = var.engineclusterec
engineverecmodule = var.engineverec
nodetypeecmodule = var.nodetypeec
nodecachenodesecmodule = var.nodecachenodesec

#Repositorio

namerepoecrmodule = var.namerepoecr

}