#!/usr/bin/env bash

set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

"$repo_dir/tests/basic.sh"

check_invalid_arguments() {
  local description=$1
  shift

  local output
  local status

  set +e
  output="$("$repo_dir/bin/greet" "$@" 2>&1)"
  status=$?
  set -e

  if (( status != 64 )); then
    printf '%s: ожидался код 64, получен %s\n' "$description" "$status" >&2
    exit 1
  fi

  if [[ $output != 'Usage: greet NAME' ]]; then
    printf '%s: неожиданное сообщение: %s\n' "$description" "$output" >&2
    exit 1
  fi
}

check_invalid_arguments 'Имя не передано'
check_invalid_arguments 'Передано пустое имя' ''
check_invalid_arguments 'Передано несколько имён' Alice Bob

printf 'Полный набор сценариев успешно проверен.\n'
