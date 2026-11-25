# GENERATED L-009 hermetic Node build (--network=none, SBOM+SLSA-attestation-producing).
# Pinned base from BASE_IMAGE_DIGESTS.lock; vendored resolved /app tree + debs from Dockerfile.vendor.
# NO install verb offline — the fully-resolved, prod-pruned node_modules is COPYd verbatim.
FROM ubuntu:24.04@sha256:9c7f200c07e3d4a03e7249d2c16bf66a51120fb876aa2242cf31451412543289 AS nodedist
COPY vendored/node/ /nodedist/
RUN cd /nodedist && echo '518674de2b621728a5e4486f5fb3b7d2900bb3cc4aa97969edaa463db99f9778  node-v26.13.1-linux-x64.tar.gz' | sha256sum -c - && \
    mkdir -p /opt/node && tar -xzf node-v26.13.1-linux-x64.tar.gz -C /opt/node --strip-components=1 --no-same-owner && \
    mkdir -p /opt/node/share/doc/nodejs && mv /opt/node/LICENSE /opt/node/share/doc/nodejs/LICENSE && \
    rm -rf /opt/node/CHANGELOG.md /opt/node/README.md /opt/node/lib/node_modules/npm /opt/node/lib/node_modules/corepack /opt/node/bin/npm /opt/node/bin/npx /opt/node/bin/corepack
FROM ubuntu:24.04@sha256:9c7f200c07e3d4a03e7249d2c16bf66a51120fb876aa2242cf31451412543289
ENV DEBIAN_FRONTEND=noninteractive NODE_ENV=production
RUN --mount=type=bind,source=vendored/debs,target=/tmp/debs \
    set --; for f in /tmp/debs/*.deb; do [ -e "$f" ] && set -- "$@" "$f"; done; \
    for pass in 1 2 3 4 5; do [ $# -eq 0 ] || dpkg -i --skip-same-version "$@" >/dev/null 2>&1 && break; done; \
    dpkg --configure -a && bad= && for d in "$@"; do p=$(dpkg-deb -f "$d" Package) v=$(dpkg-deb -f "$d" Version); \
      case "$(dpkg-query -W -f='${Version} ${db:Status-Abbrev}' "$p" 2>/dev/null)" in "$v ii"*) ;; *) bad="$bad $p=$v" ;; esac; done && \
    { [ -z "$bad" ] || { echo "vendored debs not installed at their vendored version:$bad" >&2; false; }; } && \
    rm -rf /var/lib/apt/lists/* \
           /var/log/dpkg.log /var/log/alternatives.log /var/log/apt /var/cache/ldconfig/aux-cache /var/cache/fontconfig
COPY --from=nodedist /opt/node/ /usr/local/
ARG SOURCE_DATE_EPOCH=1795543338
RUN node --version && (! getent passwd ubuntu >/dev/null || userdel --remove ubuntu) && groupadd -r -g 1000 wiki && useradd -r -u 1000 -g wiki -d /wiki -m wiki && \
    : "${SOURCE_DATE_EPOCH:?SOURCE_DATE_EPOCH must be set for a reproducible build}" && \
    sed -ri "s/^([^:]*:[^:]*):[0-9]*:/\1:$((SOURCE_DATE_EPOCH/86400)):/" /etc/shadow && \
    rm -f /etc/passwd- /etc/shadow- /etc/group- /etc/gshadow-
COPY --chown=wiki:wiki vendored/wikijs-src/assets /wiki/assets
COPY --chown=wiki:wiki vendored/wikijs-src/blocks/compiled /wiki/blocks/compiled
COPY --chown=wiki:wiki vendored/wikijs-src/backend /wiki/backend
COPY --chown=wiki:wiki vendored/wikijs-src/dev/build/config.yml /wiki/config.yml
COPY --chown=wiki:wiki vendored/wikijs-src/LICENSE /wiki/LICENSE
RUN mkdir -p /wiki/data /wiki/data/content /wiki/data/repo /wiki/data/cache && chown -R wiki:wiki /wiki/data /wiki/data/content /wiki/data/repo /wiki/data/cache
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chown wiki:wiki /usr/local/bin/entrypoint.sh; chmod 0755 /usr/local/bin/entrypoint.sh
LABEL org.opencontainers.image.title="Wiki.js"
LABEL org.opencontainers.image.version="3.4.0-CE-ubuntu24.04-r2"
LABEL org.opencontainers.image.licenses="AGPL-3.0"
LABEL org.opencontainers.image.source="https://github.com/requarks/wiki"
LABEL org.opencontainers.image.description="Wiki.js 3 - the AGPL-3.0 open-source wiki, built from source on Ubuntu 24.04."
LABEL org.opencontainers.image.vendor="Requarks"
LABEL com.readystack.license.disclosure="This image includes Wiki.js (https://github.com/requarks/wiki), licensed under AGPL-3.0, built from upstream's release tag 3.4.0. Modifications: backend/package.json and frontend/package.json carry the release version (3.4.0 instead of upstream's placeholder 3.0.0-dev), the edit upstream's own release build makes, and npm writes the same version into the two version fields of backend/package-lock.json when it installs the server's dependencies; full diff of every upstream file the build changes at https://readystack.dev/source/wikijs/3.4.0/wikijs-3.4.0-readystack.patch. An npm dependency raised for a security fix is set as an override in backend/package.json to an upstream-published version (the modules are unmodified) and is part of that diff; Ubuntu packages are upstream-published and unmodified. ReadyStack license holders have access to the image build recipe and patched-package manifest on request via contact@readystack.dev."
LABEL readystack.license_disclosure="AGPL-3.0 (requarks/wiki). Network use triggers source-availability. Modified: the version stamp in backend/ and frontend/package.json (3.4.0), which npm also writes into backend/package-lock.json; diff, with any security overrides in backend/package.json, at https://readystack.dev/source/wikijs/3.4.0/wikijs-3.4.0-readystack.patch. Corresponding source: the upstream tag 3.4.0 with that patch; the release archive carries the full vendored tree and build recipe."
LABEL org.opencontainers.image.revision="c711a5a2d5652961658c9f4f81b90665dfeaf929"
HEALTHCHECK --interval=10s --timeout=10s --start-period=90s \
  CMD curl -fsS -o /dev/null http://127.0.0.1:3000/_api/system/flags || exit 1
USER wiki
WORKDIR /wiki
EXPOSE 3000
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "/usr/local/bin/entrypoint.sh"]
