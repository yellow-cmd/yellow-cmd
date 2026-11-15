# ylw workflow

A solo-founder workflow for **Claude Code (CLI)**: find an idea, screen it, kick off a repo, then ship and grow it.
It's a plugin marketplace (`ylw-workflow`) with one plugin (`ylw`).

> **Only one command to remember: `/ylw:flow <your need>`.** It works out where you are and runs the right step.

---

## Setup (once per machine)

```bash
claude plugin marketplace add yellow-cmd/yellow-cmd
```

```bash
claude plugin install ylw@ylw-workflow
```

Then copy the contents of [`profile.example.md`](profile.example.md) into `~/.claude/CLAUDE.md` and fill it in. The skills read your profile and paths from there.

Set up the board (one GitHub Project for every repo's tasks):

```bash
gh auth refresh -s project
```

Then in Claude Code: `/ylw:board set up the board`. The ids are cached in `~/.config/ylw/board.env`.

Update after a change: `claude plugin marketplace update ylw-workflow`

---

## The map

```
                         /ylw:flow "<need>"
                                │
          ┌─────────────────────┼──────────────────────────┐
     no idea yet          new idea / need              inside a project
          │                     │                          │
          ▼          market risk?  ─── no (tool for me,    ├─ build / fix ────▶ board ▶ /task
   /ylw:scout              │ yes        client, "just      ├─ change open task ▶ /change
   weekly radar            ▼            build it") ──┐     ├─ decision ────────▶ /adr
          │          /ylw:idea                       │     ├─ worth it? price? ▶ /ylw:product
          └─pick──▶  Go/Pivot/Validate/Kill          │     │                       │ Do now
                           │ Go + "yes"              │     │                       ▼
                           ▼                         ▼     │                     /task
                     /ylw:kickoff  A ◀───────────────┘     │
                     KICKOFF.md → gh repo create (template)
                           │
                cd <repo> && claude "/ylw:kickoff"
                           ▼
                     /ylw:kickoff  B: research stack → plan (OK?) → fill docs
                                   → /adr each decision → scaffold → /task
                                                                   │
                                           /ylw:reassess N  ◀── any output, any time
```

📋 **Every task is a GitHub issue on one board** (`Todo → In Progress → Done`): `/ylw:flow` opens it before `/task`, and `Closes #n` in the final commit moves it to Done.

⏸ **It always stops at:** verdicts · creating or pushing a repo · the bootstrap plan · anything marked `[approved]` (that needs your explicit yes).

---

## Cheatsheet

### Starting something new

| # | You want | Where | Type | Gets you | Stops at |
|---|---|---|---|---|---|
| 0 | Ideas | workflow repo | `/ylw:scout` | `ideas/radar/radar-DATE.md`, top 3 scoring 13/18 or more | You pick one |
| 1 | Check an idea | workflow repo | `/ylw:idea <idea>` | Kill thresholds → 3 research agents → verdict + `ideas/DATE-slug-viability.md` | Verdict |
| 1b | Known need, skip validation | workflow repo | `/ylw:flow "I need a tool that…"` | Straight to kickoff (`not analysed: known need`) | — |
| 2 | Create the repo | workflow repo | "go" or `/ylw:kickoff` | `ideas/<slug>/KICKOFF.md` → private repo from `yellow-cmd/project-template` → linked to the board, first task as a Todo issue | "Create repo?" |
| 3 | Bootstrap | new repo | `cd ~/code/<slug> && claude "/ylw:kickoff"` | Stack ADR → plan → docs filled → ADRs → tooling + CI → first `/task` | Plan OK |

### Day to day inside a project

| You want | Type |
|---|---|
| Anything, when unsure | `/ylw:flow <need>` |
| Build, fix, add (tracked on the board) | `/ylw:flow "build <what>"` |
| Build without board tracking | `/task <what>` |
| Note it for later | `/ylw:flow "backlog: <what>"` → Todo issue |
| Pick up a board item | `/ylw:flow "do #12"` |
| Change an active or open task | `/change <what changed>` (via flow, it also comments on the issue) |
| Record a decision | `/adr <decision>` |
| Is feature X worth it? Pricing? Growth? Backlog review? | `/ylw:product <question>` |
| Second opinion on the last answer | `/ylw:reassess 3 [focus]` |
| What's open across every project | `/ylw:board` or `/ylw:flow "what's next"` |
| Open the board in the browser | `/ylw:board open` |

`/task`, `/change` and `/adr` come from **project-template**. The `/ylw:*` skills come from this plugin.

### Rules the skills follow
- Evidence is tagged **[Data]** (quoted from a fetched URL) · **[Estimate]** (formula shown) · **[Assumption]**. No source → "no data found".
- `[proposed]` → `[approved]` only after your explicit yes.
- Product decisions → `docs/product/decisions/P00x` · technical decisions → `docs/decisions/000x`.
- Every MVP has a keep/kill metric with a date in `docs/STATUS.md`. Check it, and kill without guilt.

---

## Where things live

| What | Where |
|---|---|
| Skills | `plugins/ylw/skills/<skill>/SKILL.md` |
| Idea and radar reports | `ideas/` (local, gitignored while this repo is public) |
| Your profile and paths | `~/.claude/CLAUDE.md` (template: `profile.example.md`) |
| A project's truth | its repo: `docs/STATUS.md`, `docs/product/PRODUCT.md`, `ideas.md`, ADRs |
| Cross-project tasks | one GitHub Project; script `plugins/ylw/skills/board/board.sh`; config `~/.config/ylw/board.env` |
| Set up a new machine from zero | [`ONBOARDING.md`](ONBOARDING.md) (paste into Claude Code) |
| Why GitHub Projects (research) | [`docs/task-management.md`](docs/task-management.md) |

## Tips
- Weekly radar without opening a session: `claude -p "/ylw:scout"` (add it to cron if you like).
- Edit the skills here and test them live with `claude --plugin-dir ./plugins/ylw`, then bump `version` and push.
- If you rename this repo, re-run the `marketplace add` command with the new name.
