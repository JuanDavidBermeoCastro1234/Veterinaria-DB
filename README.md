# Veterinaria-DB

# 🐾 Veterinaria "Mi Mejor Amigo" - Base de Datos

Este proyecto modela y construye una base de datos relacional para la veterinaria **“Mi Mejor Amigo”**, que brinda servicios médicos, de baño, estética y tratamientos para mascotas.

---

## 📂 Estructura del Proyecto

El repositorio contiene los siguientes archivos:

| Archivo             | Descripción                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `estructura.sql`    | Script SQL que crea todas las tablas, llaves primarias y foráneas.         |
| `datos.sql`         | Script con inserciones (`INSERT INTO`) para poblar la base de datos.       |
| `consultas.sql`     | Script con al menos 15 consultas SQL solicitadas por la actividad.         |
| `modelo.png`        | Imagen del diagrama entidad-relación (E-R) de la base de datos.            |
| `video_explica.mp4` | Video explicando las consultas del archivo `consultas.sql`. *(Link abajo)* |

---

## 🧠 Descripción del Proyecto

La base de datos permite registrar y gestionar la siguiente información:

### 🧑 Dueños de Mascotas
- Cédula, nombre completo, número telefónico, dirección.
- Un dueño puede tener múltiples mascotas.

### 🐶 Mascotas
- Datos: nombre, especie, raza, edad, sexo y estado de vacunación.
- Cada mascota pertenece a un único dueño.

### 🧼 Servicios
- Incluye: baño, consulta médica, corte de uñas, etc.
- Cada servicio tiene un nombre, descripción y precio.

### 📅 Visitas
- Registra cuándo una mascota asiste a la veterinaria.
- Cada visita está asociada a una mascota, un servicio y una fecha.
- Solo se realiza **un servicio por visita**.

### 💊 Tratamientos
- En algunas visitas, se recetan tratamientos (con nombre y observaciones).
- Cada tratamiento pertenece a una visita específica.

---

## 🧱 Diagrama Entidad-Relación

![Diagrama E-R](modelo.png)

El diagrama fue generado en **MySQL Workbench**, cumpliendo con:

- Cardinalidades correctas (1:N, N:1).
- Llaves primarias y foráneas.
- Relaciones bien definidas entre las 5 entidades principales.

---

## 📊 Consultas SQL Incluidas

El archivo `consultas.sql` contiene **15 consultas** que incluyen:

- ✅ Alias de campos y subconsultas
- ✅ Funciones de agregación: `COUNT`, `MAX`, `AVG`
- ✅ Funciones de texto: `UPPER`, `LOWER`, `CONCAT`, `SUBSTRING`, `LENGTH`, `TRIM`
- ✅ Función condicional: `IF(...)`
- ✅ Creación de tablas temporales desde consultas
- ✅ `JOIN`, `ORDER BY`, `GROUP BY`

---



## 🛠 Tecnologías Usadas

- MySQL Workbench
- MySQL Server 8.x
- SQL (DDL, DML, DQL)
- Herramientas de modelado E-R

---

## 📌 Autores

Desarrollado como parte del curso de **Bases de Datos** - 2025.

> Entrega final: **22 de mayo de 2025, 11:59 p.m.**
