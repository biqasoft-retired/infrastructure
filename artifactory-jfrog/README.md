## Atifactory
Is alternative to `http://www.sonatype.org/nexus/`

[more docs](https://github.com/NBakaev/awesome/blob/master/docs/infrastructure.md#artifactory)

docker run -d --name artifactory -p 8081:8081 -v /home/artifactory/data:/var/opt/jfrog/artifactory/data -v /home/artifactory/logs:/var/opt/jfrog/artifactory/logs -v /home/artifactory/backup:/var/opt/jfrog/artifactory/backup jfrog-docker-reg2.bintray.io/jfrog/artifactory-oss:4.4.3

For Artifactory Pro
docker pull jfrog-docker-registry.bintray.io/jfrog/artifactory-pro:<version>
 
For Artifactory OSS
docker pull jfrog-docker-registry.bintray.io/jfrog/artifactory-oss:<version>
 
For Artifactory Pro Registry
docker pull jfrog-docker-registry.bintray.io/jfrog/artifactory-registry:<version>