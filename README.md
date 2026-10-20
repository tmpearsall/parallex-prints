# Parallex Prints

The front door for parallexprints.com: a small Rails 8 site with no database. Products live in `app/models/catalog.rb` and link to the Etsy shop, where purchases happen. Custom work is by email.

Run locally: `bin/rails server -p 3011`. Deploy: Docker (see `Dockerfile`); set `SECRET_KEY_BASE` and `RAILS_LOG_TO_STDOUT=true`.
