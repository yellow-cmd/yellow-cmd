---
name: scout
description: "Weekly scan of news, virals, booms and upcoming events for business opportunities that fit the founder. Use for the weekly radar, 'busca oportunidades', 'qué está pegando', 'find me an idea'."
---

# Trend scout (weekly opportunity radar)

Scan the last 7 days for opportunities a solo founder could exploit. Produce a short, sourced shortlist, not full analyses: anything promising goes to `idea` next. A quiet week is a valid result. Never invent opportunities to fill the report.

Read the **Founder profile** in your context (user `~/.claude/CLAUDE.md`). Fit matters, but don't force it: a strong opportunity outside the founder's skills is still worth one line.

## Rules of evidence
- Every signal needs: a source URL you fetched, its publisher, its date, and one quoted sentence. Snippets and social posts are signals, not proof.
- A trend needs at least 2 independent sources or a hard metric (search growth, chart position, downloads, sales). One viral post is not a trend.
- Separate **trend** (sustained, weeks to years) from **fad** (days), with the evidence for each.
- Check momentum: rising, peaked or fading. Discard late entries into peaked fads.
- Report-mill "market will reach $X by 2032" pages are not evidence.

## Scan (bounded)
Use the Agent tool to spawn 3 subagents in parallel. Each gets at most 8 searches and 5 fetches, covers the last 7 days only (plus events in the next 4-8 weeks), and returns only a table: signal · what's happening · quoted evidence · URL · date · momentum.
- **A. Tech, AI and internet:** launches, Hacker News / Product Hunt / GitHub trending, viral formats, new APIs or platform changes that open gaps.
- **B. Gaming, music and creators:** Roblox/Steam charts, big releases and updates, music-tech and creator-economy news, festivals.
- **C. Spain/EU, the founder's industry, regulation and calendar:** new laws or subsidies taking effect, Spanish business news, upcoming events that create short demand windows.

## Filter and score
Score each candidate 1-3 on: momentum · window length · founder fit · build effort (3 = shippable in 2 weeks or less at real hours) · clear way to make money · saturation (3 = few players). Keep up to 3 that score at least 13/18. Flag anything that touches the employer's industry (contract risk).

Read earlier reports in `<workflow repo>/ideas/radar/`. Mark repeats as rising / steady / fading instead of reporting them again.

## Report
Write `<workflow repo>/ideas/radar/radar-YYYY-MM-DD.md` and give a 3-line summary in chat:

```markdown
# Radar - YYYY-MM-DD

## Top opportunities (max 3)
### 1. <name> - score X/18 · trend|fad · window: N weeks
- What and why now: … [n]
- Fit: what the founder brings, what's missing.
- Smallest first step (1 day or less).
- Worth a full idea run? yes/no, why.

## Watchlist (max 5)
- <signal> - one line, why to watch, [n]

## Hype discarded
- <signal> - why not (peaked, saturated, no money, poor fit) [n]

## Sources
[1] Title - publisher, date - URL
```

End with: "Next: `/ylw:idea <name>` for a full check."

Before saving, check: every claim has a fetched, dated source; nothing is scored on a single post; nothing was invented to fill a slot.
