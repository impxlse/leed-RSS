#!/bin/bash

apachectl start
# Exécuter la commande curl
curl -SL http://127.0.0.1/install.php -X POST \
     --data-urlencode "mysqlHost=${MYSQL_HOST}" \
     --data-urlencode "mysqlLogin=${MYSQL_USER}" \
     --data-urlencode "mysqlMdp=${MYSQL_PASSWORD}" \
     --data-urlencode "mysqlBase=${MYSQL_DATABASE}" \
     --data-urlencode "login=${LEED_ADMIN_USER}" \
     --data-urlencode "password=${LEED_ADMIN_PASSWORD}" \
     --data-urlencode "root=http://localhost:${PORT_WEB}" \
     --data "install_changeLngLeed=en&mysqlPrefix=leed__&installButton=" > /dev/null
apachectl stop

exec "$@"
