[![ReadyStack](https://readystack.dev/logo.svg)](https://readystack.dev)

**Stable, Open-source Releases, Automated** · [readystack.dev](https://readystack.dev)

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-readystack%2Fwikijs-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/readystack/wikijs) [![Docker pulls](https://img.shields.io/docker/pulls/readystack/wikijs)](https://hub.docker.com/r/readystack/wikijs) [![Grade at release](https://img.shields.io/badge/grade%20at%20release-A%20%2894%25%29-2ea44f)](https://readystack.dev/products/wikijs) [![Signed: cosign](https://img.shields.io/badge/signed-cosign-2ea44f)](https://readystack.dev/keys/cosign.pub) ![SBOM: SPDX](https://img.shields.io/badge/SBOM-SPDX-2ea44f) ![Provenance: SLSA v1](https://img.shields.io/badge/provenance-SLSA%20v1-2ea44f) ![Offline rebuild: verified](https://img.shields.io/badge/offline%20rebuild-verified-2ea44f)

# Wiki.js: ReadyStack build kit

The offline build kit for the Docker image `readystack/wikijs:3.6.1-CE-ubuntu24.04-r1`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [3.6.1-CE-ubuntu24.04-r1](https://github.com/readystack-dev/wikijs/releases/tag/3.6.1-CE-ubuntu24.04-r1)
- Image: [`docker.io/readystack/wikijs:3.6.1-CE-ubuntu24.04-r1`](https://hub.docker.com/r/readystack/wikijs/tags), manifest digest `sha256:e7170ba1b3adfd033db94a8749377e9b428cc8b3b175fd470572c744ffa54f21`
- Product page: https://readystack.dev/products/wikijs
- Source and build recipe: https://readystack.dev/products/wikijs/recipe
- Build trail: https://readystack.dev/products/wikijs/trail/3.6.1-CE-ubuntu24.04-r1
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=wikijs

## The image

One container running the Wiki.js 3 server (Node.js 26, `node --no-experimental-webstorage backend` under tini as PID 1, one foreground process plus its worker threads) on port 3000, and a PostgreSQL 17 or later database that you run beside it. Wiki.js 3 supports no other database and embeds none. Everything the wiki stores lives in that database: pages and their history, users and groups, settings, and uploaded files (stored as binary columns), in a schema named wiki (DB_SCHEMA). /wiki/data inside the container is a cache that starts empty in a new container and fills as the wiki is used, plus the working copies of Git storage targets you configure. It is not a multi-instance cluster in this configuration.

## Who uses Wiki.js and why

Teams and organisations that want a self-hosted wiki for their documentation, written in Markdown or a visual editor.

Wiki.js is open-source wiki software with Markdown, visual and HTML editors, version history on every page, search, and sign-in through local accounts or company systems such as LDAP, SAML and OpenID Connect.

A typical use: An engineering team writes its documentation in Markdown, while the support team prefers a visual editor. In Wiki.js both edit the same wiki, every change is tracked so a page can be compared or reverted, and staff sign in with their company accounts.

From the upstream project's own description: https://github.com/requarks/wiki, https://js.wiki/.

## This release

- Docker Scout policy grade at release: **A** (94%), graded 2026-11-28 with `docker scout policy` (CLI 1.26.0, docker-default configuration).
  - Docker Scout counts 111 packages with copyleft licences (AGPL, GPL, LGPL, MPL), 109 of them operating-system packages (it counts only packages whose licence it can read; the SBOM lists every component). AGPL: wiki-backend.
- Signed with ReadyStack's release key (fingerprint `04daa92344a52dbc`): https://readystack.dev/keys/cosign.pub.
- Runs as a non-root user (`wiki`).
- Attestations on the image: an SPDX SBOM and SLSA provenance v1.
- Rebuilt from this kit with network egress blocked on 2026-11-28; the rebuilt image digest is the published one.
- Base: Ubuntu 24.04.

The current grade, measured again every day, is on https://readystack.dev/products/wikijs.

Wiki.js is distributed under its upstream licence (AGPL-3.0); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [3.6.1-CE-ubuntu24.04-r1 release](https://github.com/readystack-dev/wikijs/releases/tag/3.6.1-CE-ubuntu24.04-r1): `ReadyStack-wikijs-3.6.1-CE-ubuntu24.04-r1.tar.gz` (312.4 MB), SHA-256 `a678f2740394fecd313d08b32a6ca0516e5f5189dd9f63749cc703998d847486`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-wikijs-3.6.1-CE-ubuntu24.04-r1.rebuild.json.sigstore ReadyStack-wikijs-3.6.1-CE-ubuntu24.04-r1.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-wikijs-3.6.1-CE-ubuntu24.04-r1.tar.gz
cd 3.6.1-CE-ubuntu24.04-r1
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-wikijs-3.6.1-CE-ubuntu24.04-r1.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/wikijs/recipe. The complete kit is the release download. Each release is a tag here. How to report a vulnerability: [SECURITY.md](SECURITY.md).

## About ReadyStack

**Stable, Open-source Releases, Automated.** ReadyStack releases popular open-source apps every week with every available critical and high security fix applied, plus full documentation, reference data, tests and a build recipe that recreates each release bit-for-bit. Each release is rebuilt from its pinned inputs with the network off, checked against its published digest, signed, and scanned and graded again every day. The images and build kits are free, and ReadyStack is soon to be a nonprofit.

[readystack.dev](https://readystack.dev) · [All products](https://readystack.dev/products.html) · [Build kits on GitHub](https://github.com/readystack-dev) · [Defect log](https://readystack.dev/defects.html) · contact@readystack.dev

— ReadyStack · https://readystack.dev
