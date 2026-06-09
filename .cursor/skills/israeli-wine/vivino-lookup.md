# Vivino Lookup Workflow

Use this file whenever you need a live Vivino rating for an Israeli wine. The workflow below works in any agent environment that can fetch URLs (Cursor, Windsurf, Codex, Claude, etc.). It does not require login, API keys, or browser automation.

## How It Works

Vivino serves a server-rendered HTML page for every wine at:

```
https://www.vivino.com/en/{slug}/w/{wine_id}
```

That page contains a JSON-LD `Product` block with `aggregateRating.ratingValue`. When you fetch the page, the rating also appears as a plain number in the text immediately after the wine name heading, making it readable even if JSON-LD is stripped.

## Language Note

Vivino indexes all wines in English. If the user asked in Hebrew or Russian, translate the wine and winery name to English before running any step below, using the translation tables in `multilingual.md`. Return the rating result in the user's language.

Examples:
- Hebrew: יקב פלם קלאסיקו → search `Flam Classico`
- Russian: Цора Мисти Хиллс → search `Tzora Misty Hills`

## Step-by-Step Lookup

### Step 0 — Normalize the wine name

Before any fetch, resolve what wine the user actually means. Do not pass the raw user input directly to the search — it may be misspelled, abbreviated, or in Hebrew/Russian.

**0a. Resolve language.** If the user wrote in Hebrew or Russian, translate the winery and wine name to English using `multilingual.md`. Example: יקב פלם קלאסיקו → `Flam Classico`.

**0b. Check the Known Wines table first.** Scan the table below for a fuzzy match — the user's term does not have to be exact. Common aliases that map to table entries:

| User may write | Canonical name for lookup |
|---|---|
| Misty Hills, Misty, ערפלי | Tzora Misty Hills |
| Shoresh, Shoresh Blanc, שורש | Tzora Shoresh Blanc |
| Tsora, Tzorah | Tzora (any Tzora wine) |
| Grand Vin, Castel Rouge, קסטל גרנד | Domaine du Castel Grand Vin Rouge |
| Blanc du Castel, C Blanc, קסטל לבן | Domaine du Castel Blanc du Castel |
| Petit Castel, פטי קסטל | Domaine du Castel Petit Castel |
| Katzrin, Katzrin Red, קצרין | Golan Heights Winery Yarden Katzrin |
| Noble, Flam Noble, נובל | Flam Noble |
| Classico, קלאסיקו | Flam Classico |
| Yatir, Forest, יתיר | Yatir Winery Forest |
| Yiron, יירון | Galil Mountain Winery Yiron |
| Mediterranean, מדיטרניאן | Carmel Mediterranean |
| Sphera White, Sphera Signature | Sphera White Signature |
| Ayalon, Clos de Gat Red | Clos de Gat Ayalon Valley |

**0c. Fix common spelling errors** before passing to the Vivino search:

| Common misspelling | Correct |
|---|---|
| Recanti, Recanatti | Recanati |
| Tzora Misty Hill (no s) | Tzora Misty Hills |
| Castel Grand Vin Blanc | Blanc du Castel |
| Yarden Katzrin Rouge / Red | Yarden Katzrin |
| Yateer, Yattir | Yatir |
| Flam Classico Blanc | Flam Blanc (separate wine) |
| Galil Mountain Yiron | Galil Mountain Winery Yiron |
| Dalton Reserver | Dalton Reserve |
| Margallit | Margalit |
| Tspora, Sfera | Sphera |

**0d. Resolve partial or informal names** using winery knowledge:

| If user says | Try this canonical search term |
|---|---|
| "the Castel red" | `Domaine du Castel Grand Vin Rouge` |
| "Castel white" / "white Castel" | `Domaine du Castel Blanc du Castel` |
| "Tzora flagship" | `Tzora Misty Hills` |
| "Yarden flagship" / "Katzrin" | `Yarden Katzrin` |
| "Yatir top wine" | `Yatir Forest` |
| "Flam top red" | `Flam Noble` |
| "Recanati local variety" | `Recanati Marawi` |
| winery name only (e.g. "Sphera") | search winery name on Vivino, pick the top-rated result |

If after normalization you are still uncertain which specific wine is meant, ask the user to clarify before fetching.

### Step 1 — Get the wine URL

**Option A — Wine is in the Known Wines table below.**
Use the URL directly. Skip to Step 2.

**Option B — Wine is not in the table.**
Fetch this URL (replace spaces with `+`):

```
https://www.vivino.com/search/wines?q={wine+name}
```

In the returned HTML, look for links matching the pattern `/en/{slug}/w/{wine_id}`. The first matching link is the wine page URL. Construct:

```
https://www.vivino.com/en/{slug}/w/{wine_id}
```

