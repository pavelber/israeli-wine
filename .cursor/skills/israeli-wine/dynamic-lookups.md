# Dynamic Lookup Workflow

Use this file for changing facts: Vivino ratings, review counts, prices, availability, vintages, current wine bars, winery hours, tasting bookings, critic scores, and "right now" questions.

## When Dynamic Lookup Is Required

Use live lookup when the user asks for:

- Vivino ratings, Vivino prices, current review counts, "highly rated on Vivino".
- Current prices in ILS, budgets such as "under 100 shekels", "cheap", "best value".
- Current availability, where to buy, export availability.
- Wine bars in Tel Aviv or current restaurant/wine-shop recommendations.
- Winery opening hours, tasting-room availability, appointments, travel logistics.
- Current orange wine releases and natural-wine bottlings.
- "Best right now", "today", "current", "latest", "recent scores".

When dynamic lookup is unavailable or fails, fall back to the price-snapshot.md reference ranges and vintage guidance in vintages.md, and say clearly that the data is reference-level rather than live.

## Source Priority

Use multiple sources when possible, especially for recommendations with price or availability claims.

1. Winery official site: producer facts, current releases, blend and vintage notes, tasting room details.
2. Vivino: consumer rating, review count, price where available, popular bottlings.
3. Israeli retailers: real ILS prices and stock status.
4. Wine-Searcher or international retailers: export availability and global pricing.
5. Israeli critic sources: Adam Montefiore, Yahel Barak / Ha'aretz, Terravino competition, Israeli Wine Awards.
6. International critics: Decanter, Wine Advocate, Jancis Robinson, Wine Spectator.
7. Google Maps, TripAdvisor, Time Out Tel Aviv, Haaretz food section: current wine bars, hours, reviews, neighbourhood context.

## Web Search Workflow

The web search approach below works across any environment that supports searching the web. Use the search queries listed; do not rely on any specific tool name or API.

### Step 1: Vivino ratings and consumer scores

**Use `vivino-lookup.md` for this step.** It provides a faster, more reliable method: fetching Vivino wine pages directly by URL (no search engine needed, no login, works in any agent environment). The Known Wines table there covers ~17 key Israeli wines with pre-seeded URLs.

Only fall back to a web search for Vivino if the direct-fetch method in `vivino-lookup.md` fails:

```
vivino "Tzora Misty Hills" rating
site:vivino.com "Castel Grand Vin"
```

### Step 2: Israeli retail prices

Search in English and Hebrew:

```
"Recanati Marawi" price Israel 2026
"Tzora Shoresh Blanc" מחיר
"Yarden Katzrin" מחיר ישראל
יין ישראלי עד 100 שקל מראווי
site:.co.il "Flam Noble"
```

Fetch Israeli retailer or winery-direct pages to get current ILS shelf prices. Always note the retailer name and retrieval date.

### Step 3: International availability and export prices

```
site:wine-searcher.com "Tzora Misty Hills"
site:wine-searcher.com "Castel Grand Vin"
wine-searcher Recanati Marawi Israel
```

Or navigate to: https://www.wine-searcher.com/find/[wine+name+here]

Note that Wine-Searcher prices reflect international export markets, not Israeli shelf prices. Do not present them as ILS retail.

### Step 4: Critic scores and awards

```
Adam Montefiore "Tzora Misty Hills" 2020
adammontefiore.com Israeli wine vintage 2020
Terravino 2024 results Israeli wine awards
"Wine Spectator" Israel Castel Grand Vin
Decanter Israel Yarden Katzrin
```

See the Israeli Critics section below for source URLs and guidance.

### Step 5: Tel Aviv wine bars

```
"wine bar" "Tel Aviv" site:timeout.com
"wine bar" Tel Aviv 2026 best
"בר יין" "תל אביב" site:timeout.co.il
Brut Tel Aviv wine bar open 2026
Basta wine bar Tel Aviv
```

Fetch Time Out Tel Aviv, Google Maps snippets, or official venue pages. Check for recent reviews confirming the venue is open and wine-focused. Record retrieval date and categorise each as: true wine bar / restaurant with strong wine list / wine shop and tasting venue.

