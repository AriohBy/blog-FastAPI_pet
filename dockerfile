FROM python:3.13-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
WORKDIR /app
ENV UV_NO_DEV=1
ENV UV_LINK_MODE=copy
COPY pyproject.toml uv.lock /app/
ENV UV_PROJECT_ENVIRONMENT=/usr/local
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --locked --no-editable --no-install-project
COPY . /app
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host=0.0.0.0", "--port=8000"]