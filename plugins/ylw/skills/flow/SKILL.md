---
name: flow
description: "Single entry point of the workflow. Use whenever the user states a need, idea, problem or question and it isn't obvious which step fits: '/ylw:flow <need>', 'I need…', 'necesito…', 'quiero…', 'qué hago con…', 'what's next'. Routes to scout, idea, kickoff, product, board, reassess, or the project's /task, /change and /adr, tracks every task on the GitHub Project board, and chains the steps."
---

# Flow (orchestrator)

The user describes a need in plain words. Find where they are, pick the route, say it in one line, and run it. They should never have to remember which skill or command comes next.

Chat replies follow the user's language. Files and repo content are in English.

## 1. Locate (no questions, just look)
- **Project repo:** `AGENTS.md` and `docs/STATUS.md` exist. Read `docs/STATUS.md` (phase, keep/kill test, active and open tasks).
  - If `AGENTS.md` still has `{{...}}` placeholders and `docs/product/KICKOFF.md` exists, the bootstrap hasn't run: route to **kickoff** (phase B).
- **Workflow repo:** `.claude-plugin/marketplace.json` exists and is named `ylw-workflow`.
- **Anywhere else:** treat it as "no project".

Read the **ylw workflow** section from your context (user `~/.claude/CLAUDE.md`): paths, owner and template. If it's missing, use `~/code` and `yellow-cmd`, and say once at the end: "Add `memory.example.md` from the workflow repo to `~/.claude/CLAUDE.md`." Memory holds workflow rules only. Never write personal context into it.

## 2. Route

| The need | Where | Route |
|---|---|---|
| No idea yet: "find opportunities", "what's hot" | anywhere | `scout` |
| A new product or business that must win users or money (market risk) | anywhere | `idea`, then `kickoff` on Go |
| A known need with no market risk: a tool for yourself, client work, a learning project, or "just build it" | no project | `kickoff` fast track (Verdict: `not analysed: known need`) |
| Build, fix, add or refactor something now | project | board `add … "In Progress"` → the project's `/task` |
| Note something for later ("add to backlog", "remind me to…") | project | board `add … Todo` (no `/task`) |
| Pick up a task that's already on the board ("do #12") | project | board `move … "In Progress"` → `/task` |
| Change the requirements of a task listed in STATUS or on the board | project | the project's `/change` + an issue comment |
| Record or revisit a technical or product decision | project | the project's `/adr` |
| Business question: is feature X worth it, pricing, positioning, growth, backlog | project | `product` |
| Review or second opinion on the last output | anywhere | `reassess` |
| Status across projects, "what's next", "what's open" | anywhere | `board` (view: what's open) |
| Set up or open the board | anywhere | `board` |
| The need belongs to a different project | anywhere | Give the command: `cd <projects dir>/<repo> && claude "/ylw:flow <need>"` |

If two routes fit, pick the cheaper one and name the alternative in the same line. Ask at most one question, and only if the answer changes the route.

## 3. Announce and run
Write one line: `→ <route>: <why in a few words>`, plus `(say "<alt>" to switch)` if relevant. Then start right away:
- Plugin skills: load `ylw:<skill>` with the Skill tool and pass the need as args.
- Project commands (`/task`, `/change`, `/adr` come from `project-template`): invoke them with the Skill tool and pass the need. If the repo doesn't have them, it isn't from the template: do the work directly following its `AGENTS.md`/`CLAUDE.md`, and offer a retrofit in one line.

## Board tracking (every task is an issue)
Follow the conventions in `ylw:board`. The script is `../board/board.sh`, relative to this skill's base directory.
- **Before `/task`:** if the task isn't on the board yet, run `board.sh add <owner/repo> "<title>" "<goal + Done when + Domain>" "In Progress"`. Pass the issue URL to `/task` ("Issue: <url>") so it gets written in STATUS.md, and the final commit carries `Closes #<n>`.
- **With `/change`:** add an issue comment and update the issue's checklist.
- **Owner/repo:** `gh repo view --json nameWithOwner -q .nameWithOwner`.
- **Not set up (exit code 2):** offer `ylw:board` setup once. If declined, run the route without tracking.

## 4. Chain until a gate
Keep going from step to step, stopping only at the gates:

```
scout ──pick──▶ idea ──Go + "yes"──▶ kickoff A (repo + board) ──▶ kickoff B (bootstrap) ──plan OK──▶ /task
                             product ──Do now + "yes"──▶ board add ──▶ /task
every /task: board add/move "In Progress" ──▶ work ──▶ commit "Closes #n" ──▶ Done
```

Gates (always stop and wait for the user):
- A verdict from `idea` or `product`.
- Anything outward-facing: creating a repo, pushing, publishing. (Opening and moving issues for board tracking on the user's own repos is part of the flow: no gate.)
- The bootstrap plan in kickoff B.
- Marking any decision `[approved]`: that needs an explicit yes.

After each step, end with one line naming the next step and how to trigger it ("Next: /task <first task>. Say go.").
