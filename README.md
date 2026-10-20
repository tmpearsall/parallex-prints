# Parallex Prints front door

Small Rails 8 site for parallexprints.com. No database: the products live in `app/models/Catalog` (read from the public Etsy shop on 2026-10-20), pages are plain ERB, purchases happen on Etsy, custom work is by email.

Run locally: `bin/rails server -p 3011`. Deploy: Docker (see Dockerfile); set `SECRET_KEY_BASE` and `RAILS_LOG_TO_STDOUT=true`.

Not on the site on purpose: the Jeep duck models (their Creative Commons licenses and modification credits are not yet confirmed), anything made for named customers, and any surname, city or photo of Lena.
