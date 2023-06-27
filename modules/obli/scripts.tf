# resource "null_resource" "script_build" {
#   depends_on = [aws_eks_cluster.eks_obl_01]

#   provisioner "local-exec" {
#     command = "sh ./scripts/build.sh ${var.nameclustereksmodule} ${var.namerepoecrmodule} ${var.regionmodule}"
#   }
# }

#  resource "null_resource" "script_kube" {
#    depends_on = [null_resource.script_build]
   
#    provisioner "local-exec" {
#      command = "sh ./scripts/kube.sh ${var.clusteridec} ${var.namerepoecrmodule}"
#    }
#  }


resource "null_resource" "script_build" {
  depends_on = [aws_eks_cluster.eks_obl_01]
  provisioner "local-exec" {
    command = "sh ./scripts/build.sh"
  }
}

 resource "null_resource" "script_kube" {
  depends_on = [aws_elasticache_cluster.obl_ecache_cluster, null_resource.script_build]
   provisioner "local-exec" {
     command = "sh ./scripts/kube.sh"
   }
 }