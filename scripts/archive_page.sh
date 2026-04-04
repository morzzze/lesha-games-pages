#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  ./scripts/archive_page.sh <game> [label]

Example:
  ./scripts/archive_page.sh airport-cracks-idle before-ui-update
EOF
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

if [ "$#" -lt 1 ]; then
  usage >&2
  exit 1
fi

GAME="$1"
LABEL="${2:-}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$ROOT/$GAME"
ARCHIVE_BASE="$ROOT/archive/$GAME"

if [ ! -d "$TARGET" ]; then
  echo "Published game not found: $TARGET" >&2
  exit 1
fi

shopt -s dotglob nullglob
ITEMS=("$TARGET"/*)
if [ "${#ITEMS[@]}" -eq 0 ]; then
  echo "Nothing to archive in $TARGET"
  exit 0
fi

STAMP="$(date +"%Y-%m-%d_%H-%M-%S")"
SAFE_LABEL="${LABEL// /-}"
SNAPSHOT="$ARCHIVE_BASE/$STAMP"
if [ -n "$SAFE_LABEL" ]; then
  SNAPSHOT+="__${SAFE_LABEL}"
fi

mkdir -p "$SNAPSHOT"
mv "$TARGET"/* "$SNAPSHOT"/
mkdir -p "$TARGET"

cat > "$SNAPSHOT/ARCHIVE_NOTE.txt" <<EOF
Archived published page: $GAME
Snapshot: $(basename "$SNAPSHOT")
Created at: $(date)
EOF

printf 'Archived web version %s -> %s\n' "$TARGET" "$SNAPSHOT"
