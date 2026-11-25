#!/bin/sh
# Wiki.js 3 creates its first administrator from ADMIN_EMAIL (default admin@example.com) and ADMIN_PASS the first
# time it starts on an empty database. Without ADMIN_PASS upstream falls back to a published password, so this image
# refuses to start without one. ADMIN_PASS is read only when the database is empty; on an existing wiki it changes nothing.
set -e
if [ -z "${ADMIN_PASS:-}" ]; then
  echo 'wikijs: ADMIN_PASS is not set. Set ADMIN_PASS (and ADMIN_EMAIL) to the first administrator'"'"'s password; it is used only when the database is empty.' >&2
  exit 64
fi
cd /wiki
exec node --no-experimental-webstorage backend
