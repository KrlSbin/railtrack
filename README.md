# Railtrack

Rails 8.1 app on Ruby 4.0.10 (see `.ruby-version`) with PostgreSQL 17.
Deployed to Render (`render.yaml`, `bin/render-build.sh`).

## Development (Docker)

Only Docker is required on the host.

```bash
cp config/database.yml.distr config/database.yml   # first time only
docker compose up                                  # http://localhost:3000
```

On start the container installs gems and JS packages (cached in Docker volumes)
and runs `db:prepare` for the development and test databases.
Postgres is also exposed on `localhost:5455` (user `postgres`, password `password`).

Common commands:

```bash
docker compose run --rm web bin/rails console
docker compose run --rm web bin/rails db:migrate
docker compose run --rm -e RAILS_ENV=test web bin/rake    # tests (same as CI)
docker compose run --rm web bin/rubocop
```

If the app is already running, use `docker compose exec web ...` instead of `run --rm`.

## Upgrading Ruby

Update the version in `.ruby-version`, `Gemfile`, `Dockerfile` and `Dockerfile.dev`,
then `docker compose build` and `docker compose run --rm web bundle install`.
