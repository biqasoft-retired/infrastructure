## This is mongodb database which generate sites to use.
It used tocker and `Dockerfile` have the following commands	

 * `docker build --tag=biqasoft/mongodb .` To build image
 * `docker push biqasoft/mongodb` and send to private repo
 * `docker run -d -v /home/mongodb/data:/data/db -P -e "SERVICE_TAGS=master" biqasoft/mongodb` and run