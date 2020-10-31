#Deberes: 
# 1. Dockeriza la aplicación de la carpeta hello-lemoncoder con Visual Studio Code
    # Para crear el archivo Dockerfile y .dockerignore con VS Code hay que abrir el Command Palette >
    # Add Docker Files to Workspace y seleccionar Node.js. Luego generar la imagen:
    docker build ./hello-lemoncoder/ -t hellolemoncoder --no-cache
    # También se puede hacer click derecho en el archivo Dockerfile y seleccionar Build Image...
# 2. Ejecutar un contenedor con tu nueva imagen
    docker run -p 3000:3000 --name hello -d hellolemoncoder
# 3. Añade un archivo de prueba en el contenedor y crea una nueva imagen a partir de dicho contenedor.
    # Crear archivo en local
    echo "Hello, World!" > hello-lemoncoder.txt
    # Copiarlo dentro del contenedor
    docker cp hello-lemoncoder.txt hello:/usr/src/app/hello-lemoncoder.txt
    # Comprobar que se ha copiado correctamente
    docker exec hello ls -l /usr/src/app/
    # Crear la nueva imagen con el nuevo archivo con el comando 'docker commit'
    docker commit hello newhelloimage
    # Comprobar que se ha creado
    docker images
    # Generar nuevo contenedor con la nueva imagen
    docker run -p 4000:3000 --name newhello -d newhelloimage
    # Comprobar que el nuevo archivo está donde se copió
    docker exec newhello ls -l /usr/src/app/