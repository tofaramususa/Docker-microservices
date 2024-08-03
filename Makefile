NAME = Inception

all: start

# need explaination for difference between start and build below and the use of --env-file
# what is the difference between up and build in docker
start:
	@echo "\033[33mLaunching configuration $(NAME)...\033[0m"
	@bash srcs/requirements/wordpress/tools/make_dir.sh 
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env up -d 

build:
	@echo "\033[33mBuilding configuration $(NAME)...\033[0m"
	@bash srcs/requirements/wordpress/tools/make_dir.sh 
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env up -d --build

up:
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env up -d

down:
	@echo "\033[33mStopping configuration $(NAME)...\033[0m"
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env down

re: down build

clean:
	@echo "\033[33mCleaning configuration $(NAME)...\033[0m"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@echo "\033[33mTotal clean of all Docker configurations\033[0m"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY = start all build down re clean fclean