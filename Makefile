all:
	docker-compose  -f srcs/docker-compose.yml up 


Stop_containers:
	docker stop $(docker ps -pq)

Remove_containers: Stop_containers
	docker rm $(docker ps -pq)

Remove_images:
	docker rmi -f $(docker images -qa)

# Remove_volumes:
# 	docker volume rm $(docker volume ls -q)

Remove_networks:
	docker network rm $(docker network ls -q)

fclean:
	docker system prune --all --volumes

stop:
	docker-compose -f srcs/docker-compose.yml down
