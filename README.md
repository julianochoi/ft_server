<h1 align="center">
	ft_server
</h1>

This is a project developed for the 42SP curriculum.

### About
  This project is about setting up services using a Docker container.<br>
  We set up a web server(NginX), a database(MariaDB) and an administration tool(phpMyAdmin).
  
---

### Installation

First, clone the repository:
> `git clone https://github.com/julianochoi/ft_server`

Then, build the docker image:
> `docker build -t ft_server .`

### Usage
> `docker run --name ft_server -d -e AUTOINDEX=on -p 80:80/tcp -p 443:443/tcp ft_server:latest`

On your browser, connect to https://localhost or https://127.0.0.1

### Disclaimer
As this was a school project, it is not intended to be used in production. There are numerous security flaws in the setup.
