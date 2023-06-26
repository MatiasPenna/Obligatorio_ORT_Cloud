# Crear un clúster de Kubernetes (usando EKS)
resource "aws_eks_cluster" "eks_obl_01" {
  name     = "eks_obl_01"
  role_arn = data.aws_iam_role.LabRole.arn
  version  = "1.27"

  vpc_config {
    subnet_ids         = [aws_subnet.subnet_obl_01.id, aws_subnet.subnet_obl_02.id]
    security_group_ids = [aws_security_group.sg_obl.id]
  }
}

#Creamos los workers para el cluster eks
 resource "aws_eks_node_group" "worker_node_obl_01" {
  cluster_name      = aws_eks_cluster.eks_obl_01.name
  node_group_name   = "worker_node_obl_01"
  node_role_arn     = data.aws_iam_role.LabRole.arn
  subnet_ids        = [aws_subnet.subnet_obl_01.id, aws_subnet.subnet_obl_02.id]
  instance_types    = ["t3.large"]

  remote_access {
   ec2_ssh_key      = "vockey"
  }
  
  scaling_config {
   desired_size = 2
   max_size     = 2
   min_size     = 2
  }
 }