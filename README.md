Contenedor de docker creado con VNC

- Autor de la práctica: Izan Arnáiz Gallego
- Profesor: Oriol Boix
- Fecha: 09/05/2025
- Módulo: M9


A continuación, detallaré las instrucciones para funcionamiento del contenedor:

Paso 1: Descargar los archivos necesarios, será necesario descargar tanto el Dockerfile como el archivo de ejecución del script

Paso 2: Tendremos que ejecutar este comando siguiente:

- docker build -t ubuntu-vnc-vscode .

Este comando va a crear la imagen de nuestro contenedor

Paso 3: Para iniciar nuestro contenedor, deberemos ejecutar el siguiente comando que va a iniciar el contenedor:

- docker run -p 5901:5901 -p 2222:22 -it ubuntu-vnc-vscode

Paso 4: En remmina, vamos a introducir en la URL en la barra superior (localhost:5901), esto va a abrir una pestaña que nos pedirá que introduzcamos una pass, en este caso la pass, será "asixciag"

Paso 5: Dentro, abriremos una línea de comandos y vamos a introducir el siguiente comando:

- code --no-sandbox --user-data-dir oriol

Este comando lo que hará, será abrir una ventana con el Visual Studio Code, después de esto, tendremos el contenedor en correcto funcionamiento para el uso que le queramos dar.