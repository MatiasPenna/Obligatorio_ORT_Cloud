module "deploy-boutique" {
source = "./modules/obli"
count = 1
AZAmodule =  var.AZA
AZA2module = var.AZA2
namesgmodule =  var.namesg
namevpcmodule = var.namevpc
typemodule = var.type
nameigwmodule = var.nameig
namertbmodule = var.namertb
regionmodule = var.region
perfilmomodule = var.perfil
rolmodule = var.rol
cidr_blockmodule = var.cidr_block
}
