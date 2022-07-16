build:
	docker compose -f local.yml up --build -d --remove-orphans

up:
	docker compose -f local.yml up -d

down:
	docker compose -f local.yml down

show_logs:
	docker compose -f local.yml logs

migrate:
	docker compose -f local.yml run --rm api python3 manage.py migrate

makemigrations:
	docker compose -f local.yml run --rm api python3 manage.py makemigrations

rebuild-index:
	docker compose -f local.yml run --rm api python3 manage.py rebuild_index

collectstatic:
	docker compose -f local.yml run --rm api python3 manage.py collectstatic --no-input --clear

superuser:
	docker compose -f local.yml run --rm api python3 manage.py createsuperuser

down-v:
	docker compose -f local.yml down -v

volume:
	docker volume inspect authors-src_local_postgres_data

authors-db:
	docker compose -f local.yml exec postgres psql --username=alphaogilo --dbname=authors-live

flake8:
	docker compose -f local.yml exec api flake8 .

black-check:
	docker compose -f local.yml exec api black --check --exclude=migrations .

black-diff:
	docker compose -f local.yml exec api black --diff --exclude=migrations .

black:
	docker compose -f local.yml exec api black --exclude=migrations .

isort-check:
	docker compose -f local.yml exec api isort . --check-only --skip env --skip migrations

isort-diff:
	docker compose -f local.yml exec api isort . --diff --skip env --skip migrations

isort:
	docker compose -f local.yml exec api isort . --skip env --skip migrations

test:
	export DATABASE_URL=postgres://benidevo:admin123456@localhost:5432/authors_db CELERY_BROKER=redis://redis:6379/0 CELERY_BACKEND=redis://redis:6379/0 SIGNING_KEY=Z75JxFBbQf1FGFz0sGxQOZnh4KDZpVUE5WmuN41Usjbyf3TIrcc EMAIL_PORT=1025 DOMAIN=locahost:8080 CELERY_FLOWER_USER=admin CELERY_FLOWER_PASSWORD=admin123456 && pytest -p no:warnings --cov=. --cov-report html -v
