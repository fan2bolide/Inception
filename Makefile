DB_VOLUME=~/data/mariadb
WP_VOLUME=~/data/wordpress

all: $(DB_VOLUME) $(WP_VOLUME) secrets
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up

secrets:
	mkdir -p $@
	openssl req -x509 -newkey rsa:4096 -keyout secrets/key.pem -out secrets/cert.pem -sha256 -days 3650 -nodes -subj "/CN=bajeanno.42.fr"

$(DB_VOLUME):
	mkdir -p $(DB_VOLUME)

$(WP_VOLUME):
	mkdir -p $(WP_VOLUME)
