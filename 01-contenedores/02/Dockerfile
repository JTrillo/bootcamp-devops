#Imagen que voy a utilizar como base
FROM httpd

#Etiquetado
LABEL maintainer="jokinator20@gmail.com"
LABEL project="bootcamp_devops"

#Como metadato, indicamos que el contenedor utiliza el puerto 80
EXPOSE 80

#Modificaciones sobre la imagen que he utilizado como base, en este caso alpine
COPY content/ /usr/local/apache2/
