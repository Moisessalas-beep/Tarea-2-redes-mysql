# Tarea 2: Análisis de Tráfico del Protocolo MySQL

**Taller de Redes y Servicios — Semestre 2026-2**  
**Universidad Diego Portales — Facultad de Ingeniería y Ciencias**

## Integrantes

- Diego Díaz
- Moisés Salas

## 1. Descripción del proyecto

Este repositorio contiene los archivos y entregables correspondientes a la Tarea 2 de Taller de Redes y Servicios.

El trabajo tiene como propósito estudiar la comunicación entre un servidor MySQL y un cliente DBeaver Community, utilizando contenedores Docker ejecutados en máquinas virtuales Ubuntu.

Se realizaron conexiones remotas y operaciones SQL para comprobar el intercambio de información entre ambos programas y estudiar el tráfico de red generado por el protocolo MySQL.

Además, se consideran las posibles consecuencias que tendría la modificación de los mensajes intercambiados durante la comunicación cliente-servidor.

## 2. Herramientas utilizadas

Para desarrollar el laboratorio se utilizaron las siguientes herramientas:

- **VMware Workstation:** ejecución de las máquinas virtuales.
- **Ubuntu:** sistema operativo utilizado por ambos integrantes.
- **Docker:** creación y ejecución de los contenedores.
- **MySQL Server:** servidor de bases de datos.
- **DBeaver Community 26.2.4:** cliente para establecer conexiones y ejecutar consultas SQL.
- **Docker Compose:** configuración y despliegue del servidor MySQL.
- **ngrok:** establecimiento de un túnel TCP para permitir la conexión remota entre los equipos.
- **Wireshark:** herramienta considerada para la captura y el análisis del tráfico de red.
- **Overleaf y LaTeX:** elaboración del informe técnico.

## 3. Estructura del repositorio

El repositorio está organizado de la siguiente manera:

**`cliente-dbeaver/`**

Contiene los archivos utilizados para construir y ejecutar el cliente DBeaver dentro de Docker:

- `Dockerfile`
- `ejecutar-dbeaver.sh`
- `README.md`

**`servidor-mysql/`**

Contiene la configuración del servidor MySQL:

- `docker-compose.yml`

**`consultas/`**

Contiene los comandos SQL utilizados y preparados para las pruebas:

- `consultas.sql`

**`informe/`**

Contiene el informe técnico y sus archivos de respaldo:

- `Tarea2_MySQL.pdf`: informe en formato PDF.
- `main.tex`: código fuente LaTeX.
- `logo_udp.jpeg`: logotipo institucional.
- `captura_*.png`: capturas de las pruebas del laboratorio.
- Otros recursos utilizados en la elaboración del documento.

**`README.md`**

Documento principal con la descripción, estructura e instrucciones de despliegue del proyecto.

## 4. Despliegue del laboratorio

El laboratorio se desarrolló utilizando dos computadores ubicados en redes diferentes. Cada integrante trabajó desde una máquina virtual Ubuntu con Docker.

### 4.1. Servidor MySQL

El servidor MySQL fue implementado mediante Docker Compose.

Su archivo de configuración se encuentra en:

`servidor-mysql/docker-compose.yml`

La configuración utiliza:

- Imagen Docker: `mysql/mysql-server:latest`
- Nombre del contenedor: `mysql_Tarea2`
- Base de datos inicial: `db_redes`
- Puerto TCP: `3306`

Para iniciar el servidor desde la raíz del repositorio:

```bash
cd servidor-mysql
sudo docker compose up -d
```

Este comando requiere tener Docker Compose instalado. Si se utiliza la versión independiente del programa, el comando correspondiente es `sudo docker-compose up -d`.

### 4.2. Cliente DBeaver Community

El cliente fue implementado dentro de un contenedor Docker utilizando DBeaver Community 26.2.4.

Los archivos correspondientes se encuentran en:

`cliente-dbeaver/`

Para construir la imagen Docker desde la raíz del repositorio:

```bash
cd cliente-dbeaver
sudo docker build -t dbeaver-cliente:26.2.4 .
```

Para ejecutar DBeaver desde una sesión gráfica de Ubuntu:

```bash
bash ejecutar-dbeaver.sh
```

El script configura las variables y los recursos gráficos necesarios para visualizar DBeaver desde el contenedor mediante XWayland.

Para comprobar que el cliente se encuentra en ejecución:

```bash
sudo docker ps
```

### 4.3. Comunicación remota mediante ngrok

Como los integrantes trabajaron desde ubicaciones y redes diferentes, se utilizó un túnel TCP mediante ngrok para permitir el acceso remoto al servidor MySQL.

El túnel proporcionó una dirección y un puerto de conexión que fueron configur
