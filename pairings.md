# Israeli Wine Pairings And Recommendation Logic

Use this file for food pairing, picnic wines, cheap-but-good recommendations, and style-based answer logic.

## Pairing Principles

- Israeli and Middle Eastern food often combines acid, herbs, tahini, smoke, pickles, spice, and grilled meat. Freshness matters more than raw power.
- Avoid high-alcohol, high-tannin reds with spicy salads, amba, zhug, harissa, or tomato-heavy dishes.
- Serve many Israeli reds slightly chilled, especially Carignan, Grenache, lighter Syrah, and Mediterranean blends.
- Dry rose is often the safest flexible pairing for outdoor meals, mezze, grilled vegetables, and casual food.
- For tahini, eggplant, and hummus, choose acidity and texture: Chenin Blanc, Sauvignon Blanc, dry rose, skin-contact white, or light red.

## Dish Pairings

### Shakshuka

- Food profile: tomato acidity, cooked peppers, eggs, cumin/paprika/chili, sometimes feta or merguez.
- Best wines: dry rose, Sauvignon Blanc, Chenin Blanc, light chilled Carignan, Grenache-based red, sparkling.
- Avoid: big oaky Cabernet and high-alcohol Syrah.
- Israeli examples: Recanati Rose, Galil Mountain Rose, Dalton Sauvignon Blanc, Vitkin Israeli Journey Red, Recanati Old Vine Carignan.

### Grilled Lamb

- Food profile: fat, smoke, herbs, garlic, char.
- Best wines: Syrah, Cabernet Sauvignon, old-vine Carignan, Petit Verdot blends, GSM/Mediterranean reds.
- Israeli examples: Tzora Misty Hills, Castel Grand Vin, Flam Noble, Yarden Syrah, Recanati Reserve Syrah, Yatir Forest, Dalton Reserve Syrah.
- Budget angle: Galil Mountain Yiron/Alon, Dalton Reserve red, Carmel Appellation, Vitkin Israeli Journey Red.

### Sabich

- Food profile: fried eggplant, hard-boiled egg, tahini, amba, pickles, parsley, tomato-cucumber salad.
- Best wines: dry rose, Sauvignon Blanc, Chenin Blanc, Marawi/Hamdani, light skin-contact white, chilled light red.
- Why: acidity handles eggplant oil and tahini; aromatic lift works with amba and pickles.
- Israeli examples: Recanati Marawi, Sphera white, Flam Blanc, Tzora Judean Hills White, Recanati Rose.

### Spicy Middle Eastern Salads

- Food profile: chili, vinegar/lemon, raw herbs, tomatoes, eggplant, peppers.
- Best wines: aromatic whites, dry or off-dry Gewurztraminer/Riesling/Muscat, Sauvignon Blanc, dry rose, sparkling, low-tannin chilled red.
- Avoid: tannic Cabernet, hot-climate Shiraz, heavily oaked whites.

### Hummus, Tahini, Falafel

- Best wines: Sauvignon Blanc, Chenin Blanc, Marawi, dry rose, light Carignan, sparkling.
- Reasoning: acidity and texture cut tahini; herbal notes complement parsley, cumin, and chickpea earthiness.

### Grilled Fish / Mediterranean Seafood

- Best wines: Sauvignon Blanc, Chardonnay from cool sites, Chenin Blanc, Sphera whites, Tzora Shoresh Blanc, Castel C Blanc du Castel, dry rose.
- For richer fish: lightly oaked Chardonnay or textured Chenin.

### Mezze / Picnic Spread

- Best wines: dry rose, Sauvignon Blanc, Chenin Blanc, Marawi, light chilled red, sparkling.
- Avoid: bottles that need decanting or warm serving precision.

## Cheap But Good Picnic Wine

For picnic recommendations, optimize for drinkability, price, availability, low fuss, and temperature tolerance. If the user gives a budget, verify current prices dynamically.

### Best Styles

- Dry rose: most versatile; works with salads, cheese, sandwiches, grilled vegetables, hummus.
- Crisp white: Sauvignon Blanc, Chenin Blanc, unoaked Chardonnay, Marawi.
- Light red chilled: Carignan, Grenache, Mediterranean blend, simple Syrah blend.
- Avoid: premium oaky Cabernet, very tannic reds, fragile aged bottles.

### Producers To Check

- Recanati: rose, Sauvignon Blanc, Marawi, Old Vine Carignan, entry and reserve labels.
- Galil Mountain: rose, Sauvignon Blanc, Alon/Yiron if budget allows.
- Dalton: Sauvignon Blanc, Canaan range, Reserve range.
- Vitkin: Israeli Journey, Carignan, Mediterranean whites.
- Carmel: Selected for cheapest; Appellation/Private Collection for better value.
- Tabor, Teperberg, Barkan, Segal: supermarket-friendly value wines; verify specific labels.
- Yarden/Golan Heights: higher quality but often above picnic budget.

### Budget Guidance In Israel

- 30-45 ILS: supermarket basic; acceptable but choose fresh whites/rose over heavy reds.
- 45-70 ILS: sweet spot for casual picnic value.
- 70-100 ILS: better producer-specific bottles and local identity wines.
- 100+ ILS: no longer "cheap"; only recommend if user wants a premium picnic bottle.

## Recommendation Templates

### If user asks "cheap but okay"

Answer with 3-5 bottles or styles, grouped by price. Prefer "check current shelf price" over pretending exact prices are stable.

### If user asks "best"

Ask or infer criterion: premium quality, value, available in Israel, exported, kosher, local variety, natural/orange, or restaurant list. If not specified, give balanced categories rather than a single absolute ranking.

### If user asks "under 100 shekels"

Use static knowledge to identify likely candidates, then dynamic lookup to confirm:

- Recanati Marawi
- Recanati Old Vine Carignan
- Vitkin Israeli Journey
- Galil Mountain Sauvignon Blanc or Rose
- Dalton Sauvignon Blanc or Reserve whites
- Carmel Appellation or Private Collection
- Jezreel Argaman or Mediterranean blends if available under budget

Always say prices vary by retailer and vintage.
