# Dynamic Lookup Workflow

Use this file for changing facts: Vivino ratings, review counts, prices, availability, vintages, current wine bars, winery hours, tasting bookings, critic scores, and "right now" questions.

## When Dynamic Lookup Is Required

Use live lookup when the user asks for:

- Vivino ratings, Vivino prices, current review counts, "highly rated on Vivino".
- Current prices in ILS, budgets such as "under 100 shekels", "cheap", "best value".
- Current availability, where to buy, export availability, current vintages.
- Wine bars in Tel Aviv or current restaurant/wine-shop recommendations.
- Winery opening hours, tasting-room availability, appointments, travel logistics.
- Current orange wine releases and natural-wine bottlings.
- "Best right now", "today", "current", "latest", "recent scores".

## Source Priority

Use multiple sources when possible, especially for recommendations with price or availability claims.

1. Winery official site or tech sheet: producer facts, current releases, blend/vintage composition, tasting room details.
2. Vivino: consumer rating, review count, price where available, bottle image, popular bottlings.
3. Israeli retailers: real ILS prices and stock status.
4. Wine-searcher or international retailers: export availability and global pricing.
5. Critic and publication sources: Decanter, Wine Advocate, Jancis Robinson, Wine Spectator, local Israeli wine writers.
6. Google Maps / TripAdvisor / Time Out / local food media: current wine bars, hours, reviews, neighborhood context.

## Vivino API

The user suggested `aptash/vivino-api` at https://github.com/aptash/vivino-api. Treat it as an unofficial, fragile helper, not a guaranteed public API.

Test result on 2026-06-09: the repo installed and ran, but the original `vivino.js` scraper returned an empty `{"vinos":[],"status":"FULL_DATA"}` result for both `Recanati Marawi` and the README's `malbec` example. Vivino still returned a populated page to Puppeteer, but redirected old `/search/wines?q=...` URLs to `/en/explore?...` and the old DOM selectors used by the script (`.card.card-lg`, `.wine-card__name`, `.average__number`, `.wine-price-value`) no longer matched. Treat the original script as broken unless it is updated for Vivino's current Explore page.

Expected capabilities from that repository:

- Node.js console app.
- Search by wine name.
- Parameters include country, state, minPrice, maxPrice, whether to include no-price items, rating count ranges, and average rating ranges.
- Outputs JSON with wine name, link, thumbnail, country, region, average rating, rating count, and price when available.

Use it if it still works in the environment. If it fails due to blocking, 403, endpoint changes, or missing data, say so and fall back to web search or retailer sources.

If repairing it, start by querying the current `/en/explore?search_term=...` page and extracting from current DOM/test IDs or embedded data rather than the old wine-card selectors. Confirm against a broad query such as `malbec` and an Israeli query such as `Tzora Misty Hills`.

### Vivino Query Guidance

Search in targeted ways:

- For producer questions: `Tzora Misty Hills`, `Tzora Shoresh`, `Castel Grand Vin`, `Yarden Cabernet Sauvignon`, `Recanati Marawi`.
- For category questions: `Israel Cabernet Sauvignon`, `Israeli Syrah`, `Israeli red wine`, `Israel Marawi`.
- For budget questions: combine Vivino with retailer checks, because Vivino prices may not reflect Israeli shelf prices.

### Data To Capture

For each bottle, capture:

- Producer
- Wine name
- Vintage if shown
- Region/country
- Average rating
- Number of ratings
- Price and currency, if available
- Link
- Retrieval date
- Source notes and uncertainty

## Israeli Retail Price Checks

For shekel budgets, prioritize Israeli sources. Search in English and Hebrew transliteration if needed.

Useful search patterns:

- `"Recanati Marawi price Israel"`
- `"רקנאטי מראווי מחיר"`
- `"Tzora Shoresh Blanc price Israel"`
- `"יין ישראלי עד 100 שקל מראווי"`
- `"site:.co.il Recanati Marawi"`

Potential retailer/source categories:

- Winery stores
- Israeli wine shops
- Supermarket wine pages
- Har HaCarmel / boutique Israeli wine shops
- Tishbi shop or equivalent producer shops
- Wine-searcher for international availability

Always mention price/date/source. If prices differ, give a range and say which retailers were checked.

## Tel Aviv Wine Bar Lookup

For "best wine bars in Tel Aviv right now":

1. Search current web results for Tel Aviv wine bars, with current year if useful.
2. Cross-check Google Maps or review snippets for open status and recent reviews.
3. Check local publications such as Time Out Tel Aviv, Haaretz food, Eater-style guides if available.
4. Exclude venues that appear closed or where recent reviews suggest the wine program is no longer central.
5. Categorize each recommendation:
   - true wine bar
   - restaurant with strong wine list
   - wine shop/tasting venue
6. Include neighborhood, why it is worth visiting, reservation note, and retrieval date.

## Winery Hours And Travel

For wine travel:

- Verify tasting-room hours and appointment requirements from official winery pages where possible.
- Mention Shabbat and Jewish holiday closures if relevant, especially for kosher wineries.
- For routes, verify driving distances with maps when giving a concrete itinerary.
- If live travel/security context matters, advise checking current local travel guidance.

## Answer Format For Dynamic Results

Use this compact format:

```markdown
Dynamic data checked: [source names], retrieved [date].

| Wine / venue | Region / area | Why it fits | Live data | Source |
|---|---|---|---|---|
| Producer Wine | Judean Hills | Short reason | Rating, review count, price | Link |

Notes: prices and availability change by retailer and vintage.
```

If tables are too bulky, use bullets with the same fields.

## Uncertainty Rules

- Never invent exact Vivino ratings or prices.
- If only a rating is found without review count, say that review count was not available.
- If price is from an international retailer, do not present it as an Israeli shelf price.
- If a bottle is over budget in some shops and under budget in others, state the range.
- If live lookup fails, explicitly separate "known from static reference" from "not verified live".
