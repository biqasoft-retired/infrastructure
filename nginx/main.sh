#!/bin/bash

build (){
	docker build --tag=biqasoft/nginx-cloud-frontend .
}

push (){
	docker tag -f biqasoft/nginx-cloud-frontend
	docker push biqasoft/nginx-cloud-frontend
}

run (){
	docker run -P -d biqasoft/nginx-cloud-frontend
}

# execute function from comand line such as `./main.js build`
$@
