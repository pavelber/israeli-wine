---
name: israeli-wine
description: Answer questions about Israeli wine, Israeli wineries, Israeli wine regions, grapes grown in Israel, local or revived Levantine varieties, kosher Israeli wine, orange wine in Israel, Israeli wine recommendations, Vivino ratings for Israeli wine, wine bars in Tel Aviv, and wine travel in Israel. Use when the user asks about Israeli wine, Israel wine regions, Golan Heights wine, Galilee wine, Judean Hills wine, Negev wine, Tzora/Tsora, Castel, Yarden, Recanati, Carmel, Marawi/Hamdani, Dabouki, Argaman, or Israeli wine pairings.
---

# Israeli Wine

## Quick Start

When answering an Israeli wine question:

1. Identify whether the request needs static knowledge, live data, or both.
2. Read the relevant reference files listed below before answering.
3. Distinguish stable wine knowledge from changing market data.
4. For ratings, prices, wine bars, availability, vintages, travel hours, or "right now" claims, use the dynamic lookup workflow and cite sources with retrieval date.
5. When live lookup is unavailable, say so clearly and give a best-effort static answer without inventing exact ratings, prices, opening hours, or availability.

## Reference Files

- `regions.md`: Israeli wine regions, sub-zones, climate, soils, and region-to-variety guidance.
- `grapes.md`: Important international, Mediterranean, local, revived, and Israeli-developed grape varieties.
- `wineries.md`: Major wineries, boutique producers, orange wine producers, Tzora details, and producer style notes.
- `pairings.md`: Israeli and Middle Eastern food pairings, picnic guidance, and style-based recommendations.
- `history-travel.md`: Modern Israeli wine history, travel routing, Tel Aviv wine bar handling, and itinerary logic.
- `dynamic-lookups.md`: Vivino, retailer, winery, critic, and web-search workflow for changing facts.
- `web-resources.md`: Curated Israeli wine directories, official winery websites, retailer/rating sources, and Tel Aviv wine-bar resources.

## Static vs Dynamic Decision Rules

Use static references only for:

- Regions, climate, soils, grape suitability, wine history, broad producer reputation, pairings, and style education.

Use dynamic lookup for:

- Vivino ratings, review counts, prices, availability, current vintages, "best right now", Tel Aviv wine bars, tasting room hours, current orange wine releases, and budget recommendations tied to a shekel limit.

Use both for:

- Recommendations, ranked lists, travel plans, bottle shopping, "under 100 shekels", "cheap but good", "best wines of a winery", and comparisons that should include specific current bottles.

## Answer Style

- Lead with a direct recommendation or conclusion.
- Explain the regional or stylistic logic briefly.
- For bottle lists, include producer, wine name, region, style, why it fits, and dynamic data when available.
- If using live data, include source links and retrieval date.
- Avoid overclaiming. Say "usually", "often", or "verify current vintage" when the fact changes by vintage or retailer.
- Include spelling variants when useful: Tzora/Tsora, Marawi/Hamdani/Jandali, Galil/Galilee, Judean Hills/Harei Yehuda.

## Quality Bar

A good answer should improve on a generic model by adding:

- Region-specific reasoning rather than generic "Israel is warm".
- Producer-specific examples rather than broad categories.
- Local context: Hebrew/English naming variants, kosher relevance when useful, Israeli retail price ranges in ILS, and travel logistics.
- Clear separation between durable reference knowledge and live market facts.
