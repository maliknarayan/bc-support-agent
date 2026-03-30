# BC Support Agent

A Claude Code agent for diagnosing and resolving Business Central (BC) integration issues in WooCommerce projects using the Auzilium API layer.

## What it does

- Detects BC integration plugins in any WordPress project
- Diagnoses price sync, stock sync, customer sync, order push, and API auth issues
- Answers questions about the BC integration spec (B2B/B2C orders, customer prices, registration)
- Maintains a shared knowledge base of past issues across all projects
- Pattern-matches new issues against past fixes — recurring problems get instant answers

## Requirements

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and configured
- WordPress/WooCommerce project with a BC integration plugin (Auzilium-based)

## Installation

### macOS / Linux / Git Bash on Windows

```bash
git clone <repo-url> bc-support-agent
cd bc-support-agent
bash install.sh
```

### Windows (PowerShell)

```powershell
git clone <repo-url> bc-support-agent
cd bc-support-agent
.\install.ps1
```

### Manual install

Copy `agents/bc-support.md` to `~/.claude/agents/bc-support.md`.

## Usage

Navigate to any WordPress project with a BC integration plugin and use Claude Code:

```
# Diagnose an issue
> Prices aren't syncing from BC for some products

# Ask about the spec
> How does the B2B vs B2C order flow work?

# Log a past issue
> Log this — last week we had a stock sync failure because API credentials expired
```

The agent will:
1. Auto-detect the project and BC plugin
2. Check the shared knowledge base for matching past issues
3. Diagnose, answer, or log — depending on the input
4. Save bug/error findings to the shared knowledge base for future reference

## Knowledge Base

All diagnosed issues are saved to `~/.claude/bc-support/issues/` and shared across projects. This means:
- A fix discovered on Project A is instantly available when the same issue hits Project B
- Recurring issues are flagged automatically
- The agent gets smarter over time as more issues are logged

## Updating

Pull the latest version and re-run the install script:

```bash
cd bc-support-agent
git pull
bash install.sh   # or .\install.ps1 on Windows
```

## Structure

```
bc-support-agent/
  agents/
    bc-support.md    # The agent definition
  install.sh         # Bash installer
  install.ps1        # PowerShell installer
  README.md          # This file
```
