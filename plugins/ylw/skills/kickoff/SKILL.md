---
name: kickoff
description: "Start a new project from an approved idea or a known need: write the kickoff, create the repo from yellow-cmd/project-template with gh, then bootstrap it. Use for 'kickoff', 'start the project', 'create the repo', or after an idea gets Go. Not for tasks inside an existing project."
---

# Kickoff

Two phases. Pick one by location:
- **A (create):** not inside the new project's repo yet.
- **B (bootstrap):** inside a repo that has `docs/product/KICKOFF.md` and `{{...}}` placeholders left in `AGENTS.md`.

Most MVPs are experiments that will be thrown away. Optimise for speed to a working MVP and a clear keep/kill test, not for completeness. Everything written is in English.

## Phase A: create

1. **Gather.** Required: name (repo slug), pitch and audience, MVP scope, stack (or "to decide"). Reuse the `idea` report if there is one (`<workflow repo>/ideas/*-<slug>-viability.md`) and don't redo its research. If something that changes the result is missing, ask one question.
2. **Write the kickoff** to `<workflow repo>/ideas/<slug>/KICKOFF.md` using the template below, and show it.
   - A decision is `[approved]` only if the user explicitly said yes. Everything else is `[proposed]`.
   - Product decisions (audience, monetization, pricing, scope) become P-ADRs. Technical decisions (stack, architecture) become ADRs.
3. **Gate.** Ask: "Create private repo `<owner>/<slug>` from project-template in `<projects dir>`?" Wait for yes.
4. **Create:**
   ```bash
   cd <projects dir> && gh repo create <owner>/<slug> --private --template yellow-cmd/project-template --clone
   ```
   Copy `KICKOFF.md` to `<slug>/docs/product/KICKOFF.md`, and the viability report (if any) to `<slug>/docs/product/research/`.
   Put it on the board (the script is `../board/board.sh`, relative to this skill's base directory): `board.sh link <owner>/<slug>`, then `board.sh add <owner>/<slug> "<first task>" "<Done when>" Todo`. Write the issue URL into KICKOFF.md next to **First task**. If the board isn't set up, offer `ylw:board` setup once and continue either way.
5. **Hand over.** A session can't move into the new repo, so print:
   ```bash
   cd <projects dir>/<slug> && claude "/ylw:kickoff"
   ```

## Phase B: bootstrap (inside the new repo)
Follow `docs/product/KICKOFF.md`:
1. Research current best practices and stable versions for the stack (official docs only), and record them as an ADR. If the stack is "to decide", propose options in a `proposed` ADR and stop.
2. Give a 3-5 line plan and **wait for OK**.
3. Fill every `{{...}}` in `AGENTS.md`, `CLAUDE.md` and `docs/STATUS.md` (Phase = MVP, exit test = the keep/kill test). Replace `README.md` with the project's own.
4. Write `docs/product/PRODUCT.md` from Pitch, Why, MVP scope, Monetization and exit test. Seed `docs/product/ideas.md` with the MVP "Out" items. Link any research in `docs/product/research/` from PRODUCT.md.
5. Record each decision with `/adr`, in its domain (`[approved]` → accepted, `[proposed]` → proposed).
6. Scaffold the structure and tooling (formatter, linter, type-check, tests, CI) following the stack ADR, then fill `AGENTS.md > Commands`.
7. Commit ("chore: bootstrap from kickoff"). Move the first-task issue to In Progress (`../board/board.sh move <url> "In Progress"`) and start it with `/task`, passing the issue URL.

## KICKOFF.md template (keep under about 60 lines)

```markdown
# Kickoff: <project name>

**Pitch:** 1-2 lines: what it is and for whom.
**Why:** problem and value, 1-3 lines.
**Verdict:** <idea verdict + confidence | not analysed: known need>

**MVP scope:** (the smallest thing that tests the riskiest hypothesis)
- In: ...
- Out: ...

**Phase 1 exit test (keep/kill):** metric + number + date.
**Monetization (hypothesis):** one line, or "not yet".

**Stack:** language, framework, data, hosting, or "to decide" plus constraints. Prefer boring, fast-to-ship choices.
**Architecture:** 2-4 lines: main modules or layers and key patterns.

**Product decisions:** (each becomes a P-ADR)
- [approved] ...
- [proposed] ...

**Technical decisions:** (each becomes an ADR)
- [approved] ...
- [proposed] ...

**Project rules:** (go to AGENTS.md > Non-negotiable rules, each citing its ADR)
- Modern, consistent practices; SOLID; clear structure and design patterns where they add value.
- Self-explanatory code: clear names, no comments or docstrings unless truly necessary.
- <project-specific rules>

**Risks / open questions:**
- ...

**First task:** <title>
- Done when: 1-3 verifiable criteria.
```
