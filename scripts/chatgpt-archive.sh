#!/usr/bin/env bash
# The ChatGPT upload: the plugin with OpenAI's OAuth declaration on the StalkChain server.
# mcp.json stays portable in the repo (Hermes rejects server-level extensions); ChatGPT needs it to connect the server.
set -euo pipefail
cd "$(dirname "$0")/.."
out="${1:-dist/stalkchain-chatgpt.zip}"
tmp="$(mktemp -d)"
git archive HEAD plugin.json mcp.json skills agents assets/icon.png assets/logo.png README.md LICENSE | tar -x -C "$tmp"
python3 - "$tmp/mcp.json" <<'PY'
import json, sys
p = sys.argv[1]
m = json.load(open(p))
m["mcpServers"]["stalkchain"]["extensions"] = {"com.openai": {"auth": {"type": "oauth", "client": {"mode": "dcr"}, "baseScopes": ["mcp"]}}}
json.dump(m, open(p, "w"), indent=2)
PY
mkdir -p "$(dirname "$out")"
rm -f "$out"
(cd "$tmp" && zip -qr - .) > "$out"
rm -rf "$tmp"
echo "$out"
