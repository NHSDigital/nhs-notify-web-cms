# NHS Notify Wagtail CMS Container

Production-ready Wagtail CMS container for NHS Notify.

## Quick Start

```bash
# Start all services (PostgreSQL, Redis, Wagtail)
make up

# Create a superuser account
make superuser

# View logs
make logs

# Access at http://localhost:8080
```

For all available commands: `make help`

## Features

- **Wagtail 6.3**: Latest stable Wagtail CMS
- **Django 5.0**: Modern Django framework
- **PostgreSQL**: Production database backend
- **Redis**: Caching and session storage
- **S3 Storage**: Media files stored in AWS S3
- **Gunicorn**: Production WSGI server
- **Health checks**: `/health/` endpoint for ALB
- **Prometheus metrics**: `/metrics` endpoint for monitoring
- **Security hardened**: CSP, HSTS, secure cookies

## Environment Variables

The container expects these environment variables (provided by ECS):

### Django Settings
- `DJANGO_SECRET_KEY`: Django secret key (from SSM Parameter Store)
- `DJANGO_SETTINGS_MODULE`: `config.settings.production` (default)
- `ALLOWED_HOSTS`: Comma-separated list of allowed hostnames
- `DEBUG`: Set to `false` in production

### Database
- `DATABASE_HOST`: RDS PostgreSQL endpoint
- `DATABASE_PORT`: Database port (default: `5432`)
- `DATABASE_NAME`: Database name (default: `wagtail`)
- `DATABASE_USER`: Database username
- `DATABASE_PASSWORD`: Database password (from SSM Parameter Store)
- `DATABASE_SSLMODE`: SSL mode for database connection (default: `prefer`)

### Redis Cache
- `REDIS_HOST`: ElastiCache Redis endpoint
- `REDIS_PORT`: Redis port (default: `6379`)
- `REDIS_AUTH_TOKEN`: Redis authentication token (from SSM Parameter Store)
- `REDIS_SSL`: Enable SSL for Redis (default: `true`)

### S3 Storage
- `AWS_STORAGE_BUCKET_NAME`: S3 bucket for media files
- `AWS_S3_REGION_NAME`: AWS region (default: `eu-west-2`)

### Wagtail
- `WAGTAILADMIN_BASE_URL`: Full URL to the Wagtail admin (e.g., `https://cms.example.com`)

## Local Development

### Using Docker Compose (Recommended)

1. **Start all services** (PostgreSQL, Redis, Wagtail):
   ```bash
   docker-compose up -d
   ```

2. **View logs**:
   ```bash
   docker-compose logs -f wagtail
   ```

3. **Create a superuser**:
   ```bash
   docker-compose exec wagtail python manage.py createsuperuser
   ```

4. **Access the application**:
   - Wagtail CMS: http://localhost:8080
   - Admin interface: http://localhost:8080/admin/
   - Health check: http://localhost:8080/health/

5. **Stop services**:
   ```bash
   docker-compose down
   ```

6. **Reset database** (removes all data):
   ```bash
   docker-compose down -v
   ```

### Manual Local Setup

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Set environment variables:
   ```bash
   export DJANGO_SETTINGS_MODULE=config.settings.development
   export DATABASE_HOST=localhost
   export DATABASE_PASSWORD=password
   export REDIS_SSL=false
   ```

3. Run migrations:
   ```bash
   python src/manage.py migrate
   ```

4. Create superuser:
   ```bash
   python src/manage.py createsuperuser
   ```

5. Run development server:
   ```bash
   python src/manage.py runserver 8080
   ```

## Environment Variables

See [.env.example](.env.example) for a complete list of environment variables. Copy it to `.env` for docker-compose:

```bash
cp .env.example .env
```


## Building the Container

```bash
npm run build:container
```

Or directly:
```bash
cd ../.. && make docker-build-and-push base_image=python:3.12-slim dir=containers/wagtail
```

## Running Migrations in ECS

After deployment, run migrations via ECS Exec or one-off task:

```bash
aws ecs run-task \
  --cluster <cluster-name> \
  --task-definition <task-definition> \
  --launch-type FARGATE \
  --network-configuration "awsvpcConfiguration={subnets=[<subnet-ids>],securityGroups=[<sg-id>]}" \
  --overrides '{"containerOverrides": [{"name": "wagtail", "command": ["python", "manage.py", "migrate"]}]}'
```

## Creating a Superuser

```bash
aws ecs run-task \
  --cluster <cluster-name> \
  --task-definition <task-definition> \
  --launch-type FARGATE \
  --network-configuration "awsvpcConfiguration={subnets=[<subnet-ids>],securityGroups=[<sg-id>]}" \
  --overrides '{"containerOverrides": [{"name": "wagtail", "command": ["python", "manage.py", "createsuperuser", "--noinput", "--username", "admin", "--email", "admin@example.com"]}]}'
```

## Health Check

The container exposes `/health/` endpoint that returns HTTP 200 with "OK" text.

## Metrics

Prometheus metrics are available at `/metrics` endpoint.

## Security

- All secrets managed via SSM Parameter Store
- S3 media files use IAM role authentication
- SSL/TLS for database and Redis connections
- CSP, HSTS, and other security headers enabled
- Non-root user execution
- Read-only root filesystem compatible
