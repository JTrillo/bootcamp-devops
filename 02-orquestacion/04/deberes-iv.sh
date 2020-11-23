# Deberes Parte 4

# Usando la imagen lemoncodersbc/showinfo:v1 haz lo siguiente:
#
# 1. Crea un deployment con 1 pod que use esa imagen
    kubectl create deploy deberes4-deploy --image lemoncodersbc/showinfo:v1
# 2. Crea un ConfigMap que tenga una clave llamada FOO con el valor "FooData"
    kubectl create cm deberes4-cm --from-literal FOO=FooData
# 3. Crea un Secreto generic que tenga una clave llamada BAR_SECRET con el valor "SuperSecretData"
    kubectl create secret generic deberes4-secret --from-literal BAR_SECRET=SuperSecretData
# 4. Configura el deployment para que el pod use:
#     4.1 Una variable de entorno llamada FOO_VAR con el valor de la clave FOO del ConfigMap
#     4.2 Una variable de entorno llamada BAR_SECRET con el valor de la misma clave del secreto
        kubectl edit deploy/deberes4-deploy
        # Tocar en spec.template.spec.containers. Añadir el campo 'envFrom' con este contenido:
        # envFrom:
        # - configMapRef:
        #     name: deberes4-cm
        # - secretRef:
        #     name: deberes4-secret
#
# 5. Pon en marcha el deploy y verifica que el pod tiene las variables de entorno (a través del endpoint /info del pod. Puedes usar port-forward)
    kubectl port-forward deploy/deberes4-deploy 9000:80
# 6. Modifica el ConfigMap y modifica el valor de la clave FOO paa que sea "NewFooData"
    kubectl edit cm/deberes4-cm
# 7. Qué pasa con el pod?
    # El cambio en el valor de la clave FOO no se ve reflejado
# 8. Escala el deployment a dos réplicas
    kubectl scale deploy/deberes4-deploy --replicas 2
# 9. Cual es la configuración del nuevo pod?
    # La deseada. El primer pod sigue teniendo el valor antiguo de la clave FOO
