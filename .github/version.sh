#!/usr/bin/env bash

set -euo pipefail

source_file="$(dirname "$0")/../turboada.c"

read_version_field() {
  local field_name="$1" value
  value=$(sed -n "s/^#define TURBOADA_VERSION_${field_name}[[:space:]]\{1,\}\([0-9]\{1,\}\).*/\1/p" \
          "$source_file" | head -1)
  if [[ -z $value ]]; then
    echo "error: TURBOADA_VERSION_${field_name} not found in turboada.c" >&2
    exit 1
  fi
  printf '%s' "$value"
}

major=$(read_version_field MAJOR)
minor=$(read_version_field MINOR)

case "${1:-string}" in
  string) printf '%d.%d\n' "$major" "$minor" ;;
  number) printf '%d\n' $((major * 100 + minor)) ;;
  *) echo "usage: version.sh [string|number]" >&2; exit 2 ;;
esac
