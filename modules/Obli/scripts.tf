resource "null_resource" "script_build" {
  depends_on = [aws_eks_cluster.eks_obl_01]

  provisioner "local-exec" {
    command = "sh ./scripts/build.sh ${var.nameclustereks} ${var.namerepoecr} ${var.region}"
  }
}

 resource "null_resource" "script_kube" {
   depends_on = [null_resource.script_build]
   
   provisioner "local-exec" {
     command = "sh ./scripts/kube.sh ${var.obl_ecache} ${var.namerepoecr}"
   }
 }