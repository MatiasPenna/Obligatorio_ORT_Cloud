#!/bin/bash

ruta_absoluta=$(pwd | sed 's/Obligatorio_ORT_Cloud.*/Obligatorio_ORT_Cloud/')

namespace="obligatorio"

folders="src"

aws eks --region us-east-1 update-kubeconfig --name $1

ecr_url=$(aws ecr describe-repositories --repository-names $2 --query 'repositories[0].repositoryUri' --output text)

kubectl create namespace $namespace

kubectl config set-context --current --namespace=$namespace

aws ecr get-login-password --region $3 | sudo docker login --username AWS --password-stdin $ecr_url

cd "$ruta_absoluta"/deploy

# Bucle para buscar y construir las imágenes Docker
find "$folders" -type f -name "Dockerfile" | while read -r file; do

    image_tag=$(echo "$file" | awk -F'/' '{print $3}')

    if [ $image_tag != "cartservice" ]; then
        image_folder="$folders/$image_tag/"
    else
        image_folder="$folders/$image_tag/src"
    fi

    echo "Construyendo imagen desde $image_folder"
    sudo docker build -t "$image_tag:latest" $image_folder

    echo "Etiquetando imagen para ECR..."
    sudo docker tag "$image_tag:latest" "$ecr_url:$image_tag"

    echo "Subiendo imagen a ECR..."
    sudo docker push "$ecr_url:$image_tag"

    echo "Imagen $image_tag subida exitosamente a ECR."
done