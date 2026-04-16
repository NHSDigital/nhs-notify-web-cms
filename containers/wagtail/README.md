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
- **Django 5.1**: Modern Django framework
- **Markdown support**: Easy content editing with wagtail-markdown
- **NHS.UK Frontend 10.1.0**: Official NHS design system
- **Custom NHS Notify branding**: Matching the Jekyll site styling
- **Single command startup**: `docker-compose up --build`
- **PostgreSQL 16**: Production database backend
- **Gunicorn**: Production WSGI server
- **Health checks**: `/health/` endpoint for monitoring
- **Whitenoise**: Efficient static file serving

## Styling and Templates

The CMS uses the official NHS.UK Frontend design system with custom NHS Notify branding:

- **Base template**: [home/templates/base.html](home/templates/base.html)
- **NHS.UK Frontend**: Built via NPM during Docker build (v10.1.0)
- **Static assets**: Generated in `static/dist/` from `node_modules`

Templates include:

- NHS header with navigation
- NEWS banner
- NHS footer with links
- Responsive NHS.UK grid layout
- Child page listings for section index pages
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
- `package.json` - NPM dependencies for NHS.UK Frontend

## Page Types

The CMS includes three page types:

1. **HomePage** - Site root (only one allowed)
   - StreamField sections: hero, benefits, how_it_works, pricing, CTA
   - Auto-created by migration

2. **SectionIndexPage** - Container pages that list child pages
   - Fields: introduction (markdown), body (markdown)
   - Automatically displays child pages
   - Can be nested

3. **ContentPage** - Standard content pages
   - Fields: introduction (markdown), body (markdown)
   - Cannot have children

## Migrating Content from Jekyll

The Jekyll site content is in the `docs/` directory. To migrate it to Wagtail:

1. Create pages through the Wagtail admin at http://localhost:8080/admin/
2. Start with key section pages (About, Get Started, Pricing, Using NHS Notify, Support)
3. Copy markdown content from `tmp/` folder files
4. Use the markdown editor to paste content directly

For the PoC, manual migration through the admin is recommended. A bulk import tool can be added later.

## Environment Variables

The container expects these environment variables:

### Django Settings

- `DJANGO_SECRET_KEY`: Django secret key (generate with `python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"`)
- `DJANGO_SETTINGS_MODULE`: `cms.settings.production` (default)
- `DEBUG`: Set to `false` in production

### Database

- `DATABASE_HOST`: PostgreSQL endpoint
- `DATABASE_PORT`: Database port (default: `5432`)
- `DATABASE_NAME`: Database name (default: `wagtail`)
- `DATABASE_USER`: Database username
- `DATABASE_PASSWORD`: Database password

### Wagtail

- `WAGTAILADMIN_BASE_URL`: Full URL to the Wagtail admin (e.g., `https://cms.example.com`)

## Local Development

### Using Docker Compose (Recommended)

1. **Start all services** (PostgreSQL and Wagtail):
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
