# base biqasoft/teamcity-agent-base
 
1)  download from Teamcity server buildAgent.zip; then run
```
mkdir dist
unzip buildAgent.zip -d dist/buildagent
mv dist/buildagent/conf dist/buildagent/conf_dist
``` 

2) `docker build -t biqasoft/teamcity-agent-base .`

[based on officeal jetbrains docker buidl agent](https://hub.docker.com/r/jetbrains/teamcity-minimal-agent/)