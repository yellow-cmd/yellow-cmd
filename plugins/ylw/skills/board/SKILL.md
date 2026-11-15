---
name: board
description: "Cross-project task board: one GitHub Project where every task is an issue in its repo. Use for 'board', 'what's open', 'what's next across projects', 'add to backlog', 'mark done', 'set up the board', and from the other ylw skills to track tasks."
---

# Board

Every task, in every project, is a GitHub **issue** in its repo, placed on one GitHub Project (the board) with a **Status** of `Todo`, `In Progress` or `Done`. The board is the cross-project view; each repo's `docs/STATUS.md` stays the narrative (phase, keep/kill test).

All operations go through `board.sh` in this skill's base directory. Run it with Bash and don't call raw `gh project` yourself.

```
board.sh setup [number]                            once per machine; adopts an existing project if given its number
board.sh link <owner/repo>                         once per repo
board.sh add <owner/repo> <title> [body] [status]  prints the issue URL; default status Todo
board.sh move <issue-url> <Todo|In Progress|Done>
board.sh list [query]                              e.g. "-status:Done", "repo:owner/name", "status:\"In Progress\""
board.sh open                                      opens the board in the browser
```

Exit code 2 with "Board not set up" → offer setup once (step 1). If the user declines, carry on without the board and don't ask again this session.

## 1. Setup (once)
1. **Gate:** "Create a GitHub Project 'All projects' on your account?" Wait for yes. If the user already has one, ask for its number and run `setup <number>`.
2. If gh lacks the `project` scope, ask the user to run `gh auth refresh -s project` themselves (it opens a browser), then retry.
3. Link the repos that already exist: for each repo under the projects dir that has `docs/STATUS.md`, run `link <owner/repo>`, then offer to import its open tasks from STATUS (one `add` per task; the active task gets `In Progress`).

## 2. Conventions
- **Title:** an imperative phrase, under 70 characters. **Body:** the goal, the "Done when" checklist (`- [ ] …`) and `Domain: tech|product`, plus links to the P-ADRs or ADRs it serves.
- **Starting a task:** `add … "In Progress"`, or `move <url> "In Progress"` if it is already on the board. Write the issue URL in `docs/STATUS.md` next to the task.
- **Changing a task:** `gh issue comment <url> --body "Change: …"`, and update the checklist in the issue body with `gh issue edit <url> --body-file -`.
- **Finishing a task:** put `Closes #<n>` in the final commit or PR. The board's built-in "item closed" workflow moves the item to Done. If the issue was closed without that, run `move <url> Done`.
- **Later / backlog:** `add … Todo`. Ideas that aren't committed work stay in `docs/product/ideas.md`, not on the board.
- **Killed project:** archive the repo. Its items leave the active views, and the board itself isn't touched.

## 3. Views
- **What's open:** `list "-status:Done"`. Show one table grouped by repo (status · title · #n), active items first. Then a one-line pick for what's next: prefer the item closest to a keep/kill deadline (read `docs/STATUS.md` in that repo if it's local).
- **One project:** `list "repo:<owner/repo> -status:Done"`.
