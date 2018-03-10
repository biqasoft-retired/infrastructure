FROM ubuntu:14.04
MAINTAINER Nikita Bakaev <ya@nbakaev.ru>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y php5-cli php5-common php5-gd php5-fpm php5-cgi php5-fpm php-pear php5-mcrypt \
  	python-setuptools inotify-tools iwatch supervisor python-pip && \
	useradd phpuser -b /home/ -m -U -s /bin/false && \
	mkdir -p -m 755 /home/phpuser/www && \
	mkdir -p -m 754 /home/phpuser/logs && \
	chown -R phpuser: /home/phpuser/www/ && \
	chown -R phpuser: /home/phpuser/logs/ && \
	usermod -a -G phpuser www-data && \
	pip install supervisor-stdout

COPY nginx-deb/nginx_1.9.5-1_amd64.deb nginx.deb
RUN dpkg -i nginx.deb && cp /usr/local/nginx/sbin/nginx /usr/sbin/ && chmod +x /usr/sbin/nginx

RUN mkdir /var/cache/ngx_pagespeed/ && chmod 777 -R /var/cache/ngx_pagespeed/ && \
 	touch /var/log/php5-fpm.log && chmod 777 /var/log/php5-fpm.log && \
	mkdir /usr/local/nginx/logs/ && chmod -R 777 /usr/local/nginx/logs && \
	touch /usr/local/nginx/logs/error.log && chmod 777 /usr/local/nginx/logs/error.log && \
	touch /usr/local/nginx/logs/access.log && chmod 777 /usr/local/nginx/logs/access.log && \
	touch /home/phpuser/logs/error.log && chmod 777 /home/phpuser/logs/error.log && \
	touch /home/phpuser/logs/access.log && chmod 777 /home/phpuser/logs/access.log

COPY nginx-configs /etc/nginx/
COPY nginx-hosts /home/phpuser/www/
COPY www.conf /etc/php5/fpm/pool.d/www.conf

# php-fpm config
RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = 100M/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = 100M/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i -e "s/;catch_workers_output\s*=\s*yes/catch_workers_output = yes/g" /etc/php5/fpm/pool.d/www.conf
RUN find /etc/php5/cli/conf.d/ -name "*.ini" -exec sed -i -re 's/^(\s*)#(.*)/\1;\2/g' {} \;

# Supervisor Config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# This is web server, so
EXPOSE 80
EXPOSE 443

 CMD ["/bin/bash", "start.sh"]
