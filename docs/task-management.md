# Managing tasks across projects (research, 2026-11-15)

**Status:** adopted. Option 1 is built into the plugin as `/ylw:board` (script: `plugins/ylw/skills/board/board.sh`), and flow, kickoff and product use it.

| Tool | How Claude Code reaches it | Cross-project view | Cost (1 user) | Git integration | Verdict |
|---|---|---|---|---|---|
| **GitHub Issues + Projects** | `gh project` and `gh issue` (official); GitHub MCP `projects` toolset | Yes: one Project across any repos | Free | Native (PRs close issues) | **Top pick** |
| Index generated from STATUS.md | Files + `gh api` | Yes, read-only digest | Free | Already in the repos | **Runner-up / companion** |
| Linear | Official hosted MCP | Yes | Free plan capped at 250 issues; $10/mo | PR linking, GitHub sync | Overkill |
| Notion | Official hosted MCP | Yes (one database) | Free solo | GitHub sync only on Business plan | Skip |
| Todoist | Official MCP + Claude Code plugin | Free plan: 5 projects | $5-7/mo | None | Skip |
| Backlog.md | MCP + CLI; markdown files in the repo | No (per repo) | Free | In the repo | Good per repo only |
| Beads (`bd`) | CLI + Claude hooks | Partial | Free | Optional issue sync | Heavy for MVPs |
| Taskmaster AI | MCP via npx | No (per repo) | Free | Branch tags only | Skip (no release since 2026-03) |

## Option 1: one GitHub Project over all repos

```bash
gh auth refresh -s project
gh project create --owner "@me" --title "All projects"          # note the number N
gh project link N --owner "@me" --repo OWNER/REPO                # once per repo
gh issue create -R OWNER/REPO -t "Task" -b "..."
gh project item-add N --owner "@me" --url <issue-url>
gh project item-list N --owner "@me" --format json               # cross-project read
```

To adopt it: add "Open tasks are GitHub issues on Project N" to `~/.claude/CLAUDE.md`, and have the template's `/task` open an issue and add it to the Project. `STATUS.md` stays the narrative.

## Option 2: digest from STATUS.md (untested)

```bash
for r in $(gh repo list --limit 100 --json nameWithOwner -q '.[].nameWithOwner'); do
  s=$(gh api "repos/$r/contents/docs/STATUS.md" -H "Accept: application/vnd.github.raw" 2>/dev/null) || continue
  printf "## %s\n%s\n\n" "$r" "$(echo "$s" | head -20)"; done > ~/projects-index.md
```

## Unverified
- Whether the GitHub MCP server enables `projects` by default (set `X-MCP-Toolsets` explicitly).
- Limits on "auto-add from repo" workflows on Free accounts.
- Whether Linear's GitHub integration is included in its Free plan.

## Sources (fetched 2026-11-15)
- https://cli.github.com/manual/gh_project
- https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects
- https://github.com/github/github-mcp-server
- https://github.com/pricing
- https://linear.app/docs/mcp · https://linear.app/pricing
- https://developers.notion.com/guides/mcp/get-started-with-mcp · https://www.notion.com/pricing
- https://www.todoist.com/pricing
- https://github.com/MrLesk/Backlog.md
- https://github.com/gastownhall/beads
- https://github.com/eyaltoledano/claude-task-master
