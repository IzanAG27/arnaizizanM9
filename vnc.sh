#!/bin/bash

# Asegura que el hostname esté correctamente registrado en /etc/hosts
echo "[INFO] Actualizando el fichero /etc/hosts..."
CURRENT_HOST=$(hostname)
echo "127.0.1.1    $CURRENT_HOST" >> /etc/hosts

# Arranca el servidor VNC con la resolución indicada
echo "[INFO] Iniciando el servidor VNC con resolución: $RESOLUTION"
vncserver -kill :1 > /dev/null 2>&1 || true
vncserver :1 -geometry "$RESOLUTION" &

echo "[OK] Servidor VNC activo en resolución $RESOLUTION."

# Mantiene el contenedor en ejecución
echo "[INFO] Contenedor en espera. Presiona CTRL+C para detenerlo."
tail -f /dev/null
