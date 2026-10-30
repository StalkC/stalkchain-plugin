#!/usr/bin/env bash
# The ChatGPT upload: the plugin as an Agent Plugins archive.
# mcp.json goes in unchanged: the ChatGPT app drops a server that carries an `extensions` block and finds the
# StalkChain sign-in on its own from the server's OAuth discovery.
set -euo pipefail
cd "$(dirname "$0")/.."
out="${1:-dist/stalkchain-chatgpt.zip}"
tmp="$(mktemp -d)"
git archive HEAD plugin.json mcp.json skills agents assets/icon.png assets/logo.png README.md LICENSE | tar -x -C "$tmp"
mkdir -p "$(dirname "$out")"
rm -f "$out"
(cd "$tmp" && zip -qr - .) > "$out"
rm -rf "$tmp"
echo "$out"
