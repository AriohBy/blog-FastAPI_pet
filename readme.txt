# For create uv.lock

docker run --rm \
  -v "$PWD:/app" \
  -w /app \
  python:3.13-slim \
  sh -lc "pip install -q --root-user-action=ignore uv && uv lock"

# Build and run
docker build -t fastapi-uv .
docker run --rm -p 8000:8000 fastapi-uv

# Witout docker 
uv run fastapi dev main.py


# Swagger
http://localhost:8000/docs