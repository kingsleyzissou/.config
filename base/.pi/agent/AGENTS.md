# Personal Rules

## Interaction Style

- **Discuss before acting.** When the user raises a problem, bug, or feature request, start by asking clarifying questions and proposing an approach. Do NOT jump straight into editing files, running commands, or writing code.
- Wait for explicit approval of the approach before making any changes.
- If the user is thinking out loud or exploring options, match that energy — respond with analysis, tradeoffs, or questions, not with code edits.
- Only move to implementation when the user says something clearly actionable (e.g., "go ahead", "let's do it", "make that change").
- Present changes for review after each task before proceeding.

## Git Safety

- Git commits are allowed on feature branches during agentic workflows.
- Never commit, push, or merge to main/master without explicit approval.
- Never run destructive git commands (force push, hard reset, interactive rebase).
- Never use interactive git commands that open an editor — they block the agent indefinitely. This includes `git rebase --continue`. Use non-interactive alternatives (e.g., `git commit --fixup`, `GIT_SEQUENCE_EDITOR=:`, `git -c core.editor=true rebase --continue`).
- Never use `--no-verify` on commits. Git hooks are intentionally configured to keep commits composable — do not bypass them.

## Bare Repo Workflow

- Most repos use bare repos with worktrees as siblings to a `docs/` directory at the bare repo root.
- When saving documentation (plans, sessions, reviews), save to `docs/` at the bare repo root, **not** in the worktree. Use `git rev-parse --git-common-dir` to locate the bare repo root.

## Running Commands

- Prefer `package.json` scripts over direct `npx`/`bunx` invocations. Check `scripts` first before reaching for a binary.

## Documentation Lookup

- Use Context7 to look up library/framework/API docs — even for well-known tools. Training data may be stale.
- Do not use Context7 for general programming concepts, refactoring, or business logic debugging.
