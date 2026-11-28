# Wiki.js 3.6.1 — ReadyStack release `3.6.1-CE-ubuntu24.04-r1`

Generated 2026-11-28 from this release's build records and strategy. Statements that come from a single record name it in brackets; the others come from this release's strategy and build log.

## Release

- **Image:** `readystack/wikijs:3.6.1-CE-ubuntu24.04-r1` (linux/amd64). Index digest `sha256:856417911023c24032ac87fb18a28c06fffa056580473780782d90ae76543d59` [`docs/provenance/LOCKED_DIGEST.txt`].
- **Image manifest digest:** `sha256:e7170ba1b3adfd033db94a8749377e9b428cc8b3b175fd470572c744ffa54f21` [`TARGET_DIGEST.txt`].
- **Upstream:** Wiki.js 3.6.1 built from source at `3.6.1` of https://github.com/requarks/wiki — upstream notes: https://github.com/requarks/wiki/releases/tag/3.6.1 [`docs/provenance/BUILD_RECIPE.json`].
- **Base image:** `ubuntu:24.04`; runtime user `wiki`.
- **Build:** `source-rebuild-node`, built offline with `--network=none`.
- **Supersedes:** ReadyStack release `3.4.0-CE-ubuntu24.04-r2`.

## What changed in this release

- Upstream version 3.4.0 → 3.6.1.
- Minimum dependency versions ReadyStack enforces on top of upstream (raised only where upstream's own version was lower); shipped versions from the SBOM [`docs/sbom/SBOM.json`]:
  - `fast-uri` at least `4.1.4` (shipped: `4.1.4`)
  - `undici` at least `7.30.1` (shipped: `7.30.1`)
- This release moves Wiki.js from 3.4.0 to 3.6.1, a release of upstream's newer 3.6.x line. Upstream's release notes list what changed: https://github.com/requarks/wiki/releases/tag/3.6.1

## Security status at release (measured 2026-11-27)

- **Docker Scout:** 0 fixable critical/high vulnerabilities; runs as `wiki` (non-root); SBOM + provenance attestations present (SPDX SBOM + SLSA v1) [`docs/provenance/SCOUT_VERDICT.json`].
- **OSV cross-check:** no fixable critical/high vulnerability beyond Docker Scout's findings.
- **Signature:** cosign signature verified by ReadyStack's release gate before publishing; check it yourself with `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/wikijs:3.6.1-CE-ubuntu24.04-r1` (signatures are recorded in the public Sigstore transparency log).
- **ReadyStack release check at release:** passed (ReadyStack's own test, not a Docker Scout grade). Vulnerabilities are disclosed every day and the image never changes, so it is re-checked daily, beside Docker Scout's own dated grade, at https://readystack.dev/queue.

## Reproducibility

Rebuilds offline from this archive to the identical image digest `sha256:e7170ba1b3adfd033db94a8749377e9b428cc8b3b175fd470572c744ffa54f21`: run `./BUILD_OFFLINE.sh`, then `./VERIFY_OFFLINE.sh` (add `--online` to confirm the Docker Hub tag holds the same digest). Before publishing, ReadyStack rebuilt the kit with `./BUILD_OFFLINE.sh` and compared the result with the published digest [`docs/provenance/REPRO_VERIFICATION.json`], then ran `./BUILD_OFFLINE.sh` and `./VERIFY_OFFLINE.sh` from this archive (without `--online`).

## Validation

- 5 of 7 use cases passed (37 authored, 7 kept in the suite; 30 not exercised, see below) against the running image [`docs/validation/test-results.json`].
- Failed cases are listed in `docs/validation/FAILED_TESTS.md`.
- 30 further authored checks were not exercised and are not counted above: 29 needed credentials the build's check does not have; 1 (`GET /`) were answered with the same page the build's test container served for a made-up path, so they could not show the path exists (listed under Not exercised in `docs/validation/FAILED_TESTS.md`).

## Known issues

- **high** (ReadyStack package): CVE-2026-123158 in openssh-client 1:9.6p1-3ubuntu13.20 is on CISA's Known Exploited Vulnerabilities list — CVE-2026-123158 (https://alpinelinux.org/posts/2026-11-05-openssh-password-authentication-bypass/) [`RSD-wikijs-36a8f09f08`] (carried from `3.2.0-CE-ubuntu24.04-r1`, recorded there as `RSD-wikijs-f15aba2d58`)
- **low** (ReadyStack package): Docker Hub README: The Hub README's source-changes line names only the version stamp and omits the six overrides the label and handbooks list. [`RSD-wikijs-7386390f8b`] (carried from `3.2.0-CE-ubuntu24.04-r1`, recorded there as `RSD-wikijs-9380d1922a`)
- **low** (ReadyStack package): The image refuses to start without ADMIN_PASS, although Wiki.js uses it only on the first start against an empty database [`RSD-wikijs-85fe2f54a7`] (carried from `3.0.0-beta.685-CE-ubuntu24.04-r1`, recorded there as `RSD-wikijs-9d0079c960`)
- Build-time check `wikijs-api-icons-search` (GET http://127.0.0.1:3000/_api/icons/search) returned 400, expected 200.
- Build-time check `wikijs-api-import-sessions` (GET http://127.0.0.1:3000/_api/import/sessions) returned 404, expected 200. The check itself was wrong: this release's API offers POST on that path, not GET.

## Defects fixed

- 93 problems found before release and fixed before it shipped (93 by review); each is listed in `docs/defects/defects.json`.

## Verify this archive

```
sha256sum -c CHECKSUMS.sha256
./BUILD_OFFLINE.sh && ./VERIFY_OFFLINE.sh --online
cosign verify --key https://readystack.dev/keys/cosign.pub readystack/wikijs:3.6.1-CE-ubuntu24.04-r1
```

ReadyStack records every signature in the public Sigstore transparency log (Rekor), so the command needs no extra flags.

