
`docker run -it -d -e SERVER_URL=192.168.1.140:8111 -e AGENT_NAME=teamcity-agent-angular4 --name=teamcity-agent-angular4 -v  /home/data/teamcity/agent-angular4:/data/teamcity_agent/conf -v /var/run/docker.sock:/var/run/docker.sock biqasoft/teamcity-agent-angular4`

`docker build -t biqasoft/teamcity-agent-angular4 .`

## This image contains
 - `/bin/uber-apk-signer-0.7.0` for sign apk file https://github.com/patrickfav/uber-apk-signer
 - `/bin/ghr` for upload releases to github https://github.com/tcnksm/ghr