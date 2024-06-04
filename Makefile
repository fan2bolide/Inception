DB_VOLUME=$(HOME)/data/mariadb/
WP_VOLUME=$(HOME)/data/wordpress/

.PHONY: all
all: secrets
	$(MAKE) create_volumes
	docker compose -v -f srcs/docker-compose.yml up --build

.PHONY: re
re:
	$(MAKE) clean_volumes
	$(MAKE) all

.PHONY: reup
reup: down
	$(MAKE) all

.PHONY: down
down:
	docker compose -f srcs/docker-compose.yml down --timeout 1

.PHONY: clean_volumes
clean_volumes:
	docker compose -f srcs/docker-compose.yml down --timeout 1 --volumes --rmi all
	sudo rm -rf $(DB_VOLUME) $(WP_VOLUME)

secrets:
	mkdir -p $@
	openssl req -x509 -newkey rsa:4096 -keyout secrets/key.pem -out secrets/cert.pem -sha256 -days 3650 -nodes -subj "/CN=bajeanno.42.fr"
	openssl rand -base64 15 > secrets/db_passwd.txt
	openssl rand -base64 15 > secrets/db_root_passwd.txt
	openssl rand -base64 15 > secrets/wp_admin_passwd.txt

.PHONY: create_volumes
create_volumes:
	sudo mkdir -p $(DB_VOLUME)
	sudo chown -R $(USER) $(DB_VOLUME)
	sudo mkdir -p $(WP_VOLUME)
	sudo chown -R $(USER) $(WP_VOLUME)

.PHONY: logs
logs:
	docker compose -f srcs/docker-compose.yml logs -f
