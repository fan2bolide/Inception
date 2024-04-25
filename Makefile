DB_VOLUME=~/data/mariadb
WP_VOLUME=~/data/wordpress


all: $(DB_VOLUME) $(WP_VOLUME)
	docker compose -f requirements/src/docker-compose.yml build
	docker compose -f requirements/src/docker-compose.yml up

$(DB_VOLUME):
	mkdir -p $(DB_VOLUME)

$(WP_VOLUME):
	mkdir -p $(WP_VOLUME)
