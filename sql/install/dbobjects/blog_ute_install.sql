CREATE DATABASE IF NOT EXISTS blog_ute;
GRANT ALL PRIVILEGES ON blog_ute.* TO 'blog_ute'@'%' IDENTIFIED BY 'root';

DELIMITER \\

CREATE TABLE IF NOT EXISTS etiquetas (id INTEGER PRIMARY KEY, nombre_etiqueta VARCHAR(30));

CREATE TABLE IF NOT EXISTS categorias (id INTEGER PRIMARY KEY, categoria VARCHAR(30));

CREATE TABLE IF NOT EXISTS usuarios (id INTEGER PRIMARY KEY, 
login VARCHAR(30) NOT NULL, 
password VARCHAR(32) NOT NULL, 
nickname VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS posts (id INTEGER PRIMARY KEY,
titulo VARCHAR(150),
fecha_publicacion TIMESTAMP,
contenido TEXT,
estatus CHAR(8),
usuarios_id INTEGER,
categorias_id INTEGER);

CREATE TABLE IF NOT EXISTS comentarios (id INTEGER PRIMARY KEY,
comentario TEXT,
usuarios_id INTEGER,
posts_id INTEGER);

ALTER TABLE comentarios ADD CONSTRAINT FOREIGN KEY (usuarios_id) REFERENCES usuarios(id), 
ADD CONSTRAINT FOREIGN KEY (posts_id) REFERENCES posts(id);

ALTER TABLE posts ADD CONSTRAINT FOREIGN KEY (usuarios_id) REFERENCES usuarios(id), 
ADD CONSTRAINT FOREIGN KEY (categorias_id) REFERENCES categorias(id);

ALTER TABLE posts ADD CHECK (estatus IN ('activo', 'inactivo'));

DELIMITER \\

USE blog_ute;
SET GLOBAL event_scheduler = ON;

DELIMITER \\

REVOKE ALL PRIVILEGES ON blog_ute.* FROM 'blog_ute'@'%';

GRANT DELETE ON blog_ute.* TO 'blog_ute'@'%';
GRANT INSERT ON blog_ute.* TO 'blog_ute'@'%';
GRANT SELECT ON blog_ute.* TO 'blog_ute'@'%';
GRANT UPDATE ON blog_ute.* TO 'blog_ute'@'%';