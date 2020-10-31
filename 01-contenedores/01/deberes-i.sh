#Deberes:
# 1. Crear un contenedor con MongoDB, protegido con usuario y contraseña, añadir una colección, crear un par de documentos y acceder a ella a través de MongoDB Compass
    # Pasos:
    # - Localizar la imagen en Docker Hub para crear un MongoDB
    docker search mongo
    # - Ver qué parámetros necesito para crearlo
    docker run -d --name some-mongo -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret -p 27017:27017 mongo
    # - Acceder a través del CLI para mongo y crear una colección llamada books con este formato {name: 'Kubernetes in Action', author: 'Marko Luksa'} en la base de datos test
    # >>>>> Comando para conectarse a mongo aquí <<<<
    docker exec -it some-mongo mongo -u mongoadmin -p secret

#Por si no sabes los comandos a ejecutar en MongoDB :-)
db.getName()
use test
db.books.insert({
    name: 'Kubernetes in Action',
    author: 'Marko Luksa'
})
db.books.find({})
exit
    # - Ver los logs de tu nuevo mongo
    docker logs some-mongo
    # - Descargar MongoDB Compass (https://www.mongodb.com/try/download/compass)
    # - Accede a tu MongoDB en Docker con la siguiente cadena de conexión: mongodb://mongoadmin:secret@localhost:27017 y tus credenciales
    # - Revisa que tu colección está dentro de la base de datos test y que aparece el libro que insertaste.
    # - Intenta añadir otro documento

# 2. Servidor Nginx
#    - Crea un servidor Nginx llamado lemoncoders-web y copia el contenido de la carpeta lemoncoders-web en la ruta que sirve este servidor web.
    docker run -d --name lemoncoders-web -p 9999:80 nginx
    docker cp lemoncoders-web lemoncoders-web:/usr/share/nginx/html
#    - Ejecuta dentro del contenedor la acción ls, para comprobar que los archivos se han copiado correctamente.
    docker exec lemoncoders-web ls /usr/share/nginx/html
#    - Hacer que el servidor web sea accesible desde el puerto 9999 de tu local.

# 3. Eliminar todos los contenedores que tienes ejecutándose en tu máquina en una sola línea.
    docker rm $(docker ps -aq)