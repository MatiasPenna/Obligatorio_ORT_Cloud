#!/bin/bash

ecr_url=$(terraform output -raw ecr_url)

cluster_name=$(terraform output -raw cluster_name)

namespace="obligatorio"

folders="src"

aws eks --region us-east-1 update-kubeconfig --name $cluster_name

kubectl create namespace $namespace

kubectl config set-context --current --namespace=$namespace

aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin $ecr_url

# Bucle para buscar y construir las imágenes Docker
find "$folders" -type f -name "Dockerfile" | while read -r file; do
    
    image_tag=$(echo "$file" | awk -F'/' '{print $2}')

    if [ $image_tag != "cartservice" ]; then
        image_folder="$folders/$image_tag/"
        echo "$image_folder"
    else
        image_folder="$folders/$image_tag/src"
        echo "$image_folder"
    fi

    echo "Construyendo imagen desde $image_folder"
    sudo docker build -t "$image_tag:latest" $image_folder

    echo "Etiquetando imagen para ECR..."
    sudo docker tag "$image_tag:latest" "$ecr_url:$image_tag"

    echo "Subiendo imagen a ECR..."
    sudo docker push "$ecr_url:$image_tag"

    echo "Imagen $image_tag subida exitosamente a ECR."
done