#!/bin/bash

ruta_absoluta=$(pwd | sed 's/Obligatorio_ORT_Cloud.*/Obligatorio_ORT_Cloud/')

#Cargamos las variables

elasticache_url=$(aws elasticache describe-cache-clusters --cache-cluster-id "$1" --query 'CacheClusters[0].CacheNodes[0].Endpoint.Address' --output text)

ecr_url=$(aws ecr describe-repositories --repository-names "$2" --query 'repositories[0].repositoryUri' --output text)

folders="src"

replicas=2

cd "$ruta_absoluta"/deploy

#Busca todas las rutas a partir de src que contengan un archivo llamado kubernetes-manifests.yaml y hace un bucle
find "$folders" -type f -name "kubernetes-manifests.yaml" | while read -r file; do
  #La variable toma el nombre de cada servicio como valor
  srv=$(echo "$file" | awk -F'/' '{print $2}')
  #Como redis no lo vamos a levantar ejecutamos los comandos si el valor de srv no es redis
  if [ $srv != "redis" ]; then
    line_number=$(awk '/selector:/ {print NR; exit}' $file)
    if [ -n "$line_number" ]; then
        awk -i inplace -v line=$line_number 'NR==line {print "  replicas: '"${replicas}"'"} {print}' $file
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