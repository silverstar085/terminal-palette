#!/bin/bash
# Terminal Palette — imports all 15 themes into macOS Terminal.app.
# Safe to re-run: profiles that already exist are skipped.
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
THEMES="$DIR/themes"

# Snapshot current Terminal profiles so re-runs don't create duplicates.
TMP="$(mktemp -d)"
defaults export com.apple.Terminal "$TMP/prefs.plist" 2>/dev/null || true
has_profile() {
  [[ -s "$TMP/prefs.plist" ]] && /usr/libexec/PlistBuddy \
    -c "Print \":Window Settings:$1\"" "$TMP/prefs.plist" >/dev/null 2>&1
}

imported=0
for f in "$THEMES"/*.terminal; do
  name="$(basename "$f" .terminal)"
  if has_profile "$name"; then
    echo "Already installed: $name"
  else
    open "$f"
    imported=$((imported+1))
    sleep 0.4
  fi
done

echo
echo "Done — $imported profile(s) imported."
echo "Pick a default: Terminal > Settings (⌘,) > Profiles > select a theme > Default."
