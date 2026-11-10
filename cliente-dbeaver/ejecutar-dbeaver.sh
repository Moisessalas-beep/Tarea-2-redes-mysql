
#!/bin/bash

# Tarea 2 - Taller de Redes y Servicios
# Cliente: DBeaver Community en Docker

# Comprobar que existe una sesion grafica
if [ -z "${DISPLAY:-}" ] || [ -z "${XAUTHORITY:-}" ] || [ ! -f "$XAUTHORITY" ]; then
    echo "Error: no se encontro una sesion grafica X11 valida."
    exit 1
fi

# Crear carpeta para conservar los datos de DBeaver
mkdir -p "$HOME/cliente-dbeaver/datos"

# Ejecutar DBeaver dentro del contenedor
sudo docker run --rm -it \
  --name dbeaver-cliente \
  -e DISPLAY="$DISPLAY" \
  -e XAUTHORITY=/tmp/.Xauthority \
  -e HOME=/home/dbeaver \
  -e LIBGL_ALWAYS_SOFTWARE=1 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v "$XAUTHORITY":/tmp/.Xauthority:ro \
  -v "$HOME/cliente-dbeaver/datos":/home/dbeaver/.local/share/DBeaverData \
  dbeaver-cliente:26.2.4
