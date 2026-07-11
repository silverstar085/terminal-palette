#!/bin/bash
# Terminal Palette — installs all 20 themes into macOS Terminal.app.
# The five textured themes get their background textures wired up
# automatically (copied to ~/Pictures/Terminal Textures).
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
THEMES="$DIR/themes"
DEST="$HOME/Pictures/Terminal Textures"

# Textured themes and their background images.
# (macOS ships bash 3.2, so no associative arrays.)
texture_for() {
  case "$1" in
    "Rag Paper")       echo "rag-paper.png" ;;
    "Irish Linen")     echo "irish-linen.png" ;;
    "Raw Canvas")      echo "raw-canvas.png" ;;
    "Charcoal Sketch") echo "charcoal-sketch.png" ;;
    "Indigo Denim")    echo "indigo-denim.png" ;;
    *)                 echo "" ;;
  esac
}

mkdir -p "$DEST"
cp "$DIR/textures/"*.png "$DEST/"

TMP="$(mktemp -d)"
for f in "$THEMES"/*.terminal; do
  name="$(basename "$f" .terminal)"
  tex="$(texture_for "$name")"
  if [[ -n "$tex" ]]; then
    # Textured theme: point it at the copied texture, then import.
    cp "$f" "$TMP/$name.terminal"
    plutil -replace BackgroundImagePath -string "$DEST/$tex" \
      "$TMP/$name.terminal" 2>/dev/null || \
    plutil -insert BackgroundImagePath -string "$DEST/$tex" \
      "$TMP/$name.terminal"
    open "$TMP/$name.terminal"
  else
    open "$f"
  fi
  sleep 0.4
done

echo
echo "Done — all 20 themes imported."
echo "Pick a default: Terminal > Settings (⌘,) > Profiles > select a theme > Default."
echo
echo "If a textured theme shows a flat color (newer macOS ignores the path key),"
echo "attach its texture once: Terminal > Settings > Profiles > [theme] >"
echo "Background 'Color & Effects' > Image > Choose > $DEST"
