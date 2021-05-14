#!/bin/bash
docker build -t ft_server .
docker run --name ft_server -d -e AUTOINDEX=on -p 80:80/tcp -p 443:443/tcp ft_server:latest