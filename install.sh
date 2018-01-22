#!/bin/sh
chmod 777 -R ${WORK_DIR}
mkdir -p ${WORK_DIR}data/mysql

/usr/bin/mysql_install_db  --user=mysql

/usr/bin/mysqld_safe &

apk add mysql-client
#不能删除mysql-client
/usr/bin/mysqladmin -u root password 'root1234'

/usr/bin/mysql -uroot -proot1234 < ${WORK_DIR}init.sql

ps -ef | grep mysqld_safe | grep -v grep  |awk '{print $1}' | xargs kill -9
ps -ef | grep mysqld | grep -v grep  |awk '{print $1}' | xargs kill -9


rm -rf /var/cache/apk/*