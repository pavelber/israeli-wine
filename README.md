# Israeli Wine Skill

A structured knowledge base and live-lookup workflow for Israeli wine, designed for AI agents. Works across Cursor, Windsurf, Claude, ChatGPT, Codex CLI, and any LLM that accepts a system prompt.

Answers questions about Israeli wine regions, wineries, grape varieties, kosher wine, pairings, vintage guidance, prices, Vivino ratings, Tel Aviv wine bars, and buying Israeli wine abroad — in **Hebrew, English, and Russian**.

---

## File Overview

| File | Purpose |
|---|---|
| `SKILL.md` | Entry point. Activation rules, reference file index, decision logic, answer style. |
| `regions.md` | Six regions: climate, soils, altitude, sub-zones, variety guidance. |
| `grapes.md` | International, Mediterranean, local, and revived Levantine varieties. |
| `wineries.md` | Leading producers with vineyard detail, key wines, and style notes. |
| `pairings.md` | Food pairings, holiday context (Shabbat, Passover, Mangal), picnic guidance. |
| `history-travel.md` | Modern wine history, winery travel routes, Tel Aviv wine bar handling. |
| `vintages.md` | Vintage chart 2013–2024, drinking windows, buying guidance. |
| `kosher.md` | Mevushal vs non-Mevushal, Shemita years, producer kosher status, gift guidance. |
| `price-snapshot.md` | ILS reference price ranges for ~30 key bottles (snapshot, needs periodic refresh). |
| `export.md` | Export markets: US, UK, Canada, EU, Australia — importers, price premiums, where to buy. |
| `vivino-lookup.md` | Live Vivino rating fetch via direct wine pages + JSON-LD. No login or API key needed. |
| `dynamic-lookups.md` | Web search workflows for prices, availability, critics, wine bars, winery hours. |
| `web-resources.md` | Curated URLs: winery sites, directories, retailers, rating sources, wine bars. |
| `multilingual.md` | Hebrew ↔ English ↔ Russian vocabulary, name tables, search translation rules. |
| `system-prompt-single-file.md` | All files merged into one — use for platforms that accept a single system prompt. |

---

## Installation by Platform

---

### Cursor

Cursor natively supports agent skills via `.cursor/skills/`.

1. Copy the `israeli-wine/` folder into `.cursor/skills/` at the root of your project (or your global Cursor skills directory).
2. The final path should be: `.cursor/skills/israeli-wine/SKILL.md`
3. No further configuration needed. Cursor reads the `SKILL.md` frontmatter (`name`, `description`) to decide when to activate the skill.

The skill activates automatically when you ask about Israeli wine in English, Hebrew (`יין ישראלי`, `יקב`), or Russian (`израильское вино`).

**Refresh:** Pull the latest files over the existing folder. No restart required.

---

### Windsurf

Windsurf supports project-level rules via `.windsurf/rules/` and global rules via Windsurf settings.

**Option A — Project rules (recommended for wine-focused projects):**

1. Create `.windsurf/rules/` in your project root if it does not exist.
2. Copy `system-prompt-single-file.md` into that folder and rename it `israeli-wine.md`.
3. Windsurf Cascade will include it as a project rule for all conversations in that project.

**Option B — Global rules (available in all projects):**

1. Open Windsurf → Settings → AI → Global Rules.
2. Paste the contents of `system-prompt-single-file.md` into the global rules field.
3. If the content is too long, paste only `SKILL.md` + `wineries.md` + `vivino-lookup.md` and note that full reference files are truncated.

**Option C — Memories:**

1. In a Windsurf conversation, say: *"Remember: when I ask about Israeli wine, use the following knowledge base"* and paste the contents of `system-prompt-single-file.md`.
2. Windsurf will save it as a persistent memory.

---

### Claude Desktop

Claude Desktop supports **Projects** with persistent file-based knowledge.

1. Open Claude Desktop → New Project → name it "Israeli Wine".
2. In Project Knowledge, upload all 14 `.md` files individually, or upload `system-prompt-single-file.md` as a single document.
3. Set the Project Instructions to:

