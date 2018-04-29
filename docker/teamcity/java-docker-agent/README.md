teamcity agent with docker cli(without dockerrunc etc; not for docker-in-docker;) 

`docker build -t biqasoft/java-docker-agent .`

`docker run -it -d -e SERVER_URL=192.168.1.140:8111 --name=teamcity-agent1 -v  /home/data/teamcity/agent1:/data/teamcity_agent/conf -v /var/run/docker.sock:/var/run/docker.sock -v /root/.docker/config.json:/root/.docker/config.json biqasoft/java-docker-agent`

TODO: use https://help.github.com/articles/github-s-ssh-key-fingerprints/ instead af allow all keys