# NHS Notify Wagtail CMS Container

Minimal Wagtail CMS PoC for NHS Notify.

## Quick Start

```bash
# Start all services (PostgreSQL and Wagtail)
docker-compose up

# In another terminal, create a superuser account
docker-compose exec wagtail python manage.py createsuperuser

# Access at:
# - Site: http://localhost:8080
# - Admin: http://localhost:8080/admin/
# - Health check: http://localhost:8080/health/
```

To stop:
```bash
docker-compose down
```

To reset database (removes all data):
```bash
docker-compose down -v
```

## Features

- **Wagtail 7.3+**: Latest stable Wagtail CMS
- **Django 4.2+**: Modern Django framework
- **Markdown support**: Easy content editing with wagtail-markdown
- **NHS.UK Frontend**: Official NHS design system (via CDN)
- **Custom NHS Notify branding**: Matching the Jekyll site styling
- **Single command startup**: `docker-compose up --build`

## Styling and Templates

The CMS uses the official NHS.UK Frontend design system with custom NHS Notify branding:

- **Base template**: [home/templates/base.html](home/templates/base.html)
- **Custom CSS**: [static/css/nhsnotify.css](static/css/nhsnotify.css)
- **NHS.UK Frontend**: Loaded from CDN (v10.1.0)
- **Fonts**: Self-hosted Frutiger fonts in [static/fonts/](static/fonts/)
- **Favicons**: NHS-branded icons in [static/favicons/](static/favicons/)

Templates include:
- Side navigation for section pages
- Breadcrumb navigation
- Child page listings for section index pages
- Responsive layout matching the Jekyll site
- **PostgreSQL**: Production database backend
- **Gunicorn**: Production WSGI server
- **Health checks**: `/health/` endpoint for ALB
- **Whitenoise**: Efficient static file serving

## Project Structure

- `cms/` - Django project configuration and settings
- `home/` - Wagtail app with page models (HomePage, SectionIndexPage, ContentPage)
- `manage.py` - Django management script
- `docker/` - Docker configuration
- `docker-compose.yml` - Local development environment
- `CONTENT_MIGRATION.md` - Guide for porting Jekyll content to Wagtail

## Page Types

The CMS includes three page types to mirror the Jekyll site structure:

1. **HomePage** - Site root (only one allowed)
   - Fields: introduction, body

2. **SectionIndexPage** - Container pages that list child pages (e.g., "Get Started", "Pricing")
   - Fields: introduction, body, show_children
   - Automatically displays child pages if enabled

3. **ContentPage** - Standard content pages
   - Fields: introduction, body, show_in_navigation
   - Can be nested under other pages

## Migrating Content from Jekyll

The Jekyll site content is in the `docs/` directory. To migrate it to Wagtail:

1. Read [CONTENT_MIGRATION.md](CONTENT_MIGRATION.md) for detailed instructions
2. Start with key pages (Home, Get Started, Pricing)
3. Create pages through the Wagtail admin at http://localhost:8080/admin/
4. Copy content from Jekyll markdown files, converting as needed

For the PoC, manual migration through the admin is recommended. A bulk import tool can be added later.

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
