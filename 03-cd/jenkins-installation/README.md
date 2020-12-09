# How to install Jenkins

1. Create this [Dockerfile](./Dockerfile)
2. Build the image
```bash
docker build -t lemoncode/jenkins .
```
3. Create bash script [start_jenkins.sh](./start_jenkins.sh)
4. Grant execution permission to [start_jenkins.sh](./start_jenkins.sh)
```bash
chmod +x start_jenkins.sh
```

5. Execute script [start_jenkins.sh](./start_jenkins.sh)
```bash
# image, network_name, vol_certs, vol_data
./start_jenkins.sh lemoncode/jenkins jenkins jenkins-docker-certs jenkins-data
```

6. Get Jenkins key with docker logs
```bash
docker logs jenkins-blueocean
```

7. Wizard installation starts. Key will be required (Choose 'Install suggested plugins')
8. Create First Admin User
9. Restart Jenkins if necessary (F5)