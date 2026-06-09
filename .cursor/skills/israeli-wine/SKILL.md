---
name: israeli-wine
description: >
  Answer questions about Israeli wine in Hebrew, English, or Russian.
  Use when the user asks about:
  Israeli wine, Israeli wineries, Israeli wine regions, grapes grown in Israel, local or revived Levantine varieties, kosher wine, orange wine, wine recommendations, Vivino ratings, wine bars in Tel Aviv, wine travel, or buying Israeli wine abroad.
  Also use for Hebrew queries: יין ישראלי, יקב, הרי יהודה, רמת הגולן, גליל, יין כשר, יין כתום, בר יין תל אביב, יין לשבת, יין לפסח, המלצה על יין, מחיר יין, ביקור ביקב, ויוינו דירוג, Tzora, Castel, Yarden, Recanati, Carmel, Flam, Marawi, Hamdani, Dabouki, Argaman.
  Also use for Russian queries: израильское вино, кошерное вино, оранжевое вино, Иудейские горы, Голанские высоты, Галилея, Негев, Цора, Кастель, Ярден, Реканати, Кармель, Флам, Ятир, рейтинг Vivino, винный бар Тель-Авив, посетить винодельню.
---

# Israeli Wine

## Quick Start

When answering an Israeli wine question:

1. **Detect the user's language** (Hebrew, English, or Russian) and respond in that language throughout. See multilingual.md for vocabulary, name translation, and answer format rules.
2. Identify whether the request needs static knowledge, live data, or both (see decision rules below).
3. Read the relevant reference files listed below before answering.
4. Distinguish stable wine knowledge from changing market data.
5. For ratings, prices, wine bars, availability, or "right now" claims: use vivino-lookup.md for Vivino ratings and dynamic-lookups.md for everything else. Cite sources with retrieval date.
6. When live lookup is unavailable, use price-snapshot.md for price ranges and vintages.md for vintage guidance, and state clearly that the data is reference-level rather than live.

## Reference Files

- `regions.md`: Israeli wine regions, sub-zones, climate, soils, and region-to-variety guidance.
- `grapes.md`: Important international, Mediterranean, local, revived, and Israeli-developed grape varieties.
- `wineries.md`: Major wineries, boutique producers, orange wine producers, vineyard details for top producers, Tzora details, and producer style notes.
- `pairings.md`: Israeli and Middle Eastern food pairings, holiday context (Passover Seder, Shabbat, Mangal/BBQ), picnic guidance, and style-based recommendations.
- `history-travel.md`: Modern Israeli wine history, travel routing, Tel Aviv wine bar handling, and itinerary logic.
- `vintages.md`: Israeli vintage chart 2013–2024, drinking windows, and buying guidance by region.
- `kosher.md`: Kosher wine guide — Mevushal vs non-Mevushal, Shemita years, producer kosher status, gift guidance, export context.
- `price-snapshot.md`: Reference ILS price ranges for ~30 key bottles, organised by tier, with a snapshot date.
- `export.md`: Israeli wine export markets (US, UK, Canada, EU, Australia), importers per country, which wines travel internationally, price premiums vs Israeli retail, finding bottles abroad, and bringing wine home from Israel.
- `vivino-lookup.md`: Step-by-step Vivino rating lookup using direct wine pages and JSON-LD. Works in any agent environment. Includes a Known Wines table with pre-seeded URLs for ~17 key Israeli wines.
- `dynamic-lookups.md`: Model-agnostic web search workflow for Israeli retail prices, Wine-Searcher, Israeli critics, Tel Aviv wine bars, and winery hours. For Vivino specifically, use vivino-lookup.md first.
- `web-resources.md`: Curated Israeli wine directories, official winery websites, retailer and rating sources, Tel Aviv wine-bar resources, and export/diaspora buying.
- `multilingual.md`: Response language rules, Hebrew↔English and Russian↔English name/term translation tables, vocabulary in all three languages, and search-term guidance for Hebrew and Russian queries.

## Static vs Dynamic Decision Rules

### Use static reference files only for:

- Regions, climate, soils, grape suitability, wine history, broad producer reputation, pairings, food context, style education.
- Vintage character guidance: use vintages.md.
- Kosher status and holiday context: use kosher.md.
- Order-of-magnitude price ranges: use price-snapshot.md with the caveat that prices are reference-level and need verification.

### Use dynamic lookup (web search) for:

- Vivino ratings, review counts, prices marked as current.
- Confirmed current ILS prices, budgets such as "under 100 shekels" with today's shelf price.
- Current availability, where to buy, which vintages are in stock.
- Tel Aviv wine bars open right now.
- Winery tasting-room hours, appointment availability.
- Current orange wine and natural-wine releases.
- "Best right now", "today", "current", "latest", "recent critic scores".

### Use both for:

- Recommendations and ranked lists: start with static producer/region logic, confirm price and availability dynamically.
- Travel plans and bottle shopping: use static winery knowledge, verify hours and routes.
- "Under 100 shekels" or "cheap but good": use price-snapshot.md as starting point, verify with web search.
- "Best wines of a winery": use static profile, verify current vintage and availability.
- Export and diaspora buying: use export.md for importer/market context, then verify specific bottle availability live with Wine-Searcher.

## Answer Style

- Lead with a direct recommendation or conclusion.
- Explain the regional or stylistic logic briefly.
- For bottle lists: include producer, wine name, region, style, why it fits, and dynamic data when available.
- For price answers: give the price-snapshot.md range with a "verify current" note.
- For vintage answers: give the vintages.md guidance with a "check current critic notes" note.
- If using live data: include source name, URL, and retrieval date.
- Avoid overclaiming. Say "usually", "often", or "verify current vintage" when the fact changes by vintage or retailer.
- Include spelling variants when useful: Tzora/Tsora, Marawi/Hamdani/Jandali, Galil/Galilee, Judean Hills/Harei Yehuda.

## Quality Bar

A good answer should improve on a generic model by adding:

- Region-specific reasoning: altitude, soils, sub-zones, producer anchors — not generic "Israel is warm".
- Producer-specific examples: correct bottles, key wines per producer, vineyard context for top six producers.
- Local context: Hebrew and English naming variants, kosher relevance when useful, Israeli retail price ranges in ILS (from price-snapshot.md), and travel logistics.
- Vintage guidance: use vintages.md to say which years to seek, not just "verify current vintage".
- Clear separation between durable reference knowledge and live market facts.
