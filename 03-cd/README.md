##### Other Jenkins exercises are [here](https://github.com/JTrillo/jenkins-sessions)
##### Jenkins libraries are [here](https://github.com/JTrillo/jenkins-library-sessions)

To validate our Jenkinsfile's it is possible to make a request to resource **pipeline-model-converter/validate** of Jenkins server
```bash
curl --user user:password -X POST -F "jenkinsfile=<./Jenkinsfile" \
http://localhost:8080/pipeline-model-converter/validate
```