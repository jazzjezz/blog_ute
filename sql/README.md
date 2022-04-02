# Blog_ute con mariadb
Proyecto escolar con una imagen modificada de mariadb:latest

Base de datos relacional con esquema

Crear la imagen
docker build -t blog_ute -f ./dockerfiles/mariadb/Dockerfile .

Creando el contenedor
docker run --detach --network some-network --name blog_ute_dev blog_ute:latest