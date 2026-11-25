# Wiki.js: ReadyStack build kit

The offline build kit for the Docker image `readystack/wikijs:3.4.0-CE-ubuntu24.04-r2`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [3.4.0-CE-ubuntu24.04-r2](https://github.com/readystack-dev/wikijs/releases/tag/3.4.0-CE-ubuntu24.04-r2)
- Image: [`docker.io/readystack/wikijs:3.4.0-CE-ubuntu24.04-r2`](https://hub.docker.com/r/readystack/wikijs/tags), manifest digest `sha256:7f333973f5a76d7707116c401b13200d4ea18fd5168995c3c312dfa068bfd2e3`
- Product page: https://readystack.dev/products/wikijs
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=wikijs

Wiki.js is distributed under its upstream licence (AGPL-3.0); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [3.4.0-CE-ubuntu24.04-r2 release](https://github.com/readystack-dev/wikijs/releases/tag/3.4.0-CE-ubuntu24.04-r2): `ReadyStack-wikijs-3.4.0-CE-ubuntu24.04-r2.tar.gz` (311.8 MB), SHA-256 `2fb23c4bb96643580b6224275b99c7d2c3bae42389fd210c245620993ef08fb2`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-wikijs-3.4.0-CE-ubuntu24.04-r2.rebuild.json.sigstore ReadyStack-wikijs-3.4.0-CE-ubuntu24.04-r2.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-wikijs-3.4.0-CE-ubuntu24.04-r2.tar.gz
cd 3.4.0-CE-ubuntu24.04-r2
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-wikijs-3.4.0-CE-ubuntu24.04-r2.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/wikijs/recipe. The complete kit is the release download. Each release is a tag here.
