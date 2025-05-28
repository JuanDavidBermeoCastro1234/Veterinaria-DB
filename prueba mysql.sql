CREATE DATABASE IF NOT EXISTS veterinaria;
USE veterinaria;

CREATE TABLE duenio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula INT NOT NULL UNIQUE,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT,
    direccion VARCHAR(100)
);

CREATE TABLE mascotas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    especie VARCHAR(45),
    raza VARCHAR(45),
    sexo VARCHAR(45),
    edad INT,
    vacunada VARCHAR(10),
    duenio_mascota_id INT,
    FOREIGN KEY (duenio_mascota_id) REFERENCES duenio(id)
);

CREATE TABLE servicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    servicio VARCHAR(45) NOT NULL,
    descripcion VARCHAR(45),
    servicioscol VARCHAR(45),
    nombre VARCHAR(45),
    precio INT
);

CREATE TABLE visita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_visita DATE NOT NULL,
    mascota_id INT,
    servicio_id INT,
    FOREIGN KEY (mascota_id) REFERENCES mascotas(id),
    FOREIGN KEY (servicio_id) REFERENCES servicios(id)
);

CREATE TABLE tratamiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tratamiento VARCHAR(50),
    observaciones VARCHAR(100),
    visita_id INT,
    FOREIGN KEY (visita_id) REFERENCES visita(id)
);

-- Insertar Dueños
INSERT INTO duenio (cedula, nombre, numero_telefono, direccion) VALUES
(123456789, 'Carlos Ruiz', 3201112233, 'Calle 1 #10-20'),
(987654321, 'Laura Gómez', 3005558899, 'Carrera 2 #11-22'),
(456789123, 'Mario Pérez', 3109991122, 'Calle 3 #15-30'),
(321654987, 'Sofia Rojas', 3117776655, 'Carrera 5 #20-40'),
(789123456, 'Andrés López', 3123334466, 'Calle 7 #30-50');

-- Insertar Mascotas
INSERT INTO mascotas (nombre, especie, raza, sexo, edad, vacunada, duenio_mascota_id) VALUES
('Firulais', 'Perro', 'Labrador', 'Macho', 3, 'Si', 1),
('Mishi', 'Gato', 'Angora', 'Hembra', 2, 'No', 2),
('Rex', 'Perro', 'Pastor Alemán', 'Macho', 5, 'Si', 3),
('Luna', 'Gato', 'Siames', 'Hembra', 1, 'Si', 4),
('Max', 'Perro', 'Poodle', 'Macho', 4, 'No', 5),
('Nala', 'Perro', 'Golden', 'Hembra', 6, 'Si', 1),
('Toby', 'Gato', 'Persa', 'Macho', 3, 'Si', 2),
('Pelusa', 'Conejo', 'Mini lop', 'Hembra', 2, 'No', 3),
('Rocky', 'Perro', 'Boxer', 'Macho', 4, 'Si', 4),
('Lola', 'Gato', 'Egipcio', 'Hembra', 1, 'No', 5);

-- Insertar Servicios
INSERT INTO servicios (servicio, descripcion, servicioscol, nombre, precio) VALUES
('Baño', 'Baño con agua tibia y shampoo', 'Cuidado', 'Baño', 20000),
('Corte de uñas', 'Corte seguro de uñas', 'Estetica', 'Uñas', 15000),
('Consulta médica', 'Revisión general', 'Salud', 'Consulta', 30000),
('Vacunación', 'Aplicación de vacuna', 'Salud', 'Vacuna', 25000),
('Desparasitación', 'Tratamiento antiparasitario', 'Salud', 'Desparasitar', 18000);

-- Insertar Visitas
INSERT INTO visita (fecha_visita, mascota_id, servicio_id) VALUES
('2025-05-01', 1, 1),
('2025-05-02', 2, 3),
('2025-05-03', 3, 5),
('2025-05-04', 4, 2),
('2025-05-05', 5, 4),
('2025-05-06', 6, 1),
('2025-05-07', 7, 3),
('2025-05-08', 8, 5),
('2025-05-09', 9, 2),
('2025-05-10', 10, 4);

-- Insertar Tratamientos
INSERT INTO tratamiento (tratamiento, observaciones, visita_id) VALUES
('Antibiotico', 'Administrar cada 8 horas', 2),
('Antipulgas', 'Aplicar sobre la piel', 3),
('Vitaminas', 'Una diaria por 10 dias', 7),
('Antibiótico', 'Para infección ocular', 9),
('Suplemento digestivo', 'Por desparasitación', 10);


-- 1. Listar todos los dueños y el número de mascotas que tiene cada uno
SELECT d.nombre AS Nombre_Dueno, COUNT(m.id) AS Cantidad_Mascotas
FROM duenio d
LEFT JOIN mascotas m ON d.id = m.duenio_mascota_id
GROUP BY d.nombre;

-- 2. Mostrar nombre, especie y si está vacunada en mayúscula
SELECT nombre, especie, UPPER(vacunada) AS Vacunacion FROM mascotas;

-- 3. Mostrar el nombre del servicio, su precio con alias y redondeado a miles
SELECT servicio, ROUND(precio, -3) AS Precio_Redondeado FROM servicios;

-- 4. Concatenar nombre y especie de mascota
SELECT CONCAT(nombre, ' - ', especie) AS Identificador FROM mascotas;

-- 5. Mostrar tratamientos con observaciones en minúscula
SELECT tratamiento, LOWER(observaciones) AS Observaciones FROM tratamiento;

-- 6. Mostrar visitas con alias en subconsulta
SELECT v.fecha_visita, m.nombre AS Mascota, s.servicio AS Servicio
FROM visita v
JOIN mascotas m ON v.mascota_id = m.id
JOIN servicios s ON v.servicio_id = s.id;

-- 7. Contar mascotas vacunadas
SELECT COUNT(*) AS Total_Vacunadas FROM mascotas WHERE vacunada = 'Si';

-- 8. Obtener longitud del nombre del servicio
SELECT servicio, LENGTH(servicio) AS Longitud FROM servicios;

-- 9. Substring de los nombres de mascotas
SELECT nombre, SUBSTRING(nombre, 1, 3) AS Prefijo FROM mascotas;

-- 10. Mostrar servicios con descripción sin espacios extras
SELECT servicio, TRIM(descripcion) AS Descripcion_Limpia FROM servicios;

-- 11. Mostrar IF para estado de vacunación
SELECT nombre, IF(vacunada = 'Si', 'Protegido', 'Sin vacuna') AS Estado FROM mascotas;

-- 12. Crear tabla temporal con nombre y edad de mascotas
CREATE TEMPORARY TABLE mascotas_temporal AS
SELECT nombre, edad FROM mascotas;

-- 13. Listar nombre y especie ordenados por edad descendente
SELECT nombre, especie, edad FROM mascotas ORDER BY edad DESC;

-- 14. Promedio de edad de mascotas
SELECT AVG(edad) AS Edad_Promedio FROM mascotas;

-- 15. Servicio más caro
SELECT servicio, precio FROM servicios ORDER BY precio DESC LIMIT 1;
