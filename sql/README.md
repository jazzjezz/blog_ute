# Blog_ute con mariadb
Proyecto escolar con una imagen modificada de mariadb:latest

Base de datos relacional con esquema blog_ute

# Ejecutar script docker-build.sh
El script docker-build.sh crea contraseñas de 32 caracteres y los asigna al EVN del contenedor

# Crear el contenedor
docker run --detach --network some-network --name blog_ute_sql_dev blog_ute:latest