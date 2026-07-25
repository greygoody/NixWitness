# Architecture

## Product boundary

NixWitness is an evidence-guided verification runtime for Nix projects and NixOS systems.

The core question is not merely whether a command passed. It is:

> Which claims matter for this change, which witnesses currently support them, which witnesses became stale, and what is the minimum bounded work needed next?

## Core concepts

### Subject

A Nix artifact or system being verified, such as a package, development shell, flake check, Home Manager configuration, or NixOS system.

### Claim

A durable property whose meaning should survive changes in the command used to verify it.

Examples:

```text
candidate-builds
service-contract-holds
storage-identity-preserved
remote-access-preserved
physical-display-accepted
```

### Verification node

A declared method for producing evidence. A node may include dependencies, path triggers, evidence class, selection policy, authority class, estimated cost, timeout, and an effect specification.

### Observation

A raw fact returned by a bounded execution adapter. Observations should be append-only and retain the exact input identity, executor identity, outcome, timing, and artifacts needed for later admission.

### Witness

An admitted observation that supports or refutes a declared claim under explicit premises. A witness remains reusable only while those premises remain applicable.

## Separate lifecycle and verdict

Lifecycle and verdict are different dimensions.

```text
Lifecycle: declared -> resolved -> evaluated -> built -> activated -> observed
Verdict:   unknown | green | red | blocked | stale | inconclusive | manual-required
```

This prevents conclusions such as treating a successful build as deployment evidence or treating activation as proof of health.

## Evidence classes

The initial model distinguishes:

```text
static
contract
vm
candidate
live
manual
```

Mutation is not an evidence class. Activation and promotion require separate authority.

## Authority classes

The intended authority order is:

```text
pure
read-workspace
evaluate-nix
build-nix
observe-host
mutate-temporary
activate
promote
```

Early automatic execution must stop before activation and promotion. Public tools and annotations do not weaken that boundary.

## Kernel and adapters

The deterministic kernel should own:

- graph validation;
- canonical graph identity;
- verification planning;
- witness applicability;
- state projection;
- explanation of selection, reuse, blocking, and invalidation.

Execution adapters should own bounded external effects and return observations. They must not manufacture kernel state transitions.

```text
kernel command
    -> bounded adapter effect
    -> recorded observation
    -> admission
    -> deterministic projection
```

## Canonical facts and projections

Append-only observations and content-addressed artifacts are intended to be canonical facts.

Plans, status documents, reports, and agent checkpoints are projections. They should be reproducible and disposable.

## Non-goals

NixWitness is not:

- a deployment orchestrator;
- a privilege broker;
- a generic CI service;
- a universal task or workflow engine;
- a replacement for Nix evaluation and existing test mechanisms;
- a source of physical acceptance that was never observed.
