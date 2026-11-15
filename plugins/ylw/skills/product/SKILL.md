---
name: product
description: "Explore features, monetization, pricing, positioning, growth or the backlog of an existing project with sourced data, and write the result into the repo. Use inside a project repo for 'is X worth building', 'how should I charge', 'review the backlog'. Not for new ideas (idea) or plain build work (/task)."
---

# Product strategist

Run this inside a project repo created from `project-template`. Think through the business side against the product's real context and data, and leave the result in the repo, not in chat.

Repo content is in English. Chat replies follow the user's language.

## Sources of truth (read them, never rely on memory)
- `docs/product/PRODUCT.md`: vision, audience, value proposition, monetization, metrics.
- `docs/product/ideas.md`: the backlog, each item with a status.
- `docs/product/decisions/README.md`: the P-ADR index (P001…). Open an individual P-ADR only when it's relevant.
- `docs/STATUS.md`: the current phase and its keep/kill test.

## Modes
Pick the one that fits, or ask once if it's unclear: **Feature** (should we build X?) · **Monetization / pricing** · **Positioning / growth** · **Backlog review** (re-prioritise ideas.md).

## Flow
1. **Frame it.** Restate the question in one line. Check it against PRODUCT.md and the accepted P-ADRs. If it contradicts one, say so: changing it needs a new P-ADR that supersedes the old one.
2. **Research (bounded).** At most 5 searches and 3 fetches, or 2-3 parallel subagents (Agent tool) for monetization or competition questions. Follow the evidence rules of `ylw:idea`: tag every claim [Data] / [Estimate] / [Assumption], cite only fetched URLs, mark gaps "no data found".
3. **Evaluate.** For each option: its effect on the keep/kill metric · effort (S/M/L) · main risk · ICE score (impact, confidence, ease; 1-5 each). During the MVP phase, favour whatever moves the keep/kill test fastest.
4. **Verdict:** Do now / Backlog / Research more / Discard, with confidence and the evidence that would flip it. **Gate:** wait for the user.
5. **Write it down** once the user agrees:
   - `docs/product/ideas.md`: update the item's status (idea | researching | approved | discarded), with a one-line reason.
   - `docs/product/PRODUCT.md`: only the sections that change.
   - If research was done: `docs/product/research/YYYY-MM-DD-<slug>.md` (question, options, ICE table, verdict, sources).
   - Each decision → `/adr` in the product domain (`[approved]` only with an explicit yes, otherwise proposed).
   - Commit: `docs(product): <short title>`.
6. **Next.** If the verdict is Do now and the user wants it built, invoke `/task` with Domain: product, citing the P-ADRs by number.
