# Security Policy

## Supported versions

NixWitness has not published a stable release.

| Version | Supported |
| --- | --- |
| `main` | Best effort during early development |
| Unreleased branches and forks | No support commitment |

Security-sensitive behavior, including execution, host observation, evidence admission, and agent interfaces, may change before the first stable release.

## Reporting a vulnerability

Do not open a public issue containing vulnerability details.

Use GitHub's private vulnerability-reporting feature from the repository's **Security** tab. Include:

- the affected commit or version;
- the security boundary involved;
- a minimal reproduction;
- expected and observed behavior;
- potential impact;
- any suggested mitigation.

If private vulnerability reporting is unavailable, open a minimal public issue asking the maintainer to establish a private contact channel. Do not include exploit details, credentials, private paths, or affected host information.

## Response process

The maintainers will:

1. acknowledge a report when it is received;
2. reproduce and classify the issue where possible;
3. define a remediation and disclosure plan;
4. publish a fix and advisory when appropriate;
5. credit reporters unless anonymity is requested.

No response-time guarantee is offered during early development.

## Security boundary

NixWitness is intended to keep activation, promotion, unrestricted privilege, and arbitrary remote execution outside its default authority. A report showing that these boundaries can be bypassed is considered high priority.
