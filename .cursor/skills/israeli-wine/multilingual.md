# Multilingual Guide — Hebrew, English, Russian

This skill serves users in Hebrew, English, and Russian. Follow the rules in this file for all three languages.

---

## Response Language Rule

**Always respond in the language the user wrote in.** If the user writes in Hebrew, answer in Hebrew. If in Russian, answer in Russian. If in English, answer in English. Mixed-language questions (e.g. Hebrew text with English wine names) get a Hebrew-primary answer with English wine names preserved as-is.

Do not switch languages mid-answer unless the user requests it.

---

## Name Translation for Lookups

Vivino, Wine-Searcher, and most web sources index wines in **English**. When the user asks in Hebrew or Russian, translate the wine or winery name to English before running any lookup, then return the answer in the user's language.

### Hebrew → English

| Hebrew | English | Notes |
|---|---|---|
| יקב קסטל / דומן דו קסטל | Domaine du Castel | |
| יקב צורה / יקבי צורה | Tzora Vineyards | also spelled Tsora |
| יקבי גולן | Golan Heights Winery | |
| ירדן | Yarden | sub-label of Golan Heights Winery |
| גמלא | Gamla | sub-label of Golan Heights Winery |
| חרמון | Hermon | sub-label of Golan Heights Winery |
| יקב רקנאטי | Recanati Winery | |
| יקב כרמל / יקבי כרמל | Carmel Winery | |
| יקב יתיר | Yatir Winery | |
| יקב פלם | Flam Winery | |
| קלו דה גא | Clos de Gat | |
| ספרה | Sphera Winery | |
| דלתון | Dalton Winery | |
| טוליפ | Tulip Winery | |
| ויטקין | Vitkin Winery | |
| ביניימינה | Binyamina Winery | |
| הרי גליל / גליל מאונטיין | Galil Mountain Winery | |
| מרגלית | Margalit Winery | |
| פלטר | Pelter Winery | |
| ברקן | Barkan Winery | |
| מיסטי הילס / ערפילי הגבעות | Misty Hills | Tzora flagship red |
| שורש | Shoresh | Tzora single-vineyard |
| יין קצרין | Katzrin | Yarden flagship |
| מראווי / המדני / ג'נדלי | Marawi | also Hamdani or Jandali |
| קריניאן | Carignan | |
| ארגמן | Argaman | Israeli-bred red variety |
| דבוקי | Dabouki | local white variety |
| יין כתום | orange wine | |

### Russian → English

| Russian | English | Notes |
|---|---|---|
| Кастель | Castel | Domaine du Castel |
| Цора / Тзора | Tzora | Tzora Vineyards |
| Ярден | Yarden | |
| Гамла / Gamla | Gamla | |
| Хермон | Hermon | |
| Голанские высоты (яков) | Golan Heights Winery | |
| Реканати | Recanati | |
| Кармель | Carmel | |
| Ятир | Yatir | |
| Флам | Flam | |
| Клоз де Га / Клод Гат | Clos de Gat | |
| Сфера | Sphera | |
| Далтон | Dalton | |
| Тулип | Tulip | |
| Виткин | Vitkin | |
| Биньямина | Binyamina | |
| Маргалит | Margalit | |
| Пелтер | Pelter | |
| Барkan / Баркан | Barkan | |
| Мистик Хиллс / Мисти Хиллс | Misty Hills | |
| Мараwи / Марауи | Marawi | |
| Кацрин | Katzrin | |
| кошерное вино | kosher wine | |
| оранжевое вино | orange wine | |

---

## Core Vocabulary by Language

### Wine Types

| English | Hebrew | Russian |
|---|---|---|
| red wine | יין אדום | красное вино |
| white wine | יין לבן | белое вино |
| rosé | יין רוזה | розовое вино |
| orange wine | יין כתום | оранжевое вино |
| sparkling wine | יין מבעבע | игристое вино |
| kosher wine | יין כשר | кошерное вино |
| mevushal | מבושל | мевушаль |
| dry | יבש | сухое |
| sweet | מתוק | сладкое |

### Regions

