#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

. $HOME/compute/shared_compute.sh
install_ngnix

# Comment the location / {} in /etc/nginx/nginx.conf
sudo sed -i '/location \/ {/,/}/c\
    location / {\
        proxy_http_version 1.1;\
        proxy_pass http://localhost:3000/;\
    }' /etc/nginx/nginx.conf

sudo sed -i '/location \/ {/,/}/c\
    location / {\
        proxy_http_version 1.1;\
        proxy_pass http://localhost:3000/;\
    }' /etc/nginx/conf.d/nginx_tls.conf

# Restart
sudo systemctl restart nginx
