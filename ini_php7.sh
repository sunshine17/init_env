#!/bin/sh

replace_vars(){
    sed s/$1/$2/ $SRPT_DIR/conf/php7/php-fpm.conf > $CONF_DIR/php$R_X_VER-fpm.conf
    sed s/$1/$2/ $SRPT_DIR/conf/php7/php.ini > $CONF_DIR/php$R_X_VER.ini
#    sed s/$1/$2/ $SRPT_DIR/conf/php7/php-fpm.conf > $CONF_DIR/php-fpm.conf
#    sed s/$1/$2/ $SRPT_DIR/conf/php7/php.ini > $CONF_DIR/php.ini
}

help(){
    cat <<HELP
init_php7.sh -- initialize php7 env conf

USAGE: init_php7.sh [PHP_PREFIX] [PHP_VERSION]
EXAMPLE: init_php7.sh /usr/local/php7 7

HELP
    exit 0
}

[ $# -lt 1 ] && help

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

CONF_FPM="$CONF_DIR/php$R_X_VER-fpm.conf"
CONF_PHP="$CONF_DIR/php$R_X_VER.ini"

sed s/$S_USR/$X_USR/ $SRPT_DIR/conf/php7/php-fpm.conf | sed s/$S_PREFIX/$R_PHP_PREFIX/ | sed s/$S_EXT_DIR/$R_EXT_DIR/ | sed s/$S_PHP_VER/$R_X_VER/  |  > $CONF_FPM

# ==== back
#sed s/$S_USR/$X_USR/            $SRPT_DIR/conf/php7/php-fpm.conf > $CONF_FPM
#sed s/$S_PREFIX/$R_PHP_PREFIX/  $CONF_FPM > $CONF_FPM
#sed s/$S_EXT_DIR/$R_EXT_DIR/    $CONF_FPM > $CONF_FPM
#sed s/$S_PHP_VER/$R_X_VER/      $CONF_FPM > $CONF_FPM

#sed s/$S_USR/$X_USR/            $SRPT_DIR/conf/php7/php.ini     > $CONF_PHP
#sed s/$S_PREFIX/$R_PHP_PREFIX/  $CONF_PHP       > $CONF_PHP
#sed s/$S_EXT_DIR/$R_EXT_DIR/    $CONF_PHP       > $CONF_PHP
#sed s/$S_PHP_VER/$R_X_VER/      $CONF_PHP       > $CONF_PHP

#replace_vars $SEARCH $X_USR

#sed s/$SEARCH/$X_USR/ $SRPT_DIR/conf/nginx_vhost_x.conf > $CONF_DIR/nginx_vhost_x.conf 

echo "
=== SUCCESS! ===
Please move nginx conf to the right place and modify it according to your needs: 
Example: 

mv $CONF_DIR/nginx_vhost_x.conf /usr/local/nginx/conf/vhost/you_domain.conf

"



