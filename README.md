# Tarea 2: Análisis de Tráfico del Protocolo MySQL

**Taller de Redes y Servicios — Semestre 2026-2**  
**Universidad Diego Portales — Facultad de Ingeniería y Ciencias**

## Integrantes
- Diego Díaz
- Moisés Salas

## Descripción del proyecto

Este repositorio reúne los archivos y entregables de la Tarea 2 de Taller de Redes y Servicios.

El trabajo consiste en estudiar la comunicación entre un servidor MySQL y un cliente DBeaver Community, utilizando contenedores Docker sobre máquinas virtuales Ubuntu.

El propósito es analizar el tráfico de red generado por las conexiones y las consultas SQL, además de estudiar las posibles consecuencias de modificar los mensajes intercambiados.

## Herramientas utilizadas

- Ubuntu en VMware Workstation.
- Docker para ejecutar los contenedores.
- MySQL Server como servidor de bases de datos.
- DBeaver Community como cliente.
- ngrok para habilitar la conexión remota entre los equipos.
- Wireshark para capturar y analizar tráfico de red.

## Estructura del repositorio

**informe/**: código LaTeX, informe PDF y evidencias utilizadas.

**cliente-dbeaver/**: Dockerfile, instrucciones de ejecución y archivos del cliente.

**servidor-mysql/**: configuración Docker Compose del servidor y su documentación.

**consultas/**: scripts SQL utilizados durante las pruebas.

**capturas/**: evidencias de ejecución y análisis del tráfico.

## Desarrollo del laboratorio

El laboratorio se realizó desde dos computadores ubicados en redes diferentes. Cada integrante utilizó una máquina virtual Ubuntu con su respectivo contenedor Docker.

Se utilizó ngrok para habilitar el acceso remoto al servidor MySQL. Desde DBeaver se realizaron consultas y operaciones sobre una base de datos de prueba.

Durante la configuración del cliente se utilizó el modo SSL `REQUIRED`, por lo que el análisis debe considerar el posible cifrado TLS del tráfico.

## Despliegue

El cliente DBeaver puede construirse desde su Dockerfile. La configuración exacta del servidor y sus instrucciones de despliegue estarán disponibles en la carpeta `servidor-mysql/`.

## Informe técnico

El informe desarrolla la introducción al protocolo MySQL, el análisis del tráfico generado y las hipótesis sobre posibles modificaciones de la comunicación.

## Video demostrativo

**Pendiente:** incorporar el enlace al video de demostración, de máximo 8 minutos.

## Observaciones

Este repositorio contiene exclusivamente archivos académicos de prueba. No se incluyen contraseñas, credenciales privadas ni información sensible de las conexiones.