| English | Hebrew | Russian |
|---|---|---|
| Judean Hills | הרי יהודה | Иудейские горы |
| Golan Heights | רמת הגולן | Голанские высоты |
| Galilee / Upper Galilee | גליל / גליל עליון | Галилея / Верхняя Галилея |
| Negev | נגב | Негев |
| Shomron / Samaria | שומרון | Самария / Шомрон |
| Samson / Shimshon | שמשון | Самсон / Шимшон |

### Key Concepts

| English | Hebrew | Russian |
|---|---|---|
| winery | יקב | винодельня |
| vineyard | כרם | виноградник |
| grape | ענב | виноград |
| vintage year | בציר | урожай / винтаж |
| rating | דירוג | рейтинг / оценка |
| price | מחיר | цена |
| recommendation | המלצה | рекомендация |
| tasting room | חדר טעימות | дегустационный зал |
| wine bar | בר יין | винный бар |
| pairing | שידוך / תיאום | сочетание с едой |
| Passover | פסח | Пасха (еврейская) |
| Shabbat | שבת | Шаббат |
| Shemita year | שמיטה | год Шмиты |

### Common Question Patterns

**Hebrew questions this skill should recognise:**

- `יין ישראלי טוב` — good Israeli wine
- `מה עדיף לשתות` — what's better to drink
- `המלצה על יין` — wine recommendation
- `יין עד 100 שקל` — wine under 100 shekels
- `יין לשבת / לפסח` — wine for Shabbat / Passover
- `איפה לקנות יין` — where to buy wine
- `בר יין בתל אביב` — wine bar in Tel Aviv
- `ביקור ביקב` — winery visit
- `יין כשר` — kosher wine
- `יין כתום ישראלי` — Israeli orange wine
- `הדירוג בוויוינו` — Vivino rating

**Russian questions this skill should recognise:**

- `израильское вино` — Israeli wine
- `какое израильское вино выбрать` — which Israeli wine to choose
- `лучшее вино из Израиля` — best wine from Israel
- `кошерное вино` — kosher wine
- `вино до [цена] шекелей` — wine under X shekels
- `рейтинг на Vivino` — Vivino rating
- `где купить израильское вино` — where to buy Israeli wine
- `винный бар в Тель-Авиве` — wine bar in Tel Aviv
- `посетить винодельню` — visit a winery
- `оранжевое вино` — orange wine

---

## Search and Lookup Language Rules

### For Vivino lookup
Always use the **English wine name** regardless of user language. Use the translation tables above. The Vivino URL structure is always English (`/en/{slug}/w/{id}`). Return the result translated back into the user's language.

### For Hebrew-language web search
Israeli retail prices, wine bars, and winery hours are best found in Hebrew. Use these search patterns:
- Price: `"[wine name in Hebrew]" מחיר` or `[English name] מחיר ישראל`
- Wine bars: `בר יין תל אביב 2026` or `"[bar name]" תל אביב פתוח`
- Winery visits: `"[winery name]" שעות פתיחה` or `"[winery name]" טעימות`
- Under-budget: `יין ישראלי עד 100 שקל`, `יין טוב עד 150 שקל`

### For Russian-language web search
Most Israeli wine information is not in Russian. Search in English or Hebrew and translate the result. Exception: some Israeli winery sites have Russian pages for the Russian-speaking Israeli market.
- Use English search for Vivino, Wine-Searcher, and winery facts
- Use Hebrew search for Israeli retail prices and local wine bars
- Translate the answer back into Russian

### For English-language web search
Use the patterns in `dynamic-lookups.md` and `web-resources.md` directly.

---

## Answer Format Notes

### Hebrew answers
- Use right-to-left flow in prose; wine names and URLs stay in Latin script
- Use ILS (₪) for prices
- Use Hebrew region names where natural: הרי יהודה, רמת הגולן, גליל
- Include both Hebrew and English winery name on first mention: **יקב צורה (Tzora Vineyards)**
- For lists of wines, keep wine names in English/transliteration — they are proper nouns

### Russian answers
- Use Russian region names: Иудейские горы, Голанские высоты, Галилея
- Include both Russian transliteration and English name on first mention: **Цора (Tzora Vineyards)**
- Wine names: use Russian transliteration followed by English in parentheses on first mention
- Prices: give in ILS (шекели / ₪) for Israeli context, or local currency for export questions
- Kosher context: explain мевушаль vs не-мевушаль briefly if relevant

### English answers
- Follow the standard Answer Style in SKILL.md
