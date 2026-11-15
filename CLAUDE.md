# Workflow repo

This repo holds the solo-founder workflow: a Claude Code plugin marketplace (`ylw-workflow`) with one plugin, `ylw`, and the local `ideas/` workspace.

## Layout
- `.claude-plugin/marketplace.json`: the marketplace. Its entry name must match `plugins/ylw/.claude-plugin/plugin.json` > `name`.
- `plugins/ylw/skills/<skill>/SKILL.md`: one folder per skill. `flow` is the orchestrator; when you add, rename or remove a skill, update its routing table.
- `ideas/`: idea and radar reports. Gitignored while the repo is public.
- `memory.example.md`: the workflow rules and paths for `~/.claude/CLAUDE.md`. Workflow only: skills never store or expect personal context.
- `README.md`: the cheatsheet. Keep it in sync with the skills.

## Rules
- Skills are written in English, imperative, and short. A chat reply follows the user's language.
- Never commit personal details (employer, contract, income, real project ideas): this repo is public.
- Each change to a skill: bump `version` in `plugin.json` (semver), then validate.

## Commands
- Validate: `claude plugin validate .`
- Try local edits without installing: `claude --plugin-dir ./plugins/ylw`
- After pushing, update installed copies: `claude plugin marketplace update ylw-workflow`
