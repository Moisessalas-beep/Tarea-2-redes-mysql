# Tarea 2: Análisis de Tráfico del Protocolo MySQL

**Taller de Redes y Servicios — Semestre 2026-2**  
**Universidad Diego Portales — Facultad de Ingeniería y Ciencias**

## Integrantes

- Diego Díaz
- Moisés Salas

## 1. Descripción del proyecto

Este repositorio contiene los archivos y entregables correspondientes a la Tarea 2 de la asignatura Taller de Redes y Servicios.

El objetivo del trabajo es estudiar el funcionamiento de la comunicación entre un servidor MySQL y un cliente DBeaver Community, utilizando contenedores Docker ejecutados en máquinas virtuales Ubuntu.

Para ello, se implementó un entorno cliente-servidor, se estableció una conexión remota entre ambos equipos y se realizaron consultas SQL para verificar el intercambio de información.

También se desarrolló un análisis del protocolo MySQL, considerando las características del tráfico generado y las posibles consecuencias de modificar los mensajes intercambiados durante la comunicación.

## 2. Herramientas utilizadas

Durante el desarrollo del laboratorio se utilizaron las siguientes herramientas:

- **VMware Workstation:** plataforma de virtualización utilizada para ejecutar Ubuntu.
- **Ubuntu:** sistema operativo empleado por ambos integrantes.
- **Docker:** herramienta utilizada para ejecutar los contenedores.
- **Docker Compose:** configuración y despliegue del servidor MySQL.
- **MySQL Server:** servidor de bases de datos.
- **DBeaver Community 26.2.4:** cliente utilizado para conectarse al servidor y ejecutar consultas SQL.
- **ngrok:** herramienta utilizada para establecer un túnel TCP y permitir la conexión remota entre los equipos.
- **Wireshark:** herramienta de captura y análisis de tráfico de red utilizada en el laboratorio.
- **Overleaf y LaTeX:** herramientas utilizadas para elaborar el informe técnico.

## 3. Estructura del repositorio

El repositorio está organizado en las siguientes carpetas y archivos:

```text
Tarea-2-redes-mysql/
│
├── README.md
│
├── cliente-dbeaver/
│   ├── Dockerfile
│   ├── ejecutar-dbeaver.sh
│   └── README.md
│
├── servidor-mysql/
│   └── docker-compose.yml
│
├── consultas/
│   └── consultas.sql
│
└── informe/
    ├── README.md
    ├── main.tex
    ├── Tarea2_MySQL.pdf
    ├── logo_udp.jpeg
    ├── captura_create_table.png
    ├── captura_dbeaver_conectado.png
    ├── captura_docker_cliente.png
    ├── captura_show_databases.png
    └── Otros archivos de apoyo
```

### Cliente DBeaver

La carpeta `cliente-dbeaver/` contiene los archivos utilizados para construir y ejecutar DBeaver Community dentro de Docker.

### Servidor MySQL

La carpeta `servidor-mysql/` contiene el archivo Docker Compose utilizado para configurar y ejecutar el servidor MySQL.

### Consultas SQL

La carpeta `consultas/` contiene las instrucciones SQL utilizadas y preparadas para las pruebas de comunicación entre cliente y servidor.

### Informe técnico

La carpeta `informe/` contiene el informe en PDF, su código fuente LaTeX y las imágenes utilizadas como evidencia del laboratorio.

## 4. Despliegue del laboratorio

El laboratorio se desarrolló utilizando dos computadores ubicados en redes diferentes. Cada integrante trabajó desde una máquina virtual Ubuntu con Docker.

### 4.1. Servidor MySQL

El servidor MySQL fue implementado utilizando Docker Compose.

El archivo de configuración se encuentra en:

`servidor-mysql/docker-compose.yml`

La configuración utilizada contempla:

- Imagen: `mysql/mysql-server:latest`
- Contenedor: `mysql_Tarea2`
- Base de datos inicial: `db_redes`
- Puerto TCP: `3306`

Para iniciar el servidor desde la carpeta principal del repositorio:

```bash
cd servidor-mysql
sudo docker compose up -d
```

Este comando requiere disponer de Docker Compose.

Para verificar que el servidor se encuentra funcionando:

```bash
sudo docker ps
```

### 4.2. Cliente DBeaver Community

El cliente fue implementado mediante un contenedor Docker con DBeaver Community 26.2.4.

Los archivos correspondientes se encuentran en:

`cliente-dbeaver/`

Para construir la imagen desde la carpeta principal del repositorio:

```bash
cd cliente-dbeaver
sudo docker build -t dbeaver-cliente:26.2.4 .
```

Para ejecutar el cliente desde una sesión gráfica de Ubuntu:

```bash
bash ejecutar-dbeaver.sh
```

El script utiliza las variables `DISPLAY` y `XAUTHORITY` para permitir la visualización de la interfaz gráfica de DBeaver desde el contenedor mediante XWayland.

