#!/bin/bash

#Cargamos las variables
ecr_url=$(terraform output -raw ecr_url)

ecache_url=$(terraform output -raw ecache_url)

ruta_absoluta=$(pwd | sed 's/Obligatorio_ORT_Cloud.*/Obligatorio_ORT_Cloud/')

cd "$ruta_absoluta"/deploy

folders="src"

replicas=2


find "$folders" -type f -name "kubernetes-manifests.yaml" | while read -r file; do

  srv=$(echo "$file" | awk -F'/' '{print $2}')

  #Como redis no lo vamos a levantar ejecutamos los comandos solo si el valor de srv no es redis
  if [ $srv != "redis" ]; then
    line_number=$(awk '/selector:/ {print NR; exit}' $file)

    #Agrega cantidad de replicas dentro del deployment
    if [ -n "$line_number" ]; then
        awk -i inplace -v line=$line_number 'NR==line {print "  replicas: '"$replicas"'"} {print}' $file
    fi

    #buscamos image:tag y lo reemplazamos por la url del ecr, ":" y el nombre del servicio
    sed -i 's|<IMAGE:TAG>|'"${ecr_url}:${srv}"'|g' $file

    #Si hay algun redis-cart lo reemplazamos por la url del elastic cache
    sed -i 's|redis-cart|'"${ecache_url}"'|g' $file

    kubectl create -f $file

    #Volvemos el valor inmage:tag por defecto
    sed -i 's|'"${ecr_url}":"${srv}"'|<IMAGE:TAG>|g' $file
  fi
done

#Devuelve la URL del load balancer generado
kubectl get service | grep amazonaws.com | grep -Eo '\S*' | tail -n3 | head -n1