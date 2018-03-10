FROM openjdk:8-jdk

RUN apt-get update && apt-get install xmlstarlet -y

VOLUME /data/teamcity_agent/conf
ENV CONFIG_FILE /data/teamcity_agent/conf/buildAgent.properties
LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

RUN mkdir -p /opt/buildagent
COPY run-agent.sh /run-agent.sh
COPY run-services.sh /run-services.sh
COPY dist/buildagent /opt/buildagent

RUN useradd -m buildagent && \
    chmod +x /run-agent.sh /run-services.sh && sync

CMD ["/run-services.sh"]

EXPOSE 9090
