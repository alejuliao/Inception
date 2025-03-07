DOCKER-COMPOSE=docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml

up: create-volumes
	$(DOCKER-COMPOSE) up -d

down:
	$(DOCKER-COMPOSE) down

clean: remove-volumes
	$(DOCKER-COMPOSE) down -v

restart:
	$(DOCKER-COMPOSE) restart

logs:
	$(DOCKER-COMPOSE) logs -f

shell-nginx:
	docker exec -it nginx sh

shell-db:
	docker exec -it mariadb mariadb -u root -p

shell-wp:
	docker exec -it wordpress sh

build:
	$(DOCKER-COMPOSE) build --no-cache

ps:
	$(DOCKER-COMPOSE) ps

create-volumes:
	docker volume create wordpress
	docker volume create mariadb
	docker volume create nginx

remove-volumes:
	docker volume rm wordpress
	docker volume rm mariadb
	docker volume rm nginx

fclean: clean
	docker rmi -f $(shell docker images -q)

help:
	@echo "Available commands:"
	@echo "  make up          - Start all services in detached mode"
	@echo "  make down        - Stop all services"
	@echo "  make clean       - Stop and remove volumes"
	@echo "  make fclean      - Stop, remove volumes and delete built images"
	@echo "  make restart     - Restart all services"
	@echo "  make logs        - Show logs of all services"
	@echo "  make shell-nginx - Access the Nginx container shell"
	@echo "  make shell-db    - Access the MariaDB container shell"
	@echo "  make shell-wp    - Access the WordPress container shell"
	@echo "  make build       - Build images without cache"
	@echo "  make ps          - Show running services"
	@echo "  make create-volumes - Create required volumes"
	@echo "  make remove-volumes - Remove created volumes"