Para verificar su funcionamiento:

```bash
sudo docker ps
```

El contenedor deberá aparecer con el nombre `dbeaver-cliente` y estado `Up` mientras la aplicación esté funcionando.

### 4.3. Comunicación remota mediante ngrok

Como ambos integrantes trabajaron desde redes diferentes, se utilizó un túnel TCP mediante ngrok para permitir la conexión remota entre DBeaver y MySQL.

El túnel proporcionó una dirección y un puerto de acceso que fueron configurados en el cliente DBeaver.

De esta manera, fue posible establecer comunicación con el servidor y ejecutar operaciones sobre la base de datos `db_redes`.

Durante la configuración del cliente se utilizó `sslMode=REQUIRED`, por lo que se debe considerar el cifrado TLS al interpretar el tráfico de aplicación.

## 5. Consultas SQL realizadas

Durante las pruebas se ejecutaron instrucciones SQL para verificar el funcionamiento de la conexión entre cliente y servidor.

Entre las operaciones realizadas se encuentran:

```sql
SHOW DATABASES;

SHOW TABLES FROM db_redes;

USE db_redes;

CREATE TABLE alumnos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    carrera VARCHAR(50)
);
```

Estas instrucciones permitieron consultar las bases de datos disponibles, revisar las tablas existentes, seleccionar la base de datos de trabajo y crear una tabla de prueba.

El archivo `consultas/consultas.sql` reúne estas instrucciones y otras consultas complementarias para revisar la estructura y los registros de la tabla.

## 6. Análisis del tráfico

El análisis se enfoca en la comunicación entre el cliente DBeaver Community y el servidor MySQL mediante el protocolo MySQL sobre TCP.

Se consideran las distintas etapas de comunicación:

- Establecimiento de la conexión TCP.
- Intercambio inicial de mensajes del protocolo MySQL.
- Autenticación entre cliente y servidor.
- Envío de solicitudes SQL.
- Procesamiento y respuesta del servidor.
- Posibles efectos de modificar mensajes durante la comunicación.

El análisis también considera el uso de TLS, ya que las consultas SQL y sus resultados pueden estar cifrados, aunque continúen siendo observables características de los paquetes como direcciones, puertos, tamaños y tiempos.

Los procedimientos, evidencias y resultados del análisis se presentan en el informe técnico y en el video demostrativo.

## 7. Informe técnico

El informe desarrollado para esta tarea se encuentra disponible en:

**[Ver informe de la Tarea 2 en PDF](informe/Tarea2_MySQL.pdf)**

También se incluye el código fuente LaTeX en el archivo `informe/main.tex`.

El informe contempla los siguientes capítulos:

### Capítulo 1: Introducción al protocolo

Se presentan las características del protocolo MySQL, su arquitectura cliente-servidor, su propósito y el tráfico esperado durante las operaciones de comunicación.

### Capítulo 2: Análisis de tráfico

Se describe la instalación y configuración del laboratorio, el tráfico observado y las suposiciones sobre las consecuencias de modificar mensajes durante la comunicación.

## 8. Video demostrativo

Como parte de los entregables de la Tarea 2, se realizó un video demostrativo del laboratorio.

Este material complementa el informe técnico y presenta el entorno utilizado para la comunicación entre el cliente DBeaver Community y el servidor MySQL, junto con las pruebas desarrolladas durante la actividad.

### Ver video demostrativo

**[Video demostrativo — Tarea 2: Análisis de Tráfico MySQL](https://youtu.be/fAZ5Xa_pKl8?si=9WkqAlrIQy7mq7Nv)**

El video corresponde al material audiovisual de respaldo de la tarea, cuyo límite establecido es de 8 minutos.

## 9. Conclusiones generales

El desarrollo del laboratorio permitió implementar una arquitectura cliente-servidor utilizando MySQL y DBeaver Community dentro de contenedores Docker, ejecutados en máquinas virtuales Ubuntu.

Mediante ngrok se consiguió establecer una conexión remota entre dos computadores ubicados en redes diferentes, permitiendo realizar operaciones SQL sobre el servidor MySQL.

Las consultas ejecutadas permitieron comprobar la comunicación entre ambos componentes y observar el funcionamiento del sistema desde la perspectiva del cliente.

Además, el trabajo permitió abordar conceptos de conectividad TCP, protocolos de aplicación, tráfico de red y posibles consecuencias de alterar los mensajes intercambiados.

La experiencia contribuyó a comprender cómo interactúan las herramientas de administración de bases de datos con los servicios de red y la importancia de analizar sus comunicaciones.

## 10. Entregables

Los entregables de la Tarea 2 se encuentran organizados en este repositorio:

- Código y configuración Docker del servidor MySQL.
- Dockerfile y script de ejecución del cliente DBeaver.
- Consultas SQL del laboratorio.
- Informe técnico en PDF
