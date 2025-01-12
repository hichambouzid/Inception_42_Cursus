FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y \
		redis-server


# COPY tools/Config.sh .

EXPOSE 6379


CMD ["redis-server", "--protected-mode", "no"]
