#imagen para base de datos relacional con MariaDB
FROM mariadb:latest as ute_blog
MAINTAINER jazzjezz jazzjezz@disroot.org

ARG ROOT_PASSWORD
ARG PASSWORD
ENV MARIADB_DATABASE=blog_ute
ENV MARIADB_USER=blog_ute
ENV MARIADB_ROOT_PASSWORD=${ROOT_PASSWORD}
ENV MARIADB_PASSWORD=${PASSWORD}
ENV MARIADB_ROOT_HOST=localhost

#instalación de los objetos en base de datos
COPY install/dbobjects/blog_ute_install.sql /docker-entrypoint-initdb.d/
#creación de carpetas para el job y los respaldos
RUN mkdir ~/jobs && mkdir ~/backups 
#instala el job
COPY install/jobs/sh/blog_ute_backup.sh /root/jobs/blog_ute_backup.sh
COPY install/jobs/cron/blog_ute_backup /etc/cron.d/blog_ute_backup
#asigna permisos al job
RUN chmod +x ~/jobs/blog_ute_backup.sh \
    && printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d \
    && apt update \
    && apt install -y cron
