# GitLab

### Preparing local GitLab
1. Allow insecure registries by creating file **/etc/docker/daemon.json** with this content:
```json
{"insecure-registries" : ["gitlab.local:5001"]}
```
2. Restart Docker service
```bash
docker service restart
```
3. Start the GitLab environment with Docker
Clone Lemoncode's Bootcamp Devops [repository](https://github.com/Lemoncode/bootcamp-devops-lemoncode) and navigate to folder [03-cd/02-gitlab/gitlab/docker](https://github.com/Lemoncode/bootcamp-devops-lemoncode/tree/master/03-cd/02-gitlab/gitlab/docker). Execute command down below:
```bash
user@localhost:~03-cd/02-gitlab/gitlab/docker$ sudo docker-compose up -d
```
4. Edit hosts file
You must include this entry (file /etc/hosts):
```bash
<Local_ip_address> gitlab.local
```

### First time
1. Open your browser and go to [gitlab.local:8888](gitlab.local:8888). The first time you will be asked for a new password. User will be **root**.
2. Now we can create a new user. Click on tool icon (it's admin area) > Users > New user. User email can be fake, since we are going to change user password next.
3. In the admin area, navigate to Settings > CI/CD > Continuous Integration and Deployment. Disable _Default to Auto DevOps pipeline for all projects_. This options creates pipelines automatically, however we want to create our own pipelines in this course.
4. In the admin area, go to Overview > Runners. As we can see, there is no runner yet. In order to register the first one, execute [runner_registry.sh](https://github.com/Lemoncode/bootcamp-devops-lemoncode/tree/master/03-cd/02-gitlab/gitlab/docker/runner_registry.sh) `sudo bash runner_registry.sh`. It will take some time.
5. When it has finished, sign out and sign in with new user's credentials. Now, a new password will be required for the newly created user. Change it _et voilà!_, you can begin using GitLab.

### SSH Keys
In order to establish a secure connection between your computer and GitLab, it is mandatory to add an SSH key. It can be done going to User Settings > SSH Keys.
