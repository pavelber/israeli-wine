#!/usr/bin/env bash
# Refreshes data/wineries-grape-man.json from grape-man.com API.
# Run from any directory; saves relative to this script's location.
# Requirements: curl, python3

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT="$SCRIPT_DIR/wineries-grape-man.json"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

URL="https://grape-man.com/showarticlesbytags.html"
BASE="tags=%5B%5D&tpl=minipage-single-for-imgindex&start=0&parents=46&limit=500"

do_fetch() {
  local where="$1" out="$2"
  curl -s \
    -H 'accept: */*' \
    -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'origin: https://grape-man.com' \
    -H 'referer: https://grape-man.com/%D7%99%D7%A7%D7%91%D7%99-%D7%99%D7%A9%D7%A8%D7%90%D7%9C/' \
    -H 'x-requested-with: XMLHttpRequest' \
    -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36' \
    --data-raw "${BASE}&extrawhere=${where}" \
    "$URL" > "$out"
}

echo "Fetching all wineries..."
do_fetch '%7B%7D' "$TMP_DIR/all.html"

declare -A REGION_QUERIES=(
  ["Golan Heights"]='%7B%22yekev_area_select%22%3A%22%D7%A8%D7%9E%D7%AA+%D7%94%D7%92%D7%95%D7%9C%D7%9F%22%7D'
  ["Galilee"]='%7B%22yekev_area_select%22%3A%22%D7%92%D7%9C%D7%99%D7%9C+%D7%95%D7%94%D7%A2%D7%9E%D7%A7%D7%99%D7%9D%22%7D'
  ["Carmel"]='%7B%22yekev_area_select%22%3A%22%D7%9B%D7%A8%D7%9E%D7%9C+%D7%95%D7%9E%D7%99%D7%A9%D7%95%D7%A8+%D7%94%D7%97%D7%95%D7%A3%22%7D'
  ["Judean Hills"]='%7B%22yekev_area_select%22%3A%22%D7%99%D7%95%D7%90%D7%91+%D7%99%D7%94%D7%95%D7%93%D7%94%22%7D'
  ["Judea & Samaria"]='%7B%22yekev_area_select%22%3A%22%D7%99%D7%94%D7%95%D7%93%D7%94+%D7%95%D7%A9%D7%95%D7%9E%D7%A8%D7%95%D7%9F%22%7D'
  ["Negev"]='%7B%22yekev_area_select%22%3A%22%D7%A0%D7%92%D7%91+%D7%95%D7%94%D7%A2%D7%A8%D7%91%D7%94%22%7D'
)

for region in "${!REGION_QUERIES[@]}"; do
  echo "Fetching $region..."
  safe_name="${region// /_}"
  safe_name="${safe_name//&/and}"
  do_fetch "${REGION_QUERIES[$region]}" "$TMP_DIR/region_${safe_name}.html"
done

echo "Fetching kosher list..."
do_fetch '%7B%22kosher%22%3A%22%D7%9B%D7%9F%22%7D' "$TMP_DIR/kosher.html"

echo "Parsing and building JSON..."
TMP_DIR_PY="$TMP_DIR" OUT_PY="$OUT" python3 << 'PYEOF'
import re, json, os, sys
from datetime import date

tmp = os.environ.get("TMP_DIR_PY")
out = os.environ.get("OUT_PY")

def parse_html(path):
    with open(path, encoding="utf-8") as f:
        content = f.read()
    blocks = re.split(r'(?=<div class="mini-page-port-auto txt33 slice">)', content)
    results = []
    for block in blocks:
        nm = re.search(r'mini-page-title[^>]*>\s*(.+?)\s*</div>', block)
        hm = re.search(r'<a href="([^"]+)"', block)
        im = re.search(r'background: url\(([^)]+)\)', block)
        if nm and hm:
            results.append({
                "name": nm.group(1).strip(),
                "url":  "https://grape-man.com/" + hm.group(1).strip(),
                "logo": "https://grape-man.com" + im.group(1).strip() if im else "",
            })
    return results

all_w = parse_html(os.path.join(tmp, "all.html"))
print(f"Total: {len(all_w)}", file=sys.stderr)

region_sets = {}
for fname in os.listdir(tmp):
    if fname.startswith("region_"):
        label = fname[len("region_"):-len(".html")].replace("_", " ").replace("and", "&")
        entries = parse_html(os.path.join(tmp, fname))
        region_sets[label] = {e["name"] for e in entries}
        print(f"  {label}: {len(entries)}", file=sys.stderr)

kosher_set = {e["name"] for e in parse_html(os.path.join(tmp, "kosher.html"))}
print(f"Kosher: {len(kosher_set)}", file=sys.stderr)

wineries = []
for w in all_w:
    name = w["name"]
    region = "Unknown"
    for r, names in region_sets.items():
        if name in names:
            region = r
            break
    wineries.append({
        "name":   name,
        "url":    w["url"],
        "logo":   w["logo"],
        "region": region,
        "kosher": name in kosher_set,
        "active": "לא פעיל" not in name,
    })

output = {"fetched_at": str(date.today()), "count": len(wineries), "wineries": wineries}
with open(out, "w", encoding="utf-8") as f:
    json.dump(output, f, ensure_ascii=False, indent=2)
print(f"Saved {len(wineries)} wineries to {out}", file=sys.stderr)
PYEOF
