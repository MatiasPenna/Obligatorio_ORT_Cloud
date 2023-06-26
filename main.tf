module "deploy-boutique" {
source = "./modules/obli"
count = 1
AZAmodule =  var.AZA
AZA2module = var.AZA2
namesgmodule =  var.namesg
nameinstancemodule = var.nameinstance
nameinstance2module = var.nameinstance2
namevpcmodule = var.namevpc
typemodule = var.type
nameigwmodule = var.nameig
namertbmodule = var.namertb
regionmodule = var.region
profilemomodule = var.profile
}
