#!/bin/bash

#Cargamos las variables
ecr_url=$(terraform output -raw ecr_url)

elasticache_url=$(terraform output -raw elasticache_url)

folders="src"

#Busca todas las rutas a partir de src que contengan un archivo llamado kubernetes-manifests.yaml y hace un bucle
find "$folders" -type f -name "kubernetes-manifests.yaml" | while read -r file; do
  #La variable toma el nombre de cada servicio como valor
  srv=$(echo "$file" | awk -F'/' '{print $2}')
  #Como redis no lo vamos a levantar ejecutamos los comandos si el valor de srv no es redis
  if [ $srv != "redis" ]; then
    line_number=$(awk '/selector:/ {print NR; exit}' $file)
    if [ -n "$line_number" ]; then
        awk -i inplace -v line=$line_number 'NR==line {print "  replicas: 2"} {print}' $file
    fi
    #buscamos image:tag y lo reemplazamos por la url del ecr ":" y el nombre del servicio
    sed -i 's|<IMAGE:TAG>|'"${ecr_url}:${srv}"'|g' $file
    #Si hay algun redis-cart lo reemplazamos por la url del elastic cache
    sed -i 's|redis-cart|'"${elasticache_url}"'|g' $file
    #Creamos lo definido dentro de los yaml
    kubectl create -f $file
    #Volvemos el valor inmage:tag por defecto
    sed -i 's|'"${ecr_url}":"${srv}"'|<IMAGE:TAG>|g' $file
  fi
done

kubectl get service | grep amazonaws.com | grep -Eo '\S*' | tail -n3 | head -n1