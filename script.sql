-- Desafio 1 - parte 1

CREATE DATABASE posts;
\c posts;

CREATE TABLE posts (
    id INT,
    username VARCHAR(30),
    created_at DATE,
    contenido VARCHAR(80),
    descripcion VARCHAR(80),
    Primary Key(id)
);

-- insertar 3 posts
INSERT INTO posts (id, username, created_at, contenido, descripcion) VALUES (1, 'Pamela', '07/20/2021', 'Hola muchas gracias', 'primer post de Pamela');
INSERT INTO posts (id, username, created_at, contenido, descripcion) VALUES (2, 'Pamela', '07/21/2021', 'Hola muchas gracias post 2', 'segundo post de Pamela');
INSERT INTO posts (id, username, created_at, contenido, descripcion) VALUES (3, 'Carlos', '07/20/2021', 'Hola muchas gracias a todos', 'primer post de Carlos');

-- Modificar la tabla post, agregando la columna título.
ALTER TABLE posts ADD COLUMN titulo VARCHAR(255);

-- Agregar título a las publicaciones ya ingresadas.
UPDATE posts SET titulo='Hola muchas gracias' WHERE id=1;
UPDATE posts SET titulo='Hola muchas gracias post 2' WHERE id=2;
UPDATE posts SET titulo='Hola muchas gracias a todos' WHERE id=3;

-- Insertar 2 post para el usuario "Pedro".
INSERT INTO posts (id, username, created_at, contenido, descripcion, titulo) VALUES
(4, 'Pedro', '07/21/2021', 'Hola buenos dias', 'primer post de Pedro', 'Hola buenos dias');
INSERT INTO posts (id, username, created_at, contenido, descripcion, titulo) VALUES
(5, 'Pedro', '07/22/2021', 'Hola buenos dias a todos', 'segundo post de Pedro', 'Hola buenos dias a todos');

-- Eliminar el post de Carlos.
DELETE FROM posts WHERE username='Carlos';

-- Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO posts (id, username, created_at, contenido, descripcion, titulo) VALUES
(6, 'Carlos', '07/21/2021', 'Hola nuevamente', 'segundo post de Carlos', 'Hola nuevamente');

-- Desafio 1 - parte 2
--  Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts

CREATE TABLE comentarios (
    id SERIAL PRIMARY KEY,
    created_at DATE,
    hour TIME, 
    contenido VARCHAR(80),
    id_posts INT,
    FOREIGN KEY (id_posts) REFERENCES posts(id)
);

//Insertar 2 comentarios en el post de Pamela y cuatro comentarios en el post de Carlos
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/22/2021', '13:20:00', 'Primer comentario post Pamela',1);
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/21/2021', '20:55:20', 'Segundo comentario post Pamela',1);
INSERT INTO comentarios (created_at, hour, contenido, id_posts)  
VALUES ('07/21/2021', '10:04:12', 'Primer comentario post Carlos',6);
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/21/2021', '11:26:05', 'Segundo comentario post Carlos',6);
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/21/2021', '15:40:12', 'Tercer comentario post Carlos',6);
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/21/2021', '09:47:40', 'Cuarto comentario post Carlos',6);

-- Crear un nuevo post para "Margarita"
INSERT INTO posts (id, username, created_at, contenido, descripcion, titulo) 
VALUES (7, 'Margarita', '07/21/2021', 'Hola buenas tardes', 'primer post de Margarita', 'Hola buenas tardes');

-- Ingresar 5 comentarios para el post de "Margarita"
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/22/2021', '08:20:00', 'Primer comentario post Margarita',7);
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/22/2021', '12:52:30', 'Segundo comentario post Margarita',7);
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/22/2021', '13:14:41', 'Tercer comentario post Margarita',7);
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/22/2021', '13:55:22', 'Cuarto comentario post Margarita',7);
INSERT INTO comentarios (created_at, hour, contenido, id_posts) 
VALUES ('07/22/2021', '15:03:44', 'Quinto comentario post Margarita',7);