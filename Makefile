down:
	docker-compose down
up:
	docker-compose up -d
restart:
	@make down
	@make up
stop:
	docker-compose stop
bash:
	docker-compose exec -u 1000:1000 app bash
app:
	docker-compose exec app bash
web:
	docker-compose exec web bash
db:
	docker-compose exec db bash
tinker:
	docker-compose exec app php artisan tinker
migrate:
	docker-compose exec app php artisan migrate