all:
	docker-compose  -f srcs/docker-compose.yml up

fclean:
	docker system prune --all --volumes


