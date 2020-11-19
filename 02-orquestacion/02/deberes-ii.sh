# Escenario 1: La web inaccessible

# En este escenario te propongo que averigües y soluciones un problema de una web desplegada en Kubernetes.
# La web corre en un pod llamado web-1 y hay un servicio creado llamado web-1-svc. Por algún motivo no se puede acceder
# a la web, desde dentro del cluster.
# No está claro si el pod funciona o no, o el servicio está bien configurado.

# NOTA: No es necesario acceder DESDE FUERA del cluster, para verificar accesos usa un pod temporal de busybox
	kubectl run bb --image busybox -it --rm -- /bin/sh

# Para empezar hay que ejecutar el fichero escenario-2-1.yaml

# Tareas:

# 1. Verifica que la web está corriendo
	# Comprobar que el pod está corriendo. Tiene que estar READY 1/1 y STATUS Running
	kubectl get po web-1 # ESTÁ CORRIENDO
# 2. Verifica que puedes acceder al pod de la web directamente. ¿Funciona?
	# Hacer un port forwarding del puerto 3000 del pod a nuestro host
	kubectl port-forward pod/web-1 3000:3000
	# Abrir en el navegador o usar wget
	wget -qO- http://localhost:3000 # SE PUEDE
# 3. Verifica si puedes acceder a la web usando el servicio, desde dentro del cluster. ¿Funciona?
	# Arrancar un pod temporal de busybox
	kubectl run bb --image busybox -it --rm -- /bin/sh
	# Ejecutar en el terminal de busybox
	wget -qO- http://web-1-svc # NO HAY RESPUESTA
	wget -qO- http://web-1-svc:3000 # NO HAY RESPUESTA

# 4. Arregla los errores
	# Primero hay que detectar que ocurre
		# Podemos revisar el YAML del servicio
		kubectl get svc web-1-svc -o yaml
		# O chequear los endpoints que tenemos activos
		kubectl get endpoints
	# Y comprobamos que el problema está en el puerto del pod al que al servicio apunta (80, cuando el pod usa el 3000)
	# Para cambiar el puerto usamos el comando edit de kubectl. Nos abre el editor que indique KUBE_EDITOR
	kubectl edit svc/web-1-svc
	# En este caso hay que cambiar spec.ports.targetPort del 80 al 3000
	# Arrancamos de nuevo busybox y probamos
	wget -qO- http://web-1-svc # AHORA SI HAY RESPUESTA