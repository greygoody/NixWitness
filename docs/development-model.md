# Development model

NixWitness uses a public-canonical development model with an additional private proving environment for sensitive or host-specific work.

## Authorities

### Public repository

The public repository is authoritative for:

- public source code and documentation;
- public schemas and interfaces;
- issues, pull requests, and design discussion;
- accepted community contributions;
- releases, tags, and compatibility statements;
- the public security and governance record.

### Private proving environment

A private proving environment may contain:

- host-specific adapters and graphs;
- operational evidence and logs;
- sensitive integration experiments;
- unfinished candidate implementations;
- confidential test inputs;
- private-side projection checks.

It is not a hidden replacement for public governance. A private change has no public authority until it passes through the public repository's normal review and proof process.

## Bootstrap phase

During early bootstrap, portable slices may be developed and proven privately before projection.

Each public projection must:

1. begin from current public `main`;
2. isolate one coherent portable behavior;
3. exclude private history, names, paths, identities, logs, and credentials;
4. include synthetic or explicitly public-safe fixtures;
5. provide public executable tests;
6. arrive through a normal public pull request;
7. state the behavior and limits without relying on inaccessible evidence;
8. preserve accepted public contributions.

Private proof may motivate confidence, but public acceptance must be possible from public artifacts.

## Clean projection procedure

For a candidate portable change:

```text
inspect private candidate
    -> identify public contract
    -> define public issue and acceptance witness
    -> create branch from public main
    -> copy or reimplement only reviewed portable files
    -> remove private-only assumptions
    -> run public-safety checks
    -> run public proof
    -> open public pull request
    -> review and merge normally
```

Do not:

- mirror the private repository wholesale;
- merge private commit history into the public repository;
- force-push public branches from private history;
- expose private issue numbers or host evidence as public proof;
- silently replace community changes with a private variant.

## Reverse synchronization

Before developing a candidate against behavior that already exists publicly, the private proving environment must import current public `main`.

Accepted public pull requests are inputs to future private integration work. Conflicts are resolved privately in favor of preserving the public contract unless a public proposal explicitly changes it.

## Transition after public V0

Private-first development should be temporary.

Once a coherent public V0 core exists:

- portable core development should normally happen public-first;
- the private environment should consume public revisions;
- private work should focus on sensitive adapters, host-specific proof, and bounded experiments;
- generally useful behavior discovered privately should return through focused public proposals.

This avoids maintaining two competing implementations and gives external contributors a real path to ownership.

## Commit policy

Public commits should be coherent and ordinary:

- one behavioral outcome per pull request;
- no private provenance in commit messages;
- no generated transcript or internal planning history;
- tests and documentation in the same change when they define the contract;
- squash merge by default unless multiple commits are independently meaningful.

## Projection record

A projected pull request should disclose that it was incubated in a private proving environment, but should not expose confidential repository names or evidence.

The pull request must report only proof that can be described safely and distinguish public portable proof from private operational testing.
