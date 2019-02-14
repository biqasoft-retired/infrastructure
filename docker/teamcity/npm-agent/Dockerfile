FROM docker-local.artifactory.corp.nbakaev.com/teamcity-agent-base

# based on https://github.com/JetBrains/teamcity-docker-minimal-agent

RUN mkdir ~/.gnupg
RUN echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl libxss1 libgconf-2-4 wget gnupg-agent software-properties-common\
    && apt-get -y autoclean && apt-get install -y apt-transport-https ca-certificates && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io && mkdir -p /configs && \
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

RUN echo '{"storage-driver": "vfs"}' > /etc/docker/daemon.json

