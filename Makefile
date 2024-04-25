DB_VOLUME=~/inception_volumes/mariadb
WP_VOLUME=~/inception_volumes/wordpress


all: $(DB_VOLUME) $(WP_VOLUME)
	docker compose -f requirements/docker-compose.yml build
	docker compose -f requirements/docker-compose.yml up

$(DB_VOLUME):
	mkdir -p $(DB_VOLUME)

$(WP_VOLUME):
	mkdir -p $(WP_VOLUME)
