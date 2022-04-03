#/bin/bash!
docker build \
--build-arg ROOT_PASSWORD=$(openssl rand -base64 32) \
--build-arg PASSWORD=$(openssl rand -base64 32) \
-t blog_ute_sql -f ./dockerfiles/mariadb/Dockerfile . 