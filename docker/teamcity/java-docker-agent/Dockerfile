FROM biqasoft/teamcity-agent-base

# install docker cli
ENV DOCKER_VERSION=17.03.0-ce
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz && \ 
	tar zxvf docker-${DOCKER_VERSION}.tgz docker/docker && rm docker-${DOCKER_VERSION}.tgz && mv docker/docker /bin