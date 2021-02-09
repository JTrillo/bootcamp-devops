# GitLab Exercises

### Spring application CI/CD
1. Create a new GitLab project and upload this [code](https://github.com/Lemoncode/bootcamp-devops-lemoncode/tree/master/03-cd/02-gitlab/springapp)

2. Create the required pipeline (file .gitlab-ci.yml);
```yml
stages:
    - maven:build
    - maven:test
    - docker:build
    - deploy

maven:build:
    stage: maven:build
    script:
        - mvn clean package
    image: maven:3.6.3-openjdk-8
    artifacts:
        when: on_success
        paths:
            - "target/*.jar"
maven:test:
    stage: maven:test
    script:
        - mvn verify
    image: maven:3.6.3-openjdk-8

docker:build:
    stage: docker:build
    before_script:
        - docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY/$CI_PROJECT_PATH
    script:
        - docker build -t $CI_REGISTRY/$CI_PROJECT_PATH/springapp:$CI_COMMIT_SHA .
        - docker push $CI_REGISTRY/$CI_PROJECT_PATH/springapp:$CI_COMMIT_SHA

deploy:
    stage: deploy
    before_script:
        - docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY/$CI_PROJECT_PATH
    script:
        - if [[ $(docker ps -a --filter "name=springapp" --format '{{.Names}}') == "springapp" ]]; then  docker container rm -f springapp; else echo "No existe";  fi
        - docker run --name springapp -d -p 8080:8080 $CI_REGISTRY/$CI_PROJECT_PATH/springapp:$CI_COMMIT_SHA
```

![](./resources/gitlab_01.png)


3. Check app execution at `http://localhost:8080`

![](./resources/gitlab_02.png)

### Create a new user and verify that it can access project previously created
First of all, log in with root user and create a new user (for example, can be named *test*). Then log in with your user and add new user to the project with different roles.

| Role       | Commit | Exec. pipeline | Push & pull                      | Merge request | Admin. project |
|------------|--------|----------------|----------------------------------|---------------|----------------|
| guest      | No     | No             | Only push if repo is not private | No            | No             |
| reporter   | No     | No             | Only push                        | Yes           | No             |
| developer  | Yes    | Yes            | Yes                              | Yes           | No             |
| maintainer | Yes    | Yes            | Yes                              | Yes           | Yes            |

### Create a new project with a pipeline cloning springapp project
There are two proposed ways to achieve this:

#### CI job permissions model
```yml
stages:
    - clone

clone:springapp:
    image:
        name: alpine/git:latest
        entrypoint: [""]
    stage: clone
    script:
        - git clone http://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.local:8888/bootcamp/springapp.git
```

![](./resources/gitlab_03.png)

#### Deploy keys
1. Create an SSH key pair.
```bash
ssh-keygen -t rsa -b 2048
```
2. Create a new variable (Project settings > CI/CD > Variables). Variable key must be `SSH_PRIVATE_KEY` and value must be the content of the private key created earlier.
3. Create pipeline.
```yml
stages:
    - clone

clone:springapp:
    image:
        name: alpine/git:latest
        entrypoint: [""]
    stage: clone
    before_script:
        - 'command -v ssh-agent >/dev/null || ( apt-get update -y && apt-get install openssh-client -y )'
        - eval $(ssh-agent -s)
        - echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -
        - mkdir -p ~/.ssh
        - chmod 700 ~/.ssh
        - ssh-keyscan gitlab.local >> ~/.ssh/known_hosts
        - chmod 644 ~/.ssh/known_hosts
    script:
        - ssh git@gitlab.local
        - git clone git@gitlab.local:bootcamp/springapp.git
```
4. Create deploy key in project **springapp**.
5. Execute pipeline.

![](./resources/gitlab_04.png)