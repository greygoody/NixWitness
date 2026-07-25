# Governance

NixWitness currently uses maintainer-led governance with public design discussion and reviewable decisions.

## Roles

### Contributors

Anyone who participates through issues, documentation, code, testing, design review, or other project work.

### Reviewers

Contributors trusted to review changes in specific areas. Review authority may be informal during early development and becomes explicit as the project grows.

### Maintainers

Maintainers can merge changes, manage releases, moderate project spaces, and make final decisions when consensus is not reached.

The initial maintainer is [`@greygoody`](https://github.com/greygoody).

## Decision making

The project prefers rough consensus supported by executable evidence.

For routine changes, pull-request review is the decision record. For changes affecting public contracts, evidence semantics, authority boundaries, compatibility, or governance, maintainers should request an issue or architecture decision before implementation.

When consensus is not available, maintainers may make a decision after documenting:

- the alternatives considered;
- the evidence available;
- the selected boundary;
- the expected consequences;
- the conditions that could justify revisiting the decision.

## Maintainer responsibilities

Maintainers are expected to:

- apply contribution and conduct policies consistently;
- keep public claims aligned with executable evidence;
- protect contributor work and attribution;
- avoid exposing private operational information;
- disclose relevant conflicts of interest;
- keep releases and compatibility statements accurate;
- make security-sensitive decisions conservatively.

## Becoming a maintainer

Maintainer status may be offered after sustained, high-quality contributions that demonstrate:

- sound technical judgment;
- reliable review and follow-through;
- respect for project boundaries and contributors;
- familiarity with the verification and evidence model;
- willingness to maintain existing work, not only add new features.

## Public and private development

The public repository is canonical for public releases, interfaces, issue history, and accepted community work.

A private proving environment may test host-specific or sensitive scenarios. It does not grant private changes automatic authority over the public repository. See [docs/development-model.md](docs/development-model.md).

## Changes to governance

Governance changes require a public pull request and explicit maintainer approval.
