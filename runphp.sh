#!/bin/sh
X_PREFIX=$HOME/var
CONF_DIR=$X_PREFIX/conf

pid_file="$X_PREFIX/php-fpm.pid"
[ -f $pid_file ] && kill `cat $pid_file`
php-fpm -c $CONF_DIR -y $CONF_DIR/php-fpm.conf 