### Step 6: Winery hours and travel

```
[winery name] tasting room hours appointment 2026
site:[winery official URL] visit
[winery name] פתוח שעות פתיחה
```

Always note: many Israeli boutique wineries require advance appointments; do not assume walk-in availability.

## Israeli Critics And Award Sources

These are more stable than Vivino consumer scores and useful as quality anchors.

### Adam Montefiore

- URL: https://adammontefiore.com
- The most prominent English-language Israeli wine writer. Covers annual vintage reports, leading producer profiles, variety guides, and the four-decades history of the Israeli wine scene.
- Search: `site:adammontefiore.com [winery or wine name]`
- Search: `Adam Montefiore Israeli wine vintage [year]`
- Key pages: /israeli-wine (overview), /israels-grape-varieties (variety guide), /four-decades-advancing-israeli-wine (history)

### Yahel Barak / Ha'aretz Food Section

- Israeli Hebrew wine writing; search: `"יהל ברק" יין ישראלי` or `"haaretz" "Israeli wine" [winery name]`

### Terravino Wine Competition

- Annual Israeli wine competition; results published each year.
- Search: `Terravino [year] results` or `Terravino competition Israeli wine gold medal`

### Israeli Wine Awards / Other Competitions

- Search: `"Israeli Wine Awards" [year]` or `"תחרות יין" ישראל [year]`

### International Critics

- Wine Spectator: search `"Wine Spectator" Israel [wine name]`
- Decanter: search `Decanter Israel [winery name]`
- Wine Advocate / Robert Parker: search `"Wine Advocate" Israel [winery name]`
- Jancis Robinson: search `site:jancisrobinson.com Israel [winery name]`

## Data To Capture For Any Live Result

For each bottle or venue, capture:

- Producer and wine name
- Vintage if shown
- Region and country
- Average rating and number of ratings (Vivino) or critic score and publication (critics)
- Price and currency (be explicit: ILS shelf / USD export / EUR export)
- Source URL and name
- Retrieval date

## Tel Aviv Wine Bar Lookup Workflow

For "best wine bars in Tel Aviv right now":

1. Search current web results (see Step 5 above).
2. Fetch at least one current local-media source (Time Out Tel Aviv) and one venue page per candidate.
3. Exclude venues that appear closed or where recent reviews suggest the wine focus has declined.
4. Categorise each: true wine bar / restaurant with strong wine list / wine shop and tasting venue.
5. Include neighbourhood, why it is worth visiting, reservation requirement, and retrieval date.

## Winery Hours And Travel Verification

- Verify tasting-room hours and appointment requirements from official winery pages.
- Mention Shabbat and Jewish holiday closures for kosher wineries — see kosher.md.
- Verify driving distances with maps when giving a concrete itinerary.
- For current travel and security context, advise checking local travel guidance.

## Answer Format For Dynamic Results

```
Dynamic data checked: [source names], retrieved [date].

| Wine / venue | Region | Why it fits | Live data | Source |
|---|---|---|---|---|
| Producer Wine | Judean Hills | Short reason | Rating X.X (N ratings), price Y ILS | URL |

Notes: prices and availability change by retailer and vintage.
```

If tables are too bulky, use bullets with the same fields.

## Uncertainty Rules

- Never invent exact Vivino ratings or prices.
- If only a rating is found without a review count, say the review count was not available.
- If a price is from an international retailer, do not present it as an Israeli shelf price.
- If a bottle is over budget in some shops and under budget in others, state the range.
- If live lookup fails, fall back to price-snapshot.md ranges and say clearly: "Reference range from our price snapshot; current price not verified."
- If a critic score is found, say which critic, which publication, which vintage, and when published.

## Note On The aptash/vivino-api Scraper

As of 2026-06-09, the aptash/vivino-api Node.js scraper is confirmed broken. Vivino changed their URL structure from `/search/wines?q=...` to `/en/explore?...` and updated their DOM selectors. Do not spend agent steps attempting to run this tool; use the web search workflow above instead.
