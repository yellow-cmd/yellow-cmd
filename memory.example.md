<!--
Copy everything below into ~/.claude/CLAUDE.md and adjust the paths.
Workflow rules only: no personal context.
-->

## ylw workflow
- Entry point for any need: `/ylw:flow <need>`. It routes to scout, idea, kickoff, product, board, reassess, or the project's /task, /change and /adr.
- Workflow repo: ~/code/ylw-workflow (idea and radar reports go in its ideas/ folder)
- Projects dir: ~/code (kickoff clones new repos here)
- GitHub owner: yellow-cmd
- Project template: yellow-cmd/project-template
- Tasks: every task is a GitHub issue on the ylw board (see /ylw:board). Finish with "Closes #n" in the final commit or PR.
- Decisions: `[proposed]` until I say yes explicitly. Product decisions → P-ADRs in docs/product/decisions/, technical → ADRs in docs/decisions/.
- Each project's truth lives in its repo: docs/STATUS.md (phase, keep/kill test), docs/product/PRODUCT.md, docs/product/ideas.md.
- Repo content in English; chat in my language.
