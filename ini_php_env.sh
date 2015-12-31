#!/bin/sh
# PHP_PREFIX
# S_PREFIX="{x_prefix}"

X_USR=`whoami`
SRPT_DIR=$(cd "$(dirname "$0")"; pwd)

X_PREFIX=$HOME/var
CONF_DIR=$X_PREFIX/conf

mkdir -p $X_PREFIX/tmp $X_PREFIX/upload_tmp $X_PREFIX/logs $CONF_DIR

SEARCH="{x_usr}"
sed s/$SEARCH/$X_USR/ $SRPT_DIR/conf/php-fpm.conf > $CONF_DIR/php-fpm.conf
sed s/$SEARCH/$X_USR/ $SRPT_DIR/conf/php.ini > $CONF_DIR/php.ini
sed s/$SEARCH/$X_USR/ $SRPT_DIR/conf/nginx_vhost_x.conf > $CONF_DIR/nginx_vhost_x.conf 

echo "
=== SUCCESS! ===
Please move nginx conf to the right place and modify it according to your needs: 
Example: 

mv $CONF_DIR/nginx_vhost_x.conf /usr/local/nginx/conf/vhost/you_domain.conf

"



