#!/bin/bash

ecr_url=$(terraform output -raw ecr_url)

folders="src"

services=$(find "$folders" -maxdepth 1 -type d -printf '%f\n' | grep -v "src")

find "$folders" -type f -name "kubernetes-manifests.yaml" | while read -r file; do
  srv=$(echo "$file" | awk -F'/' '{print $2}')
  sed -i 's|<IMAGE:TAG>|'"${ecr_url}:${srv}"'|g' $file
  kubectl create -f $file
  sed -i 's|'"${ecr_url}":"${srv}"'|<IMAGE:TAG>|g' $file
done

kubectl get service | grep amazonaws.com | grep -Eo '\S*' | tail -n3 | head -n1