# Project Inception

## Overview

This project is a containerized web application stack consisting of WordPress, MariaDB, and Nginx. It leverages Docker to create a reproducible and scalable environment for deploying a WordPress site with a MariaDB database and Nginx web server.

## Concepts

### Containerization with Docker

The project uses Docker to create isolated environments for each component of the stack. This ensures that each service has its dependencies met without conflicting with others.

### WordPress Configuration

The WordPress service is built on an Alpine Linux base image, chosen for its small footprint and security features. The [`Dockerfile`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/wordpress/Dockerfile) installs PHP and its extensions required by WordPress, and configures PHP-FPM to listen on a TCP port instead of a Unix socket for better compatibility with container networking.

### MariaDB Setup

MariaDB is set up with a custom [`config.sh`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/mariadb/conf/config.sh) script that initializes the database directory and creates a new database with user privileges as defined in the [`init_db.sql`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/mariadb/conf/init_db.sql) script.

### Nginx as a Web Server

Nginx is configured to serve the WordPress site over HTTPS using a self-signed SSL certificate generated in the [`Dockerfile`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/nginx/Dockerfile). The configuration file for Nginx is placed in the appropriate directory to be included when the Nginx service starts.

### Initialization and Configuration Scripts

Scripts such as [`wp-init.sh`](//local/Users/tofaramususa/Desktop/docker-file:srcs/requirements/wordpress/conf/wp-init.sh) are used to automate the installation and initial configuration of WordPress after the container starts. This includes setting up the WordPress admin user and installing necessary plugins.

## Details

- **Base Images**: Alpine Linux for WordPress, Debian for Nginx.
- **Services**: WordPress, MariaDB, Nginx.
- **Configuration**: PHP-FPM, MariaDB initialization, Nginx SSL.
- **Automation**: WordPress core download and configuration, MariaDB user and database setup.
- **Security**: Use of self-signed SSL certificates for HTTPS.

## Usage

To use this project, you will need Docker installed on your system. Once Docker is set up, you can build and run the containers using the provided Dockerfiles and configuration scripts.
