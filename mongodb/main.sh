#!/bin/bash

build (){
	docker build --tag=biqasoft/mongodb .
}

push (){
	docker tag biqasoft/mongodb
	docker push biqasoft/mongodb
}

run (){
	docker run -d -v /home/mongodb/data:/data/db -P -e "SERVICE_TAGS=master" biqasoft/mongodb
}

# execute function from comand line such as `./main.js build`
$@
