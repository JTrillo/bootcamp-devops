#Deberes:
# 1. Crea una nueva red de tipo bridge/nat llamada lemoncode
    docker network create lemoncode
# 2. Crea dos contenedores dentro de la red que acabas de crear, uno de ellos con la imagen nginx
    docker run -d --name contenedor-nginx --network lemoncode nginx
    docker run -dit --name contenedor-ubuntu --network lemoncode ubuntu bash
# 3. Con cURL y el nombre del contenedor solicita la web que se está ejecutando con Nginx
    # Abrir el terminal del contenedor que no es nginx
    docker attach contenedor-ubuntu
    # Como esta imagen no tiene cURL, instalarlo
    apt update && apt upgrade
    apt-get install curl -y
    # Al estar en una red bridge, podemos usar el nombre del contenedor nginx en lugar de su IP en la red
    curl http://contenedor-nginx
    # Para cerrar el terminal
    exit