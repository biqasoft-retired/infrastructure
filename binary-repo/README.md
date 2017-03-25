# Binary repo

## Docker registry

```bash
docker run -d -p 5000:5000 -p 2375:2375 --restart=always --name registry -v /home/docker/registry:/var/lib/registry -v /home/docker/registry-cert/cert:/certs -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/device.crt -e REGISTRY_HTTP_TLS_KEY=/certs/device.key registry:2 
```

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