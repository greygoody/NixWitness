#!/usr/bin/env bash
set -euo pipefail

fail=0

report_matches() {
    local description="$1"
    local pattern="$2"

    if git grep -nI -E "$pattern" -- \
        ':!scripts/check-public-boundary.sh' \
        ':!LICENSE' \
        ':!.github/workflows/repository.yml'
    then
        printf '\npublic-boundary violation: %s\n' "$description" >&2
        fail=1
    fi
}

tracked_risky_paths="$(
    git ls-files | grep -E '(^|/)(\.env($|\.)|id_(rsa|ed25519)($|\.)|credentials($|\.)|secrets?($|\.)|.*\.(pem|key|p12|pfx))$' || true
)"

if [[ -n "$tracked_risky_paths" ]]; then
    printf 'public-boundary violation: risky tracked file names\n%s\n' "$tracked_risky_paths" >&2
    fail=1
fi

report_matches "private key material" 'BEGIN (OPENSSH|RSA|EC|DSA) PRIVATE KEY'
report_matches "GitHub credential-shaped value" '(ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,})'
report_matches "OpenAI credential-shaped value" 'sk-(proj-)?[A-Za-z0-9_-]{20,}'
report_matches "absolute home-directory path" '(/home/[^ /]+/|/Users/[^ /]+/)'
report_matches "common private IPv4 address" '(^|[^0-9])(10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|192\.168\.[0-9]{1,3}\.[0-9]{1,3}|172\.(1[6-9]|2[0-9]|3[01])\.[0-9]{1,3}\.[0-9]{1,3})([^0-9]|$)'

if [[ "$fail" -ne 0 ]]; then
    exit 1
fi

printf 'public boundary checks passed\n'
