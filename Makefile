NAME = Inception

all: start


# need explaination for difference between start and build below and the use of --env-file
# what is the difference between up and build in docker
up:
	@bash srcs/requirements/wordpress/tools/make_dir.sh 
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env up -d --build

start:
	@echo "\033[33mLaunching configuration $(NAME)...\033[0m"
	@bash srcs/requirements/wordpress/tools/make_dir.sh 
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env up -d 


down:
	@echo "\033[33mStopping configuration $(NAME)...\033[0m"
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env down

re: down up

clean:
	@echo "\033[33mCleaning configuration $(NAME)...\033[0m"
	@docker system prune -a
	@sudo rm -rf /home/tmususa/data/wordpress/*
	@sudo rm -rf /home/tmususa/data/mariadb/*

fclean: down
	@echo "\033[33mTotal clean of all Docker configurations\033[0m"
	@yes | docker system prune --all
	@docker volume rm $$(docker volume ls)
# @rm -rf /home/tmususa/Desktop/inception/srcs/wordpress_vol /home/tmususa/Desktop/inception/srcs/mariadb_vol
# @docker stop $$(docker ps -qa)
# @docker system prune --all --force --volumes
# @docker network prune --force
# @docker volume prune --force
# @sudo rm -rf /home/tmususa/data/wordpress/*
# @sudo rm -rf /home/tmususa/data/mariadb/*

.PHONY = start all build down re clean fclean