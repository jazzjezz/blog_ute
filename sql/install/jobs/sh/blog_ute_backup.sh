#/bin/sh
#blog_ute_backup 
#Respaldo para la base de datos blog_ute

mysqldump -uroot -p$MARIADB_ROOT_PASSWORD blog_ute | gzip -c > ~/backups/blog_ute_`date +"%Y_%m_%d_%T"`.sql.gz