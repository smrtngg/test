#!/usr/bin/env bash

set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
actual="$("$repo_dir/bin/greet" Developer)"
expected='Hello, Developer!'

if [[ $actual != "$expected" ]]; then
  printf 'Ожидалось: %s\nПолучено: %s\n' "$expected" "$actual" >&2
  exit 1
fi

printf 'Базовый сценарий успешно проверен.\n'
