# Roadmap

This roadmap describes proof dependencies, not release dates.

NixWitness is early-stage. Milestones may be revised through public issues and pull requests as implementation evidence improves.

## Milestone 0: public foundation

- open-source license;
- contribution, governance, conduct, and security policies;
- public/private development model;
- issue and pull-request templates;
- public-safety and repository checks;
- architecture and roadmap documents.

Acceptance:

```text
repository checks pass
policies are internally consistent
no private implementation or operational material is exposed
```

## Milestone 1: deterministic planning kernel

- typed subjects, claims, nodes, evidence classes, and authority classes;
- graph and claim validation;
- canonical graph revision;
- dependency-cycle detection;
- path-trigger selection;
- required, triggered, recommended, and manual sets;
- minimum dependency closure;
- synthetic public conformance fixtures.

Acceptance examples:

- documentation changes select only cheap verification;
- storage-sensitive changes select candidate and boot-contract evidence;
- manual and live evidence cannot be required automatically;
- declaration order does not change graph identity.

## Milestone 2: Nix and workspace observation

- Git and workspace provenance;
- scoped dirty-content fingerprints;
- `flake.lock` identity;
- Nix version and platform;
- selected installable identity;
- candidate and current-system identity where applicable.

Acceptance examples:

- identical declared premises produce identical fingerprints;
- unrelated changes do not invalidate narrow evidence;
- a declared lock-file change invalidates Nix-derived evidence;
- live evidence is bound to exact system identity.

## Milestone 3: observations and witnesses

- append-only local observation store;
- content-addressed output artifacts;
- witness admission against declared claims and premises;
- reusable, stale, red, blocked, unknown, inconclusive, and manual-required projections;
- `status` and `explain` interfaces.

Acceptance examples:

- unchanged inputs reuse applicable evidence;
- changed premises mark a witness stale rather than failed;
- failed prerequisites block dependents without running them;
- state rebuilds deterministically from canonical observations.

## Milestone 4: bounded local execution

- process and Nix effect adapters;
- explicit environment;
- timeout and cancellation;
- bounded output;
- process-tree termination;
- repository-mutation detection;
- duplicate-execution prevention.

Acceptance examples:

- timed-out descendants do not survive;
- selected nodes execute once;
- repository mutation is detected;
- authority ceilings are enforced at execution time.

## Milestone 5: Nix-native declarations and real consumers

- Nix library for verification declarations;
- public-safe package and NixOS examples;
- at least two distinct real repositories consuming the same portable contracts;
- redacted aggregate findings only.

Acceptance:

- Nix evaluates declarations into the normalized graph;
- public examples are understandable without private infrastructure;
- common behavior is extracted only after multiple consumers prove it useful.

## Milestone 6: read-only agent interfaces

- inspect, plan, status, explain, graph, and evidence retrieval;
- explicit repository and subject scope;
- capability identity and maximum authority;
- expected graph and input fingerprints;
- audit observations for tool calls.

Activation and promotion remain excluded until a separate authority design is reviewed and proven.

## First public release

The first tagged release requires:

- a coherent CLI and schema;
- complete public documentation;
- deterministic demonstration;
- public CI proof;
- security review of execution and input handling;
- explicit compatibility policy;
- no reliance on private history or inaccessible fixtures.
