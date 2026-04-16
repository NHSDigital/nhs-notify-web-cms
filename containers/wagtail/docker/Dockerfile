ARG BASE_IMAGE

FROM ${BASE_IMAGE}

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    libpq-dev \
    # Node.js for NHS.UK Frontend build
    ca-certificates \
    gnupg \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -u 1000 wagtail && \
    mkdir -p /app && \
    chown -R wagtail:wagtail /app

WORKDIR /app

# Set default environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DJANGO_SETTINGS_MODULE=cms.settings.production \
    PORT=8080

# Create static directory
RUN mkdir -p /app/static

# Build NHS.UK Frontend static assets
COPY package.json package-lock.json* ./
RUN npm install && npm run build:static

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY --chown=wagtail:wagtail . .

# Note: collectstatic is run in the CMD on container startup to avoid permission issues
# RUN SECRET_KEY=none python manage.py collectstatic --noinput --clear

USER wagtail

EXPOSE 8080

# Run Django migrations and start gunicorn
# Note: For production, migrations should be run separately, but for PoC this is acceptable
CMD set -xe; \
    python manage.py collectstatic --noinput; \
    python manage.py migrate --noinput; \
    gunicorn cms.wsgi:application --bind 0.0.0.0:8080 --workers 2 --timeout 60 --access-logfile - --error-logfile -
