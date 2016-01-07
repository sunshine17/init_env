#!/bin/sh

X_PREFIX=$HOME/var
CONF_DIR=$X_PREFIX/conf

pid_file="$X_PREFIX/fpm{x_ver}.pid"

[ -f $pid_file ] && kill `cat $pid_file`

{x_php_prefix}/sbin/php-fpm -c $CONF_DIR/php{x_ver}.ini -y $CONF_DIR/php{x_ver}-fpm.conf 
