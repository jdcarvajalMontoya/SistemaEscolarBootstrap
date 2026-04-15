# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Sistema Escolar Microservicios** — A school management system built as 7 independent Django REST API services, containerized with Docker and sharing a single PostgreSQL database.

## Running the Project

All services are managed via Docker Compose from the `configuracion/` directory:

```bash
# Start all services
cd configuracion
docker-compose up -d

# Stop all services
docker-compose down

# View logs for a specific service
docker-compose logs -f auth_service

# Rebuild after code changes
docker-compose up -d --build

# Run migrations inside a container
docker-compose exec auth_service python manage.py migrate

# Create a superuser
docker-compose exec auth_service python manage.py createsuperuser
```

## Services & Ports

| Service | Port | Status |
|---|---|---|
| auth_service | 8001 | Implemented |
| usuarios_service | 8002 | Placeholder |
| curriculum_service | 8003 | Placeholder |
| grupos_service | 8004 | Placeholder |
| aulas_virtuales_service | 8005 | Placeholder |
| docente_hojavida_service | 8006 | Placeholder |
| parametricos_service | 8007 | Placeholder |
| PostgreSQL | 5432 | Shared |
| pgAdmin | 5050 | Admin UI |

## Architecture

Each microservice is a standalone Django project with its own:
- `Dockerfile` (Python 3.9-slim)
- `requirements.txt`
- Django settings at `<service>/<service_name>/settings.py`
- Apps registered under an `apps/` directory

All services connect to the same PostgreSQL instance (`sistema_escolar` DB) over the `microservicios_network` Docker bridge network. There is **no data isolation** between services at the DB layer.

### Auth Service (Reference Implementation)

The only fully implemented service. Key structure:
- `auth_service/authentication/models.py` — Custom `Usuario` model extending `AbstractUser` with role (`admin`, `docente`, `estudiante`, `acudiente`), document ID, phone, address, birthdate
- `auth_service/authentication/views.py` — JWT login, register, profile, logout endpoints
- `auth_service/authentication/serializers.py` — DRF serializers
- `auth_service/auth/settings.py` — Django config (JWT 1hr expiry, CORS all-origins, SimpleJWT blacklisting)

**Auth endpoints:**
```
POST /api/auth/login/      → returns access + refresh JWT tokens
POST /api/auth/register/   → creates new user
GET  /api/auth/profile/    → returns authenticated user's profile
POST /api/auth/logout/     → blacklists refresh token
```

## Tech Stack

- **Python 3.9** / **Django 4.2.7** / **Django REST Framework 3.14.0**
- **SimpleJWT 5.3.0** — JWT authentication with token blacklisting
- **PostgreSQL 15** — shared database
- **Celery 5.3.4** + **Redis 5.0.1** — task queue (configured, not yet used)
- **Docker + Docker Compose** — containerization

## Configuration

Environment variables are defined in `configuracion/.env`. Key variables:

```
POSTGRES_DB=sistema_escolar
POSTGRES_USER=postgres
POSTGRES_PASSWORD=admin123
AUTH_SERVICE_PORT=8001
# ... one port var per service
```

Each service's Django settings reads DB credentials from environment. CORS is currently open (`CORS_ALLOW_ALL_ORIGINS = True`) — restrict for production.

## Implementing New Services

When adding functionality to a placeholder service, follow the `auth_service` pattern:
1. Create Django app inside `apps/` subdirectory
2. Register app in `<service_name>/settings.py`
3. Define models, serializers, views, urls
4. Run `docker-compose exec <service> python manage.py makemigrations && migrate`

All services share the database, so cross-service model references should use `db_table` and `managed = False` (or direct FK references if both services are in the same DB).
