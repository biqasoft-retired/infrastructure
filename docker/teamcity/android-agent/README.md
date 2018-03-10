
`docker run -it -d -e SERVER_URL=192.168.1.140:8111 -e AGENT_NAME=android --name=teamcity-agent-android -v  /home/data/teamcity/agent2:/data/teamcity_agent/conf -v /var/run/docker.sock:/var/run/docker.sock -v /root/.docker/config.json:/root/.docker/config.json biqasoft/teamcity-agent-android`

`docker build -t biqasoft/teamcity-agent-android .`

also, you can read https://about.gitlab.com/2016/11/30/setting-up-gitlab-ci-for-android-projects/

## This image contains
 - `/bin/uber-apk-signer-0.7.0` for sign apk file https://github.com/patrickfav/uber-apk-signer
 - `/bin/ghr` for upload releases to github https://github.com/tcnksm/ghr