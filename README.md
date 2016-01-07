# php相關說明
fpm啟動模式：unix socket
socket path: $HOME/var/php7.socket
error_log: $HOME/var/logs/php7_err.log
php與nginx的配置會放到$HOME/var/conf/下，另外會與示例nginx配置放一份到$HOME/var/conf下

# 初始化腳本
'''
./init_php.sh [your_php_install_prefix] [php_version]
'''

此腳本需要傳入php安裝路徑(即prefix)及版本號(用於區分配置文件)，調用後，會在$HOME/var/conf下按基本環境創建配置文件及php啟動腳本(runphp[version].sh)，開發者只需調用runphp[version].sh來啟動fpm即可，nginx配置文件也在$HOME/var/conf下，將其複製到對應的nginx配置文件目錄，按你的應用實際情況更新一下，php+nginx配置就出來了
