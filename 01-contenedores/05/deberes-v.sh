#Deberes:
# 1. Crea un contenedor que utilice un volumen llamado datos y copia dentro de él algunas imágenes
    # Hay dos opciones para crear un volumen: 
        # Con el comando 'docker volume create'
        docker volume create mi-volumen
        # Directamente durante la creación del contenedor
        docker run -dit --name mi-contenedor --mount src=mi-volumen,dst=/vol alpine
    # Copiar las imágenes dentro del volumen
    docker cp images/. mi-contenedor:/vol
    # Comprobar que las imágenes se han copiado
    docker exec mi-contenedor ls /vol
# 2. Elimina el contenedor anterior y comprueba que tu volumen sigue estando disponible.
    # Para eliminar el contenedor
    docker rm -f mi-contenedor
    # Comprobar que el volumen sigue estándo disponible
    docker volume ls
    # Comprobar el contenido del volumen
    sudo docker ls /var/lib/docker/volumes/mi-volumen/_data
    # Para eliminar el volumen
    docker volume rm mi-volumen
    # Si hubiese varios volúmenes sin usar
    docker volume prune -f
# 3. Mapea una carpeta local a un contenedor. Cambia el contenido de dicha carpeta y comprueba que ves los cambios dentro del contenedor.
    # Mapeo de la carpeta local al contenedor
    docker run -dit --name mi-contenedor --mount type=bind,src="$(pwd)"/shared,dst=/shared alpine
    # Modificar el contenido de la carpeta 'shared/' desde el host. Por ejemplo crear el fichero 'file.txt'
    # Comprobar que el contenido de la carpeta se ha modificado también el contenedor
    docker exec mi-contenedor ls /shared