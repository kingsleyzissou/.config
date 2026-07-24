---
name: pr-description
description: Generate a concise pull request title and description from the current branch. Use when creating a PR, drafting a PR description, or when asked to describe the current changes for submission.
---

# PR Description

Generate a concise PR description based on the changes in the current branch.

## Steps

1. Check if you are in a bare repo by running
   `git rev-parse --is-bare-repository`. If `true`, list worktrees with
   `git worktree list` and ask the user which worktree to use. Use
   `git -C <worktree-path>` for all subsequent git commands.

2. Determine the base branch. If an argument is provided, use it. Otherwise
   check git remotes: if `upstream` exists use `upstream/main`, if `kingsley`
   exists use `kingsley/main`.

3. Gather context by running these git commands:
   - `git [-C <path>] log <base>..HEAD --format="- %s"` for commit messages
   - `git [-C <path>] diff <base>..HEAD --stat` for changed files overview

4. Suggest a non-semantic PR title. If a `jira_key` is present in the
   workflow context, append it in parentheses -- e.g.,
   `Add widget support (PROJ-123)`.

5. Write the title and description to a file namespaced by branch name.
   Save to `/tmp/pr-description-<branch>.md`. Tell the user the absolute
   path so they can pipe it into `gh pr create --body-file`.

## Output Format

The file should contain raw markdown, ready to paste into GitHub:

    ## Summary

    [1-2 sentences explaining what this PR does and why]

    ## Changes

    - [Change 1]
    - [Change 2]
    - [3-5 concise bullet points]

## Guidelines

- Keep it brief. Do not be verbose or add extra sections.
- Write to a file — do NOT output the description inline in your response.
  The user needs copyable raw markdown, which gets mangled by chat rendering.
- Focus on the **why**, not just the what
- Group related changes across commits into logical bullets
- 3-5 bullet points maximum
- Do not include trivial changes (whitespace, import reordering)
