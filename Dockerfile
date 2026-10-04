FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --no-cache-dir \
    redis>=5.0.0 \
    openai>=1.54.0 \
    pytest>=8.0.0 \
    flake8>=7.0.0

COPY dots_agent_runtime.py .
COPY app_mesh_router.py .

CMD ["python3", "dots_agent_runtime.py"]
