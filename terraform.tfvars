#Provider
region = "us-east-1"
perfil = "default"

#Data
rol = "LabRole"

#Network
AZA = "us-east-1a"
AZA2 = "us-east-1b"
namesg = "sg_obli"
namevpc = "vpc_obl"
nameig = "igw_obli"
namertb = "rtb_obl"
cidr_block = "10.0."

#ELASTIC CACHE
nameec = "oblecachesubn"
descec = "obl_ecache"
namegrec = "oblecachegrp"
familygrec = "redis6.x"
clusteridec = "oblecache"
engineclusterec = "redis"
engineverec = "6.2"
nodetypeec = "cache.t2.micro"
nodecachenodesec = 1

#EKS
instancetype = "t3.large"
public-key = "vockey"
nameclustereks = "eks_obl_01"
versioneks = "1.27"
nodegrpeks = "worker_node_obl_01"
desiredeks = 2
maxeks = 2
mineks = 2

#Repositorio

namerepoecr = "obl_ecr"
