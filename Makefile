all:start

start:
	mkdir -p /home/$$USER/data/mariadb-vol
	mkdir -p /home/$$USER/data/wordpress-vol
	docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f ./srcs/docker-compose.yml down

debug:
	mkdir -p /home/$$USER/data/mariadb-vol
	mkdir -p /home/$$USER/data/wordpress-vol
	docker-compose -f ./srcs/docker-compose.yml --verbose up --build -d	

# clean:
# 	@-docker-compose -f ./srcs/docker-compose.yml down
# 	@-docker stop `docker ps -qa`
# 	@-docker rm `docker ps -qa`
# 	@-docker rmi -f `docker images -qa`
# 	@-docker volume rm `docker volume ls -q`
# 	@-docker network rm `docker network ls -q`
# 	@-sudo rm -rf /home/$$USER/data/mariadb-vol
# 	@-sudo rm -rf /home/$$USER/data/wordpress-vol
# 	@-sudo docker system prune -f -a

fclean:
	@-printf "Total clean of all configurations docker\n"
	@-docker-compose -f ./srcs/docker-compose.yml down
	@-docker stop `docker ps -qa`
	@-docker system prune --all --force --volumes
	@-docker network prune --force
	@-docker volume prune --force
	@-sudo rm -rf ~/data/wordpress/*
	@-sudo rm -rf ~/data/mariadb/*

re: stop start

list_volumes:
	docker volume ls 


.PHONY = start all clean debug list_volumes stop fclean
