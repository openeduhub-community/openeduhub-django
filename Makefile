docker_file ?= -f docker-compose.yml
execute_flags ?=

makemigrations:
	docker-compose $(docker_file) exec $(execute_flags) web python manage.py makemigrations

migrate:
	docker-compose $(docker_file) exec $(execute_flags) web python manage.py migrate

createsuperuser:
	docker-compose $(docker_file) exec $(execute_flags) web python manage.py createsuperuser

collectstatic:
	docker-compose $(docker_file) exec $(execute_flags) web python manage.py collectstatic

shell:
	docker-compose $(docker_file) exec $(execute_flags) web python manage.py shell

install:
	docker-compose $(docker_file) exec $(execute_flags) web pip install $(package)

start:
	docker-compose $(docker_file) build
	docker-compose $(docker_file) up --no-start
	docker-compose $(docker_file) start

stop:
	docker-compose $(docker_file) down

restart: stop start

dropdb:
	docker-compose $(docker_file) down
	- docker volume rm openeduhub_postgres_data

prune:
	docker system prune --force
