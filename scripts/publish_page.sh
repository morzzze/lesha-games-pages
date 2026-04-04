#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  ./scripts/publish_page.sh <game> <source-path> [label]

Examples:
  ./scripts/publish_page.sh airport-cracks-idle ../projects/html/airport-cracks-idle after-lesha-update
  ./scripts/publish_page.sh omon-goose-file /tmp/index.html quick-fix
EOF
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

if [ "$#" -lt 2 ]; then
  usage >&2
  exit 1
fi

GAME="$1"
SOURCE_PATH="$2"
LABEL="${3:-}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$ROOT/$GAME"
SOURCE_ABS="$(cd "$(dirname "$SOURCE_PATH")" && pwd)/$(basename "$SOURCE_PATH")"

if [ ! -e "$SOURCE_ABS" ]; then
  echo "Source path not found: $SOURCE_ABS" >&2
  exit 1
fi

mkdir -p "$TARGET"
if [ -n "$(find "$TARGET" -mindepth 1 -maxdepth 1 -print -quit 2>/dev/null)" ]; then
  "$ROOT/scripts/archive_page.sh" "$GAME" "$LABEL"
fi

mkdir -p "$TARGET"
rm -f "$TARGET/.gitkeep" 2>/dev/null || true

if [ -d "$SOURCE_ABS" ]; then
  cp -R "$SOURCE_ABS"/. "$TARGET"/
else
  cp "$SOURCE_ABS" "$TARGET/index.html"
fi

printf 'Published %s from %s\n' "$GAME" "$SOURCE_ABS"