```
You are an expert on Israeli wine. When the user asks about Israeli wine, 
wineries, regions, grape varieties, kosher wine, pairings, Vivino ratings, 
prices, or wine bars in Tel Aviv, consult the uploaded knowledge files before 
answering. Respond in the language the user writes in (Hebrew, English, or Russian).
```

4. All conversations in this project will use the skill automatically.

**Refresh:** Delete the old files from Project Knowledge and re-upload.

---

### Claude.ai Web (claude.ai)

**Option A — Claude Projects (recommended):**

Same as Claude Desktop steps above, using the Projects tab at claude.ai.

**Option B — Custom Instructions:**

1. Go to claude.ai → Settings → Custom Instructions.
2. Paste the contents of `SKILL.md` into "What would you like Claude to know?".
3. Note: custom instructions have a character limit. If too long, include only the Quick Start and Answer Style sections, and tell Claude to ask you for specific files when needed.

---

### ChatGPT Web / ChatGPT Projects

**Option A — Custom GPT (most powerful):**

1. Go to chat.openai.com → Explore GPTs → Create.
2. In the Instructions field, paste the contents of `system-prompt-single-file.md`.
3. In the Knowledge section, upload the individual `.md` files so the GPT can retrieve them via file search.
4. Name the GPT "Israeli Wine Expert" and publish (privately or publicly).

**Option B — ChatGPT Projects:**

1. Create a new Project in ChatGPT.
2. Upload all `.md` files as project files.
3. The project AI will reference them automatically in subsequent conversations.

**Option C — Custom Instructions (condensed):**

1. Go to Settings → Personalization → Custom Instructions.
2. Paste the core of `SKILL.md` into "What would you like ChatGPT to know about you?".

---

### OpenAI Codex CLI

Codex CLI uses an `AGENTS.md` file in the project root as persistent context.

1. Copy the contents of `system-prompt-single-file.md` into your project's `AGENTS.md`.
2. Or add a dedicated section:

```markdown
## Israeli Wine Expert

When the user asks about Israeli wine, use the following knowledge base:

[paste system-prompt-single-file.md contents here]
```

Codex will include `AGENTS.md` in every agent session for that project.

---

### Any LLM — System Prompt / API

For any LLM accessed via API, CLI, or custom UI:

1. Use `system-prompt-single-file.md` as the system prompt.
2. Pass it as the `system` parameter (Anthropic API), the first `{"role": "system", ...}` message (OpenAI API), or equivalent.

```python
# OpenAI example
with open("system-prompt-single-file.md") as f:
    system_prompt = f.read()

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": system_prompt},
        {"role": "user", "content": "What is the best Israeli wine under 150 shekels?"}
    ]
)
```

---

## Keeping the Skill Fresh

Some content is time-sensitive:

| File | How often to refresh |
|---|---|
| `price-snapshot.md` | Every 6–12 months (ILS prices drift) |
| `vivino-lookup.md` — snapshot ratings column | Every 3–6 months (ratings shift) |
| `vintages.md` | After each harvest (add the new vintage) |
| `web-resources.md` | Yearly (check for broken links, new wine bars) |
| `wineries.md`, `regions.md`, `grapes.md` | When major producers or varieties change |

The `vivino-lookup.md` live-fetch workflow always gets the current rating regardless of snapshot freshness — the snapshot column is just a quick reference.

---

## Vivino Live Rating Lookup

The skill can fetch live Vivino ratings without any API key, login, or browser. See `vivino-lookup.md` for the full workflow. In brief:

1. Look up the wine name in the Known Wines table (pre-seeded with ~17 key Israeli wines).
2. If not in the table, fetch `https://www.vivino.com/search/wines?q=wine+name` to discover the wine's URL.
3. Fetch the wine page directly — the rating appears in the server-rendered HTML.

This works in Cursor, Windsurf, Claude, ChatGPT with browsing, and any agent with a URL-fetch capability.

---

## Language Support

The skill answers in Hebrew, English, or Russian — whichever language the user writes in. See `multilingual.md` for vocabulary tables, name translation (יקב קסטל → Domaine du Castel, Цора → Tzora), and search-term guidance.