### Step 2 — Fetch the wine page

Fetch the URL from Step 1.

In the response, find the `aggregateRating` block:

```json
"aggregateRating": {
  "@type": "AggregateRating",
  "ratingValue": "4.3",
  "bestRating": "5",
  "worstRating": "1"
}
```

Or read the plain-text rating — it appears as a standalone number (e.g. `4.3`) on the line immediately after the `# Wine Name` heading and before the text `count ratings`.

### Step 3 — Report the result

State the rating, the Vivino URL, and today's date as the retrieval date. Example:

> Flam Classico: **4.1 / 5** on Vivino (retrieved 2026-06-09).
> Source: https://www.vivino.com/en/il-flam-classico/w/1203472

If neither the JSON-LD block nor the plain-text rating is present, the page may have changed format. Fall back to the web search approach in `dynamic-lookups.md`.

---

## Known Wines Table

Pre-seeded from experiment on 2026-06-09. Use these URLs directly in Step 2 — no search needed.

| Wine | Vivino URL | Rating (snapshot) |
|---|---|---|
| Tzora Vineyards Misty Hills | https://www.vivino.com/en/tzora-misty-hills/w/1235687 | 4.3 |
| Tzora Vineyards Shoresh Blanc | https://www.vivino.com/en/tzora-shoresh-blanc/w/1219021 | 4.2 |
| Tzora Judean Hills Red | https://www.vivino.com/en/tzora-judean-hills-red/w/1311432 | — |
| Tzora Judean Hills Blanc | https://www.vivino.com/en/tzora-judean-hills-blanc/w/1506978 | — |
| Domaine du Castel Grand Vin Rouge | https://www.vivino.com/en/domaine-du-castel-grand-vin-rouge/w/1208380 | 4.4 |
| Domaine du Castel Blanc du Castel | https://www.vivino.com/en/domaine-du-castel-blanc-du-castel/w/1452016 | 4.2 |
| Domaine du Castel Petit Castel | https://www.vivino.com/en/domaine-du-castel-petit-castel/w/1652627 | — |
| Domaine du Castel Rosé du Castel | https://www.vivino.com/en/domaine-du-castel-rose-du-castel/w/5068053 | — |
| Flam Noble | https://www.vivino.com/en/il-flam-noble/w/1430924 | 4.4 |
| Flam Classico | https://www.vivino.com/en/il-flam-classico/w/1203472 | 4.1 |
| Yatir Winery Forest | https://www.vivino.com/en/yatir-winery-forest/w/80051 | 4.4 |
| Golan Heights Winery Yarden Katzrin | https://www.vivino.com/en/golan-heights-winery-yarden-katzrin/w/1151275 | 4.5 |
| Clos de Gat Chardonnay | https://www.vivino.com/en/clos-de-gat-chardonnay/w/1226924 | 4.2 |
| Clos de Gat Ayalon Valley | https://www.vivino.com/en/clos-de-gat-ayalon-valley/w/1205513 | — |
| Sphera White Signature | https://www.vivino.com/en/sphera-white-signature/w/2345377 | 4.2 |
| Galil Mountain Winery Yiron | https://www.vivino.com/en/galil-mountain-winery-yqb-hry-glyl-yiron/w/82824 | 4.3 |
| Carmel Mediterranean | https://www.vivino.com/en/il-carmel-carmel-mediterranean/w/1117535 | 4.1 |

Snapshot ratings are from 2026-06-09. Always fetch live to confirm — ratings shift as new reviews accumulate.

---

## Failure Modes and Fallbacks

| Symptom | Cause | Action |
|---|---|---|
| Search page returns no `/en/.../w/` links | Wine not indexed, misspelled, or search term too vague | Re-run Step 0 normalization, then try a shorter term (e.g. `Katzrin` instead of `Yarden Katzrin Red`) or the winery name alone |
| Wine page returns non-200 | Rare redirect or Vivino URL change | Try search again to re-discover slug |
| Page fetched but no rating number visible | Layout change or JS-only render | Fall back to web search: `vivino "wine name" rating` |
| Rating present but seems wrong | Search returned wrong wine | Check wine name and winery in the page match the query |

---

## Notes

- **Review count**: Vivino does not consistently include review count in JSON-LD. Do not report a review count unless you can read it clearly from the page.
- **Vintage**: The wine page shows the overall wine rating across vintages, not a per-vintage score. For vintage-specific scores, search `vivino "{wine name}" {year}`.
- **Prices**: Vivino sometimes shows a price range on the wine page. Report it if present, with currency and retrieval date. Do not present it as an Israeli retail price — it reflects the Vivino marketplace in the user's detected region.
- **Snapshot column**: The rating column in the Known Wines table is a starting reference only. Always fetch live when the user asks for a current rating.
