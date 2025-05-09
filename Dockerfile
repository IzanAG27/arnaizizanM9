# Imagen base: Ubuntu 24.04
FROM ubuntu:24.04

# Configuración para evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root

# Instalación de paquetes esenciales
RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 xfce4-goodies tightvncserver dbus-x11 xfonts-base \
    openssh-server python3 python3-pip wget gnupg2 \
    libgtk-3-0 libgbm1 libx11-6 libxss1 libxtst6 libnss3 libcups2 libxkbcommon0 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Preparar entorno VNC
RUN mkdir -p /root/.vnc && \
    echo "asixciag" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Crear fichero necesario para la sesión gráfica
RUN touch /root/.Xauthority

# Resolución del entorno gráfico
ENV RESOLUTION=1280x800

# Puertos necesarios
EXPOSE 5901 22

# Directorio de trabajo
WORKDIR /workspace

# Copiar script de arranque
COPY vnc.sh /vnc.sh
RUN chmod +x /vnc.sh

# Instalación de VS Code
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list && \
    apt-get update && apt-get install -y --no-install-recommends code && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Ejecutar script de entrada al iniciar
CMD ["/vnc.sh"]

