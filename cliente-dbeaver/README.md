
# Cliente DBeaver Community en Docker

## Descripción

Esta carpeta contiene los archivos utilizados para
implementar el cliente DBeaver Community 26.2.4
dentro de un contenedor Docker en Ubuntu.

El cliente fue utilizado para establecer una
conexión remota con el servidor MySQL de otro
integrante, mediante un túnel TCP de ngrok.

## Entorno utilizado

- VMware Workstation
- Ubuntu
- Docker
- DBeaver Community 26.2.4
- XWayland para la interfaz gráfica

## Archivos

- `Dockerfile`: contiene las instrucciones para
  construir la imagen Docker del cliente.

- `ejecutar-dbeaver.sh`: permite ejecutar el
  contenedor y mostrar DBeaver en Ubuntu.

## Construcción de la imagen

Desde esta carpeta ejecutar:

```bash
sudo docker build -t dbeaver-cliente:26.2.4 .
```

## Ejecución del cliente

Ejecutar desde una sesión gráfica de Ubuntu:

```bash
bash ejecutar-dbeaver.sh
```

El script utiliza las variables DISPLAY y
XAUTHORITY para mostrar la interfaz gráfica
de DBeaver desde el contenedor.

## Verificación

Para comprobar que DBeaver está funcionando
dentro de Docker:

```bash
sudo docker ps
```

El contenedor debe aparecer con el nombre
`dbeaver-cliente` y estado `Up`.

## Conexión con MySQL

Se utilizó el controlador MySQL de DBeaver
para establecer la conexión con el servidor
remoto mediante ngrok.

Durante las pruebas se configuró el modo
SSL como REQUIRED.

No se incluyen contraseñas ni credenciales
de acceso en este repositorio.

## Pruebas realizadas

Desde el cliente DBeaver se ejecutaron
instrucciones SQL como:

```sql
SHOW DATABASES;
SHOW TABLES FROM db_redes;
USE db_redes;
```

También se realizó la creación de una
tabla de prueba llamada `alumnos`.

Estas operaciones permitieron verificar
la comunicación entre el cliente DBeaver
y el servidor MySQL.
