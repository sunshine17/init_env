#!/bin/sh

help(){
    cat <<HELP
init_php.sh -- initialize php env conf

USAGE: init_php.sh [PHP_PREFIX] [PHP_VERSION]
EXAMPLE: init_php.sh /usr/local/php7 7

HELP
    exit 0
}

[ $# -lt 2 ] && help

R_PHP_PREFIX=$1
R_X_VER=$2

SRPT_DIR=$(cd "$(dirname "$0")"; pwd)

X_PREFIX=$HOME/var
CONF_DIR=$X_PREFIX/conf

mkdir -p $X_PREFIX/tmp $X_PREFIX/upload_tmp $X_PREFIX/logs $CONF_DIR

X_USR=`whoami`
S_USR="{x_usr}"

S_PREFIX="{x_prefix}"
S_EXT_DIR="{x_ext_dir}"
S_PHP_VER="{x_ver}"

R_EXT_DIR="$R_PHP_PREFIX/lib/php/extensions/"`ls $R_PHP_PREFIX/lib/php/extensions`

SED_CMD="s+$S_USR+$X_USR+g; s+$S_PREFIX+$R_PHP_PREFIX+g; s+$S_EXT_DIR+$R_EXT_DIR+g;  s+$S_PHP_VER+$R_X_VER+g;"

sed "$SED_CMD" $SRPT_DIR/conf/php-fpm.conf  > $CONF_DIR/php$R_X_VER-fpm.conf
sed "$SED_CMD" $SRPT_DIR/conf/php.ini     > $CONF_DIR/php$R_X_VER.ini

sed "s/$S_USR/$X_USR/" $SRPT_DIR/conf/nginx_vhost_x.conf > $CONF_DIR/nginx_vhost_x.conf 

echo "
=== SUCCESS! ===
Please move nginx conf to the right place and modify it according to your needs: 
Example: 

mv $CONF_DIR/nginx_vhost_x.conf /usr/local/nginx/conf/vhost/you_domain.conf

"



