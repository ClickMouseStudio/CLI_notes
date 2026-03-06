# Repository Guidelines

## Project Structure & Module Organization
This repository is a cross-platform CLI notes and dotfiles collection.
- `README.md`: top-level overview and navigation.
- `common/`: OS-agnostic notes, currently NeoVim-focused (`common/NeoVim/`).
- `macOS/`: Apple Silicon setup notes and sample `.zshrc`.
- `Ubuntu/`, `Windows/`: platform-specific placeholders and guides.
- `src/img/`: images used by documentation.

Keep new content grouped by platform. Add shared material under `common/` first, then link from platform docs when needed.

## Build, Test, and Development Commands
There is no build pipeline in this repository; changes are Markdown/config updates.
- `rg --files`: quick inventory of tracked content.
- `rg "pattern" common macOS Ubuntu Windows`: search for terms before editing.
- `git status`: verify only intended files changed.
- `git diff -- README.md common/ macOS/ Ubuntu/ Windows/`: review doc edits before commit.

If you use external linters locally (for example `markdownlint`), run them before opening a PR.

## Coding Style & Naming Conventions
- Default to Japanese for prose; keep commands, file paths, and identifiers in English.
- Use Markdown headings in descending order (`#`, `##`, `###`) with short sections.
- Prefer concise, task-oriented sentences; avoid long prose blocks.
- Use fenced code blocks with language tags (for example ```bash, ```lua).
- File names for setup guides use snake_case with optional step prefix (example: `03_python_env_miniforge.md`).
- Preserve existing directory naming (`Ubuntu`, `Windows`, `macOS`, `common`).

## Testing Guidelines
Automated tests are not configured. Validate changes with:
- Link/path checks: ensure relative links resolve from each document.
- Command sanity: confirm sample commands are copy-paste runnable.
- Render check: preview Markdown in your editor to verify heading/code formatting.
- Optional lint examples: `markdownlint "**/*.md"`, `lychee README.md common/**/*.md`.

## Commit & Pull Request Guidelines
Git history is currently simple (`update`, `add ...`). For clarity, prefer:
- Commit format: `docs(scope): short summary` (example: `docs(macOS): clarify zsh plugin setup`).
- Existing history does not need rewriting; apply the new format to future commits.
- One logical topic per commit.
- PR checklist: changed paths listed, related issue/task linked when available, and screenshots only when visual rendering changed.

## Security & Configuration Tips
- Never commit secrets (API keys, tokens, private hostnames, personal absolute paths).
- Replace user-specific values with placeholders in examples.
- Review dotfiles carefully before commit because shell configs can expose local environment details.
