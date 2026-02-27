#!/usr/bin/env bash
# encode-fonts.sh — Download and base64-encode font files for embedding in theme CSS
#
# Downloads .woff2 files from source repos and outputs base64 strings.
# Used to regenerate the embedded font data in src/00_foundations/_fonts.scss.
#
# Usage: ./scripts/encode-fonts.sh [output_dir]
#   output_dir: Directory for .woff2 and .b64 files (default: /tmp/velocighostino-fonts)
#
# Font sources (all SIL OFL 1.1):
#   iA Writer Quattro/Mono: https://github.com/iaolo/iA-Fonts
#   Atkinson Hyperlegible Next: https://github.com/googlefonts/atkinson-hyperlegible-next

set -euo pipefail

OUTDIR="${1:-/tmp/velocighostino-fonts}"
IA_BASE="https://raw.githubusercontent.com/iaolo/iA-Fonts/master"
ATKINSON_BASE="https://raw.githubusercontent.com/googlefonts/atkinson-hyperlegible-next/main/fonts/webfonts"

# Font file definitions: local_name -> remote_url
declare -A FONTS=(
  # iA Writer Quattro (Body Text)
  ["iAWriterQuattroS-Regular"]="${IA_BASE}/iA%20Writer%20Quattro/Webfonts/iAWriterQuattroS-Regular.woff2"
  ["iAWriterQuattroS-Italic"]="${IA_BASE}/iA%20Writer%20Quattro/Webfonts/iAWriterQuattroS-Italic.woff2"
  ["iAWriterQuattroS-Bold"]="${IA_BASE}/iA%20Writer%20Quattro/Webfonts/iAWriterQuattroS-Bold.woff2"
  ["iAWriterQuattroS-BoldItalic"]="${IA_BASE}/iA%20Writer%20Quattro/Webfonts/iAWriterQuattroS-BoldItalic.woff2"
  # iA Writer Mono (Code)
  ["iAWriterMonoS-Regular"]="${IA_BASE}/iA%20Writer%20Mono/Webfonts/iAWriterMonoS-Regular.woff2"
  ["iAWriterMonoS-Italic"]="${IA_BASE}/iA%20Writer%20Mono/Webfonts/iAWriterMonoS-Italic.woff2"
  ["iAWriterMonoS-Bold"]="${IA_BASE}/iA%20Writer%20Mono/Webfonts/iAWriterMonoS-Bold.woff2"
  ["iAWriterMonoS-BoldItalic"]="${IA_BASE}/iA%20Writer%20Mono/Webfonts/iAWriterMonoS-BoldItalic.woff2"
  # Atkinson Hyperlegible Next (UI)
  ["AtkinsonHyperlegibleNext-Regular"]="${ATKINSON_BASE}/AtkinsonHyperlegibleNext-Regular.woff2"
  ["AtkinsonHyperlegibleNext-Italic"]="${ATKINSON_BASE}/AtkinsonHyperlegibleNext-Italic.woff2"
  ["AtkinsonHyperlegibleNext-Bold"]="${ATKINSON_BASE}/AtkinsonHyperlegibleNext-Bold.woff2"
  ["AtkinsonHyperlegibleNext-BoldItalic"]="${ATKINSON_BASE}/AtkinsonHyperlegibleNext-BoldItalic.woff2"
)

mkdir -p "$OUTDIR"
echo "Downloading ${#FONTS[@]} font files to ${OUTDIR}..."

for name in "${!FONTS[@]}"; do
  url="${FONTS[$name]}"
  woff2_file="${OUTDIR}/${name}.woff2"
  b64_file="${OUTDIR}/${name}.b64"

  echo "  Downloading ${name}.woff2..."
  curl -sL -o "$woff2_file" "$url"

  # Verify wOF2 magic bytes
  magic=$(head -c4 "$woff2_file")
  if [[ "$magic" != "wOF2" ]]; then
    echo "ERROR: ${name}.woff2 is not a valid woff2 file (magic: ${magic})" >&2
    exit 1
  fi

  # Base64 encode (single line, no wrapping)
  base64 -w0 "$woff2_file" > "$b64_file"
  echo "  Encoded ${name}.b64 ($(wc -c < "$b64_file") chars)"
done

echo ""
echo "Done. Raw font size: $(du -ch "$OUTDIR"/*.woff2 | tail -1 | cut -f1)"
echo "Base64 files ready in: ${OUTDIR}/"
echo ""
echo "To update _fonts.scss, paste the base64 strings as url() fallbacks:"
echo '  url("data:font/woff2;base64,...") format("woff2")'
