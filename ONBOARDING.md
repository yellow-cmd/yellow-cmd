# Onboarding: set up the ylw workflow from zero (Claude Code in WSL)

You are Claude Code running in WSL for this user. Set up everything below, in order. Work through the steps; stop only where it says **ASK**.

**Rules**
- Run every command in WSL. Keep code under `~/code`, never under `/mnt/c`.
- Commands that open a browser or prompt (like `gh auth …`): give them to the user to run with `!` and wait for them.
- **ASK** before anything outward-facing: creating repos or projects, pushing, opening issues.
- Before overwriting any file, back it up as `<file>.bak-<date>`.
- Never commit personal details (employer, contract, income) to a public repo.
- End with the report in step 8.

## 1. Tools
- Check `git --version`, `gh --version` (needs 2.40 or newer) and `claude --version`. Install what's missing (`sudo apt install -y git gh`). If apt's gh is too old, point the user to cli.github.com for GitHub's apt repo.
- Check `gh auth status`. If not logged in, or the token lacks the `project` scope, have the user run `! gh auth login`, `! gh auth refresh -s project` and `! gh auth setup-git`.

## 2. Workflow repo (the plugin)
- Find it: try `gh repo view yellow-cmd/ylw-workflow`, then `gh repo view yellow-cmd/yellow-cmd`. Use whichever exists, and call it WORKFLOW.
- If it isn't merged yet, the plugin lives on branch `claude/tender-brahmagupta-lriuv9`. Clone it to `~/code/<WORKFLOW name>`, on that branch if `plugins/ylw` isn't on the default branch.
- Check that `plugins/ylw/skills/` contains: board, flow, idea, kickoff, product, reassess, scout.

## 3. Install the plugin
- `claude plugin marketplace add ~/code/<WORKFLOW name>`
- `claude plugin install ylw@ylw-workflow`
- `claude plugin details ylw` must show `Skills (7)`.
- Tell the user: "Run `/reload-plugins` (or restart Claude Code) so the `/ylw:*` skills load in this session."

## 4. Memory (`~/.claude/CLAUDE.md`): workflow rules only
- Memory holds **workflow and project rules only**: no personal context, profile, employer or preferences about the user. Don't ask for any.
- If the file exists, back it up first. Show its current content and **ASK** whether to keep, move or drop anything that isn't workflow-related.
- Write the `## ylw workflow` section from `~/code/<WORKFLOW name>/memory.example.md`, with `Workflow repo:` set to `~/code/<WORKFLOW name>`.
- Show the final file.

## 5. Board (one GitHub Project for every repo)
- If `~/.config/ylw/board.env` exists, the board is already set up: skip to step 6.
- **ASK:** "Create a GitHub Project 'All projects' on your account, or use an existing one (give me its number)?"
- Run `~/code/<WORKFLOW name>/plugins/ylw/skills/board/board.sh setup [number]`.
- If setup fails, show the exact error and stop. Known unverified points: whether `link` accepts `owner/repo`, the Status option names, and the item-list fields. Report which one failed.

## 6. First project: `joseatemitas9000`
- Find it: `gh repo list --limit 200 --json nameWithOwner -q '.[].nameWithOwner' | grep -i joseatemitas9000`. Clone it to `~/code/joseatemitas9000` if it isn't there.
- `board.sh link <owner>/joseatemitas9000`
- Is it from the template? It is if `AGENTS.md` and `docs/STATUS.md` exist.
  - **Yes:** read `docs/STATUS.md`. **ASK** to import its active and open tasks as issues: the active task as `In Progress`, open ones as `Todo`. Then write each issue URL next to its task in STATUS.md, and commit.
  - **No (retrofit):** clone `yellow-cmd/project-template` to a temp dir and list its files. Give a 3-5 line plan to add the missing ones (AGENTS.md, CLAUDE.md, docs/STATUS.md, docs/product/PRODUCT.md, ideas.md, the decisions folders, and `.claude/commands` for /task, /change and /adr) **without overwriting** existing files. Fill them from what the code and README show. **ASK** for OK, then do it on a branch and commit. Ask the user for the current phase and the keep/kill test; don't invent them.

## 7. Verify
- In `~/code/joseatemitas9000`, run `board.sh list "repo:<owner>/joseatemitas9000"`. The imported tasks must be there.
- Tell the user to try `/ylw:flow what's next` and `/ylw:board open`.

## 8. Report (one table)
step · status (done / skipped / blocked) · notes. Then list:
- anything still pending on the user (auth, reload-plugins, push or merge approvals);
- every error from an unverified point, with its exact output.
