FROM biqasoft/teamcity-agent-base

RUN apt-get update && curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs build-essential && npm install -g @angular/cli && wget https://github.com/tcnksm/ghr/releases/download/v0.5.4/ghr_v0.5.4_linux_amd64.zip && unzip ghr_v0.5.4_linux_amd64.zip && cp ghr /bin && chmod +x /bin/ghr