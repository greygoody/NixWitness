#!/usr/bin/env bash
set -euo pipefail

required_files=(
    README.md
    LICENSE
    CONTRIBUTING.md
    CODE_OF_CONDUCT.md
    SECURITY.md
    GOVERNANCE.md
    CHANGELOG.md
    .editorconfig
    .github/CODEOWNERS
    .github/pull_request_template.md
    docs/architecture.md
    docs/development-model.md
    docs/roadmap.md
)

for path in "${required_files[@]}"; do
    if [[ ! -f "$path" ]]; then
        printf 'required repository file is missing: %s\n' "$path" >&2
        exit 1
    fi
done

while IFS= read -r script; do
    bash -n "$script"
done < <(git ls-files '*.sh')

if git grep -nI -E '[[:blank:]]+$' -- \
    ':!*.md' \
    ':!LICENSE'
then
    printf 'trailing whitespace detected\n' >&2
    exit 1
fi

bash scripts/check-public-boundary.sh

printf 'repository foundation checks passed\n'
