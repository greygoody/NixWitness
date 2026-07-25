# Contributing to NixWitness

Thank you for helping build NixWitness.

NixWitness is early-stage systems software. Small implementation choices can change evidence semantics, authority boundaries, or what the project appears to prove. Contributions should therefore be narrow, testable, and explicit about their limits.

## Start with an issue

Open or join an issue before substantial work, especially when a change affects:

- public schemas or command-line interfaces;
- claim, observation, witness, or verdict semantics;
- authority classes or execution behavior;
- persistence formats;
- Nix evaluation or host inspection;
- agent or MCP interfaces.

Documentation corrections, test improvements, and tightly scoped fixes may go directly to a pull request.

## Development workflow

1. Fork the repository and create a focused branch.
2. Keep the change bounded to one behavioral outcome.
3. Add or update executable tests and public-safe fixtures.
4. Run the repository proof commands documented by the current codebase.
5. Open a pull request using the template.
6. Keep claims precise: report what was actually executed and what remains unverified.

Pull request titles should use a concise conventional prefix, such as:

```text
feat:
fix:
docs:
test:
refactor:
chore:
```

## Design expectations

A substantial change should state:

- the failure mode or evidence consumer that motivates it;
- the exact behavior being added or corrected;
- the authority ceiling required;
- the public contracts affected;
- the proof commands;
- what is deliberately deferred.

Prefer one vertical slice over broad scaffolding. A reusable abstraction should normally have at least two demonstrated consumers.

## Evidence and verification claims

Do not describe code as proven merely because it compiles or because a command returned success.

In pull requests, distinguish:

- portable repository proof;
- Nix evaluation or build proof;
- host-local observation;
- manual or physical acceptance;
- work not executed in the current environment.

Generated logs should be bounded and must not contain private paths, credentials, host identities, or operational data.

## AI-assisted contributions

AI-assisted development is welcome. The contributor remains responsible for every submitted line and claim.

When AI assistance is substantial:

- disclose it in the pull request;
- review generated code and documentation yourself;
- remove private prompts, transcripts, credentials, and unrelated generated text;
- run the declared proof commands;
- do not present generated explanations as execution evidence.

## Public safety

All repository content must be safe for public distribution.

Do not commit:

- credentials, tokens, private keys, cookies, or environment files;
- private host names, addresses, usernames, paths, or logs;
- customer, employer, or partner data;
- proprietary source material;
- generated artifacts containing sensitive metadata;
- content copied from a private proving environment without review and redaction.

The automated checks are a safety net, not permission to skip review.

## Commit quality

Commits should be coherent and reviewable. Avoid mixing formatting sweeps, generated files, and behavioral changes unless they are inseparable.

The project prefers squash merging for ordinary pull requests. Maintainers may preserve multiple commits when each commit is independently meaningful and tested.

## Licensing

By submitting a contribution, you agree that it may be distributed under the Apache License 2.0, as described in [LICENSE](LICENSE).

## Conduct

Participation is governed by [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).
