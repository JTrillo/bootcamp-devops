#Deberes
#1. Crea un cluster con Docker Swarm y con Docker Machine (3 masters y 2 workers)
    # Primero hay que crear las 5 máquinas
    docker-machine create --driver virtualbox master-0
    docker-machine create --driver virtualbox master-1
    docker-machine create --driver virtualbox master-2
    docker-machine create --driver virtualbox worker-0
    docker-machine create --driver virtualbox worker-1
    # Ahora iniciamos en master-0 el cluster con Docker Swarn
    eval $(docker-machine env master-0) # Para apuntar a master-0
    docker swarm init --advertise-addr 192.168.99.101
    # Antes de añadir los otros master hay que obtener el token de los masters
    docker swarm join-token master
    # Añadir master-1
    eval $(docker-machine env master-1) # Para apuntar a master-1
    docker swarm join --token TOKEN_MASTER 192.168.99.101:2377
    # Añadir master-2
    eval $(docker-machine env master-2) # Para apuntar a master-2
    docker swarm join --token TOKEN_MASTER 192.168.99.101:2377
    # Añadir worker-0
    eval $(docker-machine env worker-0) # Para apuntar a worker-0
    docker swarm join --token TOKEN_WORKER 192.168.99.101:2377
    eval $(docker-machine env worker-1) # Para apuntar a worker-1
    docker swarm join --token TOKEN_WORKER 192.168.99.101:2377
    # Unset de las variables de entorno
    eval $(docker-machine env -u)
#2. Despliega un nginx con 3 replicas solo en los workers con docker service
    # Ejecutar este comando desde uno de los nodos manager
    eval $(docker-machine env master-0)
    docker service create --replicas 3 --name nginx-workers \
        --constraint node.role==worker nginx
#3. Despliega el mismo nginx con Docker Stacks
    # Primero hay que crear el archivo de Docker Compose
        # --- docker-compose.yml ---
        # version: "3.8"
        # services:
        #     nginx-workers: nginx
        #     deploy:
        #         replicas: 3
        #         placement:
        #             constraints:
        #                 - "node.role==worker"
        # --- End docker-compose.yml ---
    # Desplegar el stack desde uno de los nodos manager
    eval $(docker-machine env master-0)
    docker stack deploy -c docker-compose.yml stacknginx