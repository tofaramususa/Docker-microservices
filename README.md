# Project Inception

## Overview

This project is a containerized web application stack that includes WordPress, MariaDB, and Nginx. It utilizes Docker to provide a consistent, scalable environment for deploying a WordPress site with a MariaDB database backend and an Nginx web server.

## Technology Stack

- **Docker**: Used for containerization of services.
- **WordPress**: The content management system running on PHP and Alpine Linux.
- **MariaDB**: The database system used for storing WordPress data.
- **Nginx**: The web server that serves the WordPress site and handles HTTPS connections.
- **Alpine Linux**: A lightweight Linux distribution used for the WordPress container.
- **Debian**: The Linux distribution used for the Nginx container.
- **PHP-FPM**: The FastCGI Process Manager for handling PHP processing.
- **SSL**: Secure Sockets Layer, used for encrypting connections to the web server.

## Project Structure and Files

- **WordPress Dockerfile**: [`Dockerfile`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/wordpress/Dockerfile) for setting up the WordPress container.
- **MariaDB Configuration**: Initialization scripts and SQL setup in [`config.sh`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/mariadb/conf/config.sh) and [`init_db.sql`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/mariadb/conf/init_db.sql).
- **Nginx Dockerfile**: [`Dockerfile`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/nginx/Dockerfile) for configuring the Nginx container with SSL.
- **WordPress Initialization Script**: [`wp-init.sh`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/wordpress/conf/wp-init.sh) for automating the WordPress setup.

## Concepts

### Containerization with Docker
Docker provides isolated environments for each service, ensuring dependency management without conflicts.

### WordPress Configuration
WordPress runs on an Alpine Linux base image for efficiency and security, with PHP and its extensions installed and configured.

### MariaDB Setup
MariaDB is initialized with custom scripts to set up the database and user privileges.

### Nginx as a Web Server
Nginx serves the WordPress site using HTTPS with a self-signed SSL certificate and is configured to handle web traffic efficiently.

### Initialization and Configuration Scripts
Scripts are used to automate the setup process of WordPress and MariaDB, streamlining the deployment.

## Usage

To deploy this project, Docker must be installed on your system. You can then build and run the containers using the provided Dockerfiles and configuration scripts.

## Security

The project uses self-signed SSL certificates to enable HTTPS, enhancing the security of the web application.
