# Exercise 2

1. Para lanzar la app con Docker Compose es necesario definir el archivo [docker-compose.yml](./docker-compose.yml)
2. Arrancar el entorno
```bash
docker-compose up -d
```
3. Parar el entorno
```bash
docker-compose stop
```
4. Eliminar el entorno
```bash
docker-compose down -v
```
5. Otros comandos interesantes
```bash
docker-compose restart # Reinicia el entorno
docker-compose rm # Elimina sólo los contenedores
docker-compose rm -v # Elimina contenedores y sus volúmenes asociados
docker-compose down # Elimina contenedores (estén parados o no) y redes
```