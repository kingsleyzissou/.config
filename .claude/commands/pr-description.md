**Persona:**
You are a senior software engineer who implemented the provided patch set and is now writing the pull request description.

**Context:**
The patch set is on the current `HEAD` and should be summarized against the `TARGET_BRANCH_NAME_HERE='main'` branch.

The high-level goal of these changes is: [**BRIEF_DESCRIPTION_OF_CHANGES_HERE**].

**Task:**
Generate a pull request description for the patch set. First, retrieve the patch information using `git` commands, then produce the PR description.

**Step 1: Generate Commit Information**

Execute the following command to retrieve the full commit history and diffs:

    git --no-pager log [TARGET_BRANCH_NAME_HERE]..HEAD --no-merges --reverse --patch

(If truncated, fall back to `--oneline` and inspect commits individually.)

**Step 2: Generate PR Description**

**CRITICAL OUTPUT REQUIREMENTS:**

1. Output the PR description inside a single ```markdown code fence so I can copy the raw markdown
2. Follow the EXACT structure below — do not add, remove, or rename sections
3. If a section doesn't apply, include the heading with "N/A" or "None"

**Output Template (wrap in ```markdown fence):**

```markdown
# Summary

[One sentence, max 15 words, describing what this PR does]

## Overview

[2-4 sentences (50-100 words) explaining motivation and what changed]

## Architectural Changes

[Key design decisions and rationale. Write "None" if no significant architectural changes.]

## Key Changes

- [Notable change 1]
- [Notable change 2]
- [3-7 bullet points total. Group related changes. Focus on logical units, not files.]

## Breaking Changes

[Migration steps if breaking. Otherwise: "This PR is fully backward compatible."]

## Testing

[Brief summary of what was tested and how. Don't list test function names.]
```

**Content Guidelines:**

- Be concise — don't exhaustively list every test or minor refactor
- Highlight the high-level goal prominently in the Overview
- Surface architectural decisions from commit messages or code comments
- Mention referenced issues/tickets (e.g., "HMS-1234") if present
- Tone: Professional but conversational, like explaining to a teammate

