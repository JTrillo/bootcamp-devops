Para ejecutar el fichero [BasicDocker](./BasicDocker.groovy):
```bash
# La opción -a es para volcar las variables del sistema
docker run --rm -v "$PWD":/home/groovy/scripts \
-w /home/groovy/scripts groovy:latest groovy BasicDocker.groovy -a
```
El resto de ejemplos no necesitan argumentos:
```bash
# sustituir scriptN por script1, script2 o script3
docker run --rm -v "$PWD":/home/groovy/scripts \
-w /home/groovy/scripts groovy:latest groovy scriptN.groovy
```