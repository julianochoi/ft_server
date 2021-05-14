#!/bin/bash
mysql -e "UPDATE mysql.user SET Password=PASSWORD('password') WHERE User='root';"
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND HOST NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -e "GRANT ALL ON *.* TO 'choi'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;"
mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "GRANT ALL ON wordpress.* TO 'choi'@'localhost' IDENTIFIED BY 'password';"
mysql -e "SOURCE /usr/share/phpmyadmin/sql/create_tables.sql"
mysql -e "FLUSH PRIVILEGES;"
