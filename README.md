# NixWitness

[![Repository checks](https://github.com/greygoody/NixWitness/actions/workflows/repository.yml/badge.svg)](https://github.com/greygoody/NixWitness/actions/workflows/repository.yml)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-early%20development-orange.svg)](docs/roadmap.md)

Evidence-guided verification for Nix projects and NixOS systems.

NixWitness determines which checks matter for a change, reuses evidence whose declared premises still match, invalidates stale evidence precisely, and explains the smallest bounded verification work needed next.

## Status

NixWitness is in early development. The public contracts, command-line interface, and compatibility policy are not stable yet, and no production-readiness claim is made.

The repository is being established as a serious open-source project. Portable behavior will arrive through focused, reviewable pull requests with executable tests and public-safe examples.

## The problem

A successful command is not universal proof. Its result is useful only for the exact subject, inputs, environment, and claim it actually verified.

NixWitness is intended to answer:

> Given a changed Nix project or NixOS system, which claims matter now, which prior witnesses remain applicable, which became stale, and what is the minimum bounded work needed to restore confidence?

The intended flow is:

```text
changed inputs
    -> affected claims
    -> minimum verification frontier
    -> bounded checks
    -> append-only observations
    -> admitted witnesses
    -> reusable, stale, blocked, or manual-required state
```

## Intended boundary

NixWitness will:

- model subjects, claims, verification nodes, evidence classes, and authority classes;
- select a deterministic dependency-aware verification frontier;
- bind observations to exact resolved inputs;
- distinguish lifecycle from verdict;
- reuse evidence only while declared premises remain applicable;
- explain selection, reuse, blocking, and invalidation;
- provide public-safe CLI and read-only agent interfaces.

NixWitness will not:

- replace Nix evaluation, `nix flake check`, NixOS tests, or deployment tools;
- treat a passing command as proof of unrelated claims;
- silently activate or promote NixOS generations;
- provide unrestricted root, shell, Docker, or deployment authority;
- become a generic workflow engine.

See [Architecture](docs/architecture.md) for the product boundary and core terms.

## Development model

This public repository is the canonical home for public releases, public interfaces, issues, and community contributions.

A separate private proving environment may be used for host-specific experiments, operational evidence, and candidate portable changes. Nothing is copied into this repository automatically. Every projected change must arrive as a normal public pull request with coherent commits, public-safe fixtures, executable proof, and a reviewable explanation of its behavior.

Once behavior is public, public history and accepted community work are preserved. Private experimentation must adapt to public `main`; it must not overwrite or silently replace public contributions.

See [Development model](docs/development-model.md) for the complete flow.

## Contributing

Contributions are welcome. Start with [CONTRIBUTING.md](CONTRIBUTING.md), particularly for changes that affect schemas, authority boundaries, evidence semantics, or public interfaces.

Useful first contributions during the foundation phase include:

- documentation corrections;
- public-safe conformance examples;
- design review on the verification model;
- portability and reproducibility improvements;
- narrowly scoped implementation work tied to an accepted issue.

## Security

Do not report suspected vulnerabilities in public issues. Follow [SECURITY.md](SECURITY.md).

## Governance

NixWitness currently uses maintainer-led governance with public design discussion and reviewable decisions. See [GOVERNANCE.md](GOVERNANCE.md).

## License

Licensed under the [Apache License 2.0](LICENSE).
