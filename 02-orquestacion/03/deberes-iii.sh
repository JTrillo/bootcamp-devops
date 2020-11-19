# Escenario 1
# ===========
# Aplica el contenido del fichero deberes-1.yaml al cluster (kubectl create -f deberes-1.yaml)

# Alguien del equipo de desarrollo ha intentado desplegar dos réplicas de la web (lemoncodersbc/hello-world-web:v1) en el clúster pero NO funciona.
# ¿Qué está ocurriendo?
    # La imagen que ambos pods tratan de hacer pull no existe, por ello da el error 'ErrImagePull'
    # Dicha imagen sólo tiene tags 'v1' y 'v2', y se está tratando de hacer pull de la versión 'latest'

# Arregla ese desaguisado: despliega dos réplicas de la web y asegúrate de que funcionan (pods corriendo, web accesible)
    # Dos opciones
        # Editar ambos pods y cambiar el tag de la imagen
        kubectl edit po/web1
        kubectl edit po/web2
        # Eliminar ambos pods y usar el yaml corregido
        kubectl delete po web1 web2
        kubectl create -f deberes-1-corregido.yaml
    # Para comprobar que ambos pods están corriendo
    kubectl get po
    # Para comprobar que la web está accesible usamos mapeo de puertos
    kubectl port-forward pod/web1 3000:3000 # Abrimos localhost:3000 en el navegador y podemos acceder a la web
    kubectl port-forward pod/web2 3000:3000 # Abrimos localhost:3000 en el navegador y podemos acceder a la web

# Al cabo de un tiempo los desarrolladores liberan una nueva versión de la web (lemoncodersbc/hello-world-web:v2)
# ¿Puedes desplegarla SIN CAIDA DE SERVICIO?
    # No porque no se uso desde un principio un deployment. Para desplegar un deployment con dos réplicas:
    kubectl create deploy helloworld \
        --image lemoncodersbc/hello-world-web:v1 \
        --port 3000 --replicas 2
    # Y para actualizar a la versión 'v2' hay que editar el deployment
    kubectl edit deploy/helloworld
    # Editando el campo spec.template.spec.containers.image
