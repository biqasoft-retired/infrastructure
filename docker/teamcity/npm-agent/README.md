# Build 
`docker build -t nbakaev/teamcity-agent-npm .`

# Run

`docker run -it -d -e SERVER_URL=172.31.22.202:8111 -e AGENT_NAME=npm-public4 --name=npm-public-4 --cap-add=SYS_ADMIN \
-v docker_volumes:/var/lib/docker \
-v /home/teamcity/npm-public-4:/data/teamcity_agent/conf \
-v /home/configs:/configs \
--privileged -e DOCKER_IN_DOCKER=start \
nbakaev/teamcity-agent-npm`