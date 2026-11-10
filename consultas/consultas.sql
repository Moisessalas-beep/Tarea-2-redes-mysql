
-- Tarea 2: Analisis de Trafico MySQL
-- Taller de Redes y Servicios - UDP
-- Cliente: DBeaver Community
-- Servidor: MySQL en Docker

-- 1. Consultar las bases de datos disponibles
SHOW DATABASES;

-- 2. Consultar las tablas de db_redes
SHOW TABLES FROM db_redes;

-- 3. Seleccionar la base de datos
USE db_redes;

-- 4. Crear una tabla de prueba
-- IF NOT EXISTS evita errores si ya fue creada.
CREATE TABLE IF NOT EXISTS alumnos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    carrera VARCHAR(50)
);

-- 5. Consultar la estructura de la tabla
DESCRIBE alumnos;

-- 6. Consultar los registros
SELECT * FROM alumnos;
