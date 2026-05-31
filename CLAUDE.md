# Quoti — project instructions

## Commits
- Convention: Conventional Commits in English only.
- Allowed prefixes: `feat:`, `fix:`, `docs:`, `refactor:`, `chore:`, `test:`, `style:`.
- One commit per logical change. If a task touches multiple independent concerns, split into multiple commits.
- Message format: `<type>: <short imperative description>` (e.g. `feat: add onboarding flow`).
- Never bundle unrelated changes in a single commit.
- Never add `Co-Authored-By` lines to commits.

## Push
- Do not push after every commit.
- Accumulate commits locally. Once there are 3 or more unpushed commits, ask the user if they want to push before doing so.
- Never push without explicit confirmation from the user.
