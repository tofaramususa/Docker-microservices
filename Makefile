NAME = Inception

all: up

up:
	@echo "\033[33mLaunching configuration $(NAME)...\033[0m"
	@bash srcs/requirements/wordpress/tools/init_dir.sh 
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@echo "\033[33mStopping configuration $(NAME)...\033[0m"
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env down

re: down up

clean: down
	@echo "\033[33mCleaning configuration $(NAME)...\033[0m"
	@yes | docker system prune --all

fclean: down
	@echo "\033[33mTotal clean of all Docker configurations\033[0m"
	@yes | docker system prune --all
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf /home/tmususa/data/wordpress_vol/*
	@sudo rm -rf /home/tmususa/data/mariadb_vol/*

rebuild: fclean up

.PHONY = start all build down re clean fclean

