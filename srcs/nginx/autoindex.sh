#!/bin/bash

if [ -z "$AUTOINDEX" ]
then
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/ft_server
	sed -i 's/frontpage.html/index.html/' /etc/nginx/sites-available/ft_server
	service nginx restart
	echo "Autoindex is activated by default"
elif [ "$AUTOINDEX" = "on" ]
then
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/ft_server
	sed -i 's/frontpage.html/index.html/' /etc/nginx/sites-available/ft_server
	service nginx restart
	echo "Autoindex is on"
elif [ "$AUTOINDEX"	= "off" ]
then
	sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/ft_server
	sed -i 's/index.html/frontpage.html/' /etc/nginx/sites-available/ft_server
	service nginx restart
	echo "Autoindex is off"
else
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/ft_server
	sed -i 's/frontpage.html/index.html/' /etc/nginx/sites-available/ft_server
	service nginx restart
	echo "Autoindex is activated by default"
fi
