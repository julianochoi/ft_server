# Set container OS to debian buster version
FROM debian:buster

# Install nginx, MariaDB and phpMyAdmin dependencies
RUN apt-get update && \
	apt-get install -y	nginx \
						mariadb-server \
						php-fpm \
						php-gd \
						php-mbstring \
						php-mysql \
						php-zip \
						php-xml && \
	apt-get clean

ARG PMA_DIR=/usr/share/phpmyadmin
ARG PMA_TMP=/usr/share/phpmyadmin/tmp
ARG PMA_FILE=phpMyAdmin-5.1.0-all-languages.tar.gz
ARG PMA_CONF=config.inc.php
ARG PMA_WEB=/var/www/phpmyadmin

#setup phpMyAdmin
COPY ["srcs/phpmyadmin/*","/"]
RUN	mkdir -p $PMA_DIR $PMA_TMP && \
	tar xvf /$PMA_FILE --strip-components=1 -C $PMA_DIR && \
	ln -s $PMA_DIR $PMA_WEB && \
	mv $PMA_CONF $PMA_DIR && \
	rm $PMA_FILE

#setup MariaDB
COPY ["srcs/mariadb/db_setup.sh", "/"]

#setup WordPress
COPY ["srcs/wordpress", "/var/www"]

#setup ssl certificates on nginx
COPY ["srcs/ssl/cert.crt", "/etc/ssl/certs/"]
COPY ["srcs/ssl/cert.key", "/etc/ssl/private/"]

EXPOSE 80/tcp 443/tcp

ARG NGX_SRC=srcs/nginx
ARG NGX_DIR=/etc/nginx
ARG NGX_DIR_SA=$NGX_DIR/sites-available
ARG NGX_DIR_SE=$NGX_DIR/sites-enabled

#Clean up default nginx sites
RUN rm -rf /var/www/html && \
	rm -rf $NGX_DIR_SA/default && \
	rm -rf $NGX_DIR_SE/default

ENV AUTOINDEX=on

#Nginx configuration
COPY ["$NGX_SRC/frontpage.html","/var/www/"]
COPY ["$NGX_SRC/ft_server", "$NGX_SRC/autoindex.sh", "$NGX_DIR_SA/"]
RUN ln -s $NGX_DIR_SA/ft_server $NGX_DIR_SE

ENTRYPOINT	service nginx start && \
			service mysql start && \
			service php7.3-fpm start && \
			bash db_setup.sh && \
			bash etc/nginx/sites-available/autoindex.sh && \
			tail -f /dev/null
