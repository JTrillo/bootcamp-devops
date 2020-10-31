#Deberes:
# 1. Crear una imagen con un servidor web Apache y el mismo contenido que en la carpeta content (fijate en el Dockerfile con el que cree simple-nginx)
    --- Dockerfile ---
    #Imagen que voy a utilizar como base
    FROM httpd

    #Etiquetado
    LABEL maintainer="jokinator20@gmail.com"
    LABEL project="bootcamp_devops"

    #Como metadato, indicamos que el contenedor utiliza el puerto 80
    EXPOSE 80

    #Modificaciones sobre la imagen que he utilizado como base, en este caso alpine
    COPY content/ /usr/local/apache2/htdocs
    --- End Dockerfile ---

    docker build . -t simple-httpd:v1
# 2. Averiguar cuántas capas tiene mi nueva imagen
    docker inspect simple-httpd:v1 #Tiene 6