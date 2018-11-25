#!/bin/bash

# This script create deb package of nginx.

# Build ngx_pagespeed From Source
# https://developers.google.com/speed/pagespeed/module/build_ngx_pagespeed_from_source
#
# JavaScript и Nginx = nginScript, а HTTP2 в придачу
# http://habrahabr.ru/post/267955/

# Before building you should have installed following
# sudo apt install build-essential zlib1g-dev libpcre3 libpcre3-dev unzip libssl-dev checkinstall libuuid

# file /_username_/nginx-1.10.0/nginx_1.10.0-1_amd64.deb will be created

# BASE_DIR="`pwd`"

# fail execution on error
set -e

cd

########
NPS_VERSION=1.13.35.2-stable
# check http://nginx.org/en/download.html for the latest version
NGINX_VERSION=1.14.1
########

wget -N https://github.com/pagespeed/ngx_pagespeed/archive/v${NPS_VERSION}.zip
unzip -o v${NPS_VERSION}.zip

nps_dir=incubator-pagespeed-ngx-${NPS_VERSION}
cd "$nps_dir"

NPS_RELEASE_NUMBER=${NPS_VERSION/-beta/}
NPS_RELEASE_NUMBER=${NPS_VERSION/-stable/}

psol_url=https://dl.google.com/dl/page-speed/psol/${NPS_RELEASE_NUMBER}-x64.tar.gz
wget ${psol_url}
tar -xzvf ${NPS_RELEASE_NUMBER}-x64.tar.gz

cd

wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar -xvzf nginx-${NGINX_VERSION}.tar.gz --overwrite
cd nginx-${NGINX_VERSION}/
./configure \
--add-module=$HOME/$nps_dir \
--with-http_v2_module \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_gzip_static_module \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock
make

# create .deb file without local installation
checkinstall --install=no
