#!/bin/bash

ecr_url=$(terraform output -raw ecr_url)

cluster_name=$(terraform output -raw cluster_name)

namespace="obligatorio"

aws eks update-kubeconfig --name $cluster_name

kubectl create namespace

kubectl config set-context --current --namespace=$namespace

folders="/src"

services=($(find "$folders" -maxdepth 1 -type d -printf '%f\n'))

for srv in "${services[@]}"; do
  sed -i 's/<IMAGE:TAG>/$ecr_url:$srv/g' $srv/deployment/kubernetes-manifests.yaml
  kubectl create -f $srv/deployment/kubernetes-manifests.yaml
done


kubectl get service | grep amazonaws.com | grep -Eo '\S*' | tail -n3 | head -n1