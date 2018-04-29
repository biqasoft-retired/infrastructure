#!/bin/bash

# start all the services
supervisord -c /etc/supervisor/conf.d/supervisord.conf
