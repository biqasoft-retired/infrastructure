FROM java:8
VOLUME /tmp
ADD com.biqasoft.jar app.jar

# https://rpm.newrelic.com
# newrelic application monitoring
ADD newrelic.jar newrelic.jar
ADD newrelic.yml newrelic.yml

EXPOSE 8080

# add created date to jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-Duser.timezone=UTC", "-jar", "-javaagent:/newrelic.jar", "/app.jar", "--spring.profiles.active=production"]
