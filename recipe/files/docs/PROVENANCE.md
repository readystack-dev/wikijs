# Provenance — Wiki.js (`3.6.1-CE-ubuntu24.04-r1`)

Every item below is copied from a record in this archive; the record is named in brackets.

## Source

- Upstream repository: https://github.com/requarks/wiki
- Revision built: `3.6.1` (commit `ef6e6d5eb8913306f1d2916a99f7810ada94f042`)
- Source tree: `7399fe813a6da817a881e63340064d68c490091a695b719c620f2ccaeed32149` over 1549 files [`docs/provenance/SOURCE_TREE_HASH.json`]
- Community Edition only: enterprise code is removed or refused before the build (CE audit at acquire).

## Build

- Method: `source-rebuild-node`; base image `ubuntu:24.04`
- Built with `--network=none` from vendored source, dependencies and base images; BuildKit pinned to `moby/buildkit:v0.31.2` (shipped in `toolchain/`).
- SOURCE_DATE_EPOCH: `1795614473` [`SOURCE_DATE_EPOCH.txt`]
- Frozen inputs: [`docs/provenance/FREEZE_MANIFEST.json`], build recipe: [`docs/provenance/BUILD_RECIPE.json`].

## Output

- Published image: `readystack/wikijs:3.6.1-CE-ubuntu24.04-r1` — index digest `sha256:856417911023c24032ac87fb18a28c06fffa056580473780782d90ae76543d59` [`docs/provenance/LOCKED_DIGEST.txt`]
- linux/amd64 image digest `sha256:e7170ba1b3adfd033db94a8749377e9b428cc8b3b175fd470572c744ffa54f21` — reproduced from this archive before publishing [`docs/provenance/REPRO_VERIFICATION.json`].

## Attestations and signature

- SBOM + SLSA provenance attached to the image: attached: an SPDX SBOM and SLSA v1 provenance [`docs/provenance/SCOUT_VERDICT.json`]
- cosign signature by the ReadyStack release key: verified before publishing. Check it: `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/wikijs:3.6.1-CE-ubuntu24.04-r1`

## Pinned inputs, and why

- 16 pinned inputs, each with where it came from, why this one, how it was checked and when it was decided: `docs/PINS.md` [`docs/provenance/PINS.json`] (upstream source 2, base and build images 1, image digests 1, language runtimes and toolchains 1, dependency versions readystack sets 3, pins in the kit's dockerfiles 3, readystack's build engine 1, dependencies upstream chose 2, services the release checks run beside 2).

## Build trail

- How this release passed through the ReadyStack harness, record by record (every chain, drive, stage, review round, defect and check, each naming the record it is copied from): `ReadyStack-wikijs-3.6.1-CE-ubuntu24.04-r1.trail.json`, published beside this archive and signed with the release key (`ReadyStack-wikijs-3.6.1-CE-ubuntu24.04-r1.trail.json.sigstore`), and readable at https://readystack.dev/products/wikijs/trail/3.6.1-CE-ubuntu24.04-r1.

