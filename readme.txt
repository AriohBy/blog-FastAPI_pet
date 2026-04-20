# For create uv.lock

docker run --rm \
  -v "$PWD:/app" \
  -w /app \
  python:3.13-slim \
  sh -lc "pip install -q --root-user-action=ignore uv && uv lock"

# Build and run
docker build -t fastapi-uv .
docker run --rm -p 8000:8000 fastapi-uv

#Only run a container with PG.
docker compose up db 
uv run fastapi dev main.py


# Swagger
http://localhost:8000/docs


token generation:
python -c "import secrets;    print(secrets.token_hex(32))"

run DB only (for ):
docker compose up db

alembic: 
uv run alembic init -t async alembic
uv run alembic revision --autogenerate -m "initial schema"
uv run alembic upgrade head
uv run alembic current
uv run alembic history

PyTest:

docker compose -f docker-compose.tests.yml up --build --abort-on-container-exit