# Wiki.js 3.4.0 — ReadyStack release `3.4.0-CE-ubuntu24.04-r2`

Generated 2026-11-25 from this release's build records and strategy. Statements that come from a single record name it in brackets; the others come from this release's strategy and build log.

## Release

- **Image:** `readystack/wikijs:3.4.0-CE-ubuntu24.04-r2` (linux/amd64). Index digest `sha256:a95de456f88393c503c712a6ddc1184b2c0b5eedbc15e798e271e45ba89a7792` [`docs/provenance/LOCKED_DIGEST.txt`].
- **Image manifest digest:** `sha256:7f333973f5a76d7707116c401b13200d4ea18fd5168995c3c312dfa068bfd2e3` [`TARGET_DIGEST.txt`].
- **Upstream:** Wiki.js 3.4.0 built from source at `3.4.0` of https://github.com/requarks/wiki — upstream notes: https://github.com/requarks/wiki/releases/tag/3.4.0 [`docs/provenance/BUILD_RECIPE.json`].
- **Base image:** `ubuntu:24.04`; runtime user `wiki`.
- **Build:** `source-rebuild-node`, built offline with `--network=none`.
- **Supersedes:** ReadyStack release `3.4.0-CE-ubuntu24.04-r1`.

## What changed in this release

- Upstream version unchanged (3.4.0); ReadyStack rebuild.
- Minimum dependency versions ReadyStack enforces on top of upstream (raised only where upstream's own version was lower); shipped versions from the SBOM [`docs/sbom/SBOM.json`]:
  - `fast-uri` at least `4.1.4` (shipped: `4.1.4`)
  - `undici` at least `7.30.1` (shipped: `7.30.1`)
- Wiki.js 3.4.0 is unchanged from the release this supersedes (3.4.0-CE-ubuntu24.04-r1); this release rebuilds it. Changes: libssh-4 moves from 0.10.6-2ubuntu0.5 to 0.10.6-2ubuntu0.6 (USN-9187-1). Settings, ports and data volumes are those of 3.4.0-CE-ubuntu24.04-r1: replace the container with this image on the same volumes.

## Security status at release (measured 2026-11-25)

- **Docker Scout:** 0 fixable critical/high vulnerabilities; runs as `wiki` (non-root); SBOM + provenance attestations present (SPDX SBOM + SLSA v1) [`docs/provenance/SCOUT_VERDICT.json`].
- **OSV cross-check:** no fixable critical/high vulnerability beyond Docker Scout's findings.
- **Signature:** cosign signature verified by ReadyStack's release gate before publishing; check it yourself with `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/wikijs:3.4.0-CE-ubuntu24.04-r2` (signatures are recorded in the public Sigstore transparency log).
- **ReadyStack release check at release:** passed (ReadyStack's own test, not a Docker Scout grade). Vulnerabilities are disclosed every day and the image never changes, so it is re-checked daily, beside Docker Scout's own dated grade, at https://readystack.dev/queue.

## Reproducibility

Rebuilds offline from this archive to the identical image digest `sha256:7f333973f5a76d7707116c401b13200d4ea18fd5168995c3c312dfa068bfd2e3`: run `./BUILD_OFFLINE.sh`, then `./VERIFY_OFFLINE.sh` (add `--online` to confirm the Docker Hub tag holds the same digest). Before publishing, ReadyStack rebuilt the kit with `./BUILD_OFFLINE.sh` and compared the result with the published digest [`docs/provenance/REPRO_VERIFICATION.json`], then ran `./BUILD_OFFLINE.sh` and `./VERIFY_OFFLINE.sh` from this archive (without `--online`).

## Validation

- 4 of 4 use cases passed (19 authored, 4 kept in the suite; 15 not exercised, see below) against the running image [`docs/validation/test-results.json`].
- 15 further authored checks were not exercised and are not counted above: 15 needed credentials the build's check does not have (listed under Not exercised in `docs/validation/FAILED_TESTS.md`).

## Known issues

- **high** (ReadyStack package): CVE-2026-123158 in openssh-client 1:9.6p1-3ubuntu13.20 is on CISA's Known Exploited Vulnerabilities list — CVE-2026-123158 (https://alpinelinux.org/posts/2026-11-05-openssh-password-authentication-bypass/) [`RSD-wikijs-070f1e7655`] (carried from `3.2.0-CE-ubuntu24.04-r1`, recorded there as `RSD-wikijs-f15aba2d58`)
- **low** (ReadyStack package): Docker Hub README: The Hub README's source-changes line names only the version stamp and omits the six overrides the label and handbooks list. [`RSD-wikijs-fc52c9e920`] (carried from `3.2.0-CE-ubuntu24.04-r1`, recorded there as `RSD-wikijs-9380d1922a`)
- **low** (ReadyStack package): The image refuses to start without ADMIN_PASS, although Wiki.js uses it only on the first start against an empty database [`RSD-wikijs-2291eba5ad`] (carried from `3.0.0-beta.685-CE-ubuntu24.04-r1`, recorded there as `RSD-wikijs-9d0079c960`)

## Defects fixed

- 27 problems found before release and fixed before it shipped (27 by review); each is listed in `docs/defects/defects.json`.

## Verify this archive

```
sha256sum -c CHECKSUMS.sha256
./BUILD_OFFLINE.sh && ./VERIFY_OFFLINE.sh --online
cosign verify --key https://readystack.dev/keys/cosign.pub readystack/wikijs:3.4.0-CE-ubuntu24.04-r2
```

ReadyStack records every signature in the public Sigstore transparency log (Rekor), so the command needs no extra flags.

