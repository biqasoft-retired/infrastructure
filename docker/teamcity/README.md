# biqasoft/teamcity server notes

## Run [teamcity server](https://hub.docker.com/r/jetbrains/teamcity-server/)

`docker run -it --name teamcity-server-instance -v /home/data/teamcity/datadir:/data/teamcity_server/datadir -v /home/data/teamcity/logs:/opt/teamcity/logs -p 8111:8111 jetbrains/teamcity-server`

### run database
`docker run --name postgres -e POSTGRES_PASSWORD=insert_passoed_here -p 5432:5432 -d postgres`

## On host with Teamcity server

### create credentials for docker registry /root/.docker/config.json
`docker login -u docker_username -p docker_pasword docker_registry_or_empty_if_hub`

### make host docker socket and credentials available in container; do not using docker-in-docker; NOTE: this is not secured, if executed code is untrusted; e.g do not use to every test behind unknown user pull request
`docker run -v /var/run/docker.sock:/var/run/docker.sock -v /root/.docker/config.json:/root/.docker/config.json`
