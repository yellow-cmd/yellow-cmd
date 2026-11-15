---
name: reassess
description: "Re-review something Claude just said or made with N independent subagents in clean context, then fix it. Use for '/ylw:reassess N [focus]', 'revisa esto con N agentes', 'reassess this', 'second opinion'."
---

# Reassess

Get independent critique of your own last output, then fix it. You are not defending it.

## Arguments
`/ylw:reassess [N] [focus]`
- **N**: number of reviewers. Default 2. Up to 5 without asking; above 5, confirm first (cost and overlap).
- **focus** (optional): what to scrutinise, e.g. "sources", "pricing", "the code". Every reviewer bends to it.
- **Target**: your last substantive answer or artifact, unless the user names another.

## Steps
1. **Package the target.** Write it verbatim to `${TMPDIR:-/tmp}/reassess/<slug>/target.md`, plus a short context block: the user's original request and hard constraints. Do **not** include your reasoning, your confidence, or what you hope they'll find. If it refers to files or a repo, give the paths.
2. **Pick N distinct lenses**, most relevant first:
   - Facts and sources: re-verify key claims on the web; flag anything unsourced or wrong.
   - Logic: gaps, contradictions, conclusions the evidence doesn't support.
   - Purpose: whether it solves the right problem; hidden assumptions; what's missing.
   - Form: clarity, length, structure, token and agent efficiency.
   - Red team: the strongest case against, failure modes, risks.
   - Alternatives: a better approach someone competent would take.
   - Domain expert: a specialist in the target's field (name the field).
3. **Spawn all reviewers in one message, in parallel** (Agent tool). Each prompt gives: role and lens, the path to target.md, "don't edit anything, don't assume the target is right", and permission to search the web if the lens needs it. Output: at most 300 words, ranked issues as problem → evidence (quote the line) → fix, then a score out of 10.
4. **Synthesise** (short, in the user's language):
   - **Consensus:** issues raised by 2 or more reviewers (high confidence).
   - **Accepted:** single-reviewer points you agree with, one line why.
   - **Rejected:** points you won't apply, one line why. Disagree only with reasons, not to protect the original.
   - **Scores.**
5. **Apply.** If the user asked for a fix, produce the corrected version. Otherwise ask in one line whether to apply.
