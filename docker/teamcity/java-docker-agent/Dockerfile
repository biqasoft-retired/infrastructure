FROM biqasoft/teamcity-agent-base

# install docker cli
ENV DOCKER_VERSION=17.03.0-ce

# add ssh fingerprint for github push
ADD config /root/.ssh/config

# add maven config
ADD settings.xml /opt/buildagent/tools/maven3_3/conf/settings.xml

RUN wget https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz && \ 
	tar zxvf docker-${DOCKER_VERSION}.tgz docker/docker && rm docker-${DOCKER_VERSION}.tgz && mv docker/docker /bin