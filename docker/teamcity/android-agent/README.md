
`docker run -it -d -e SERVER_URL=192.168.1.140:8111 -e AGENT_NAME=android --name=teamcity-agent-android -v  /home/data/teamcity/agent2:/data/teamcity_agent/conf -v /var/run/docker.sock:/var/run/docker.sock -v /root/.docker/config.json:/root/.docker/config.json biqasoft/teamcity-agent-android`

`docker build -t biqasoft/teamcity-agent-android .`