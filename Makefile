all:start

start:
	mkdir -p /home/$$USER/data/mariadb
	mkdir -p /home/$$USER/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f ./srcs/docker-compose.yml down

debug:
	mkdir -p /home/$$USER/data/mariadb
	mkdir -p /home/$$USER/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml --verbose up --build -d	

clean:
	@-docker-compose -f ./srcs/docker-compose.yml down
	@-docker stop `docker ps -qa`
	@-docker rm `docker ps -qa`
	@-docker rmi -f `docker images -qa`
	@-docker volume rm `docker volume ls -q`
	@-docker network rm `docker network ls -q`
	@-sudo rm -rf /home/$$USER/data/mariadb
	@-sudo rm -rf /home/$$USER/data/wordpress
	@-sudo docker system prune -f -a

re:
	stop
	start

list_volumes:
	docker volume ls 


.PHONY = start all clean debug list_volumes stop 
