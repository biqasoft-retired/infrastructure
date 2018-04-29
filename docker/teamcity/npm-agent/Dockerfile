FROM nbakaev/teamcity-agent-base

# based on https://github.com/JetBrains/teamcity-docker-minimal-agent

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl libxss1 libgconf-2-4 wget \
    && apt-get -y autoclean && apt-get install -y apt-transport-https ca-certificates && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo deb https://apt.dockerproject.org/repo ubuntu-xenial main >> /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-engine bridge-utils && mkdir -p /configs && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -     && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'     && apt-get update  && \
    apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont       --no-install-recommends

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.0.0

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install -g @angular/cli json -unsafe-perm 

# confirm installation
RUN node -v
RUN npm -v

