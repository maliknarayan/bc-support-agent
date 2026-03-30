# BC Support Agent

An AI agent for diagnosing and resolving Business Central (BC) integration issues in WooCommerce projects using the Auzilium API layer. Works with **GitHub Agent Mode** and **Claude Code**.

## What it does

- Diagnoses price sync, stock sync, customer sync, order push, and API auth issues
- Answers questions about the BC integration spec (B2B/B2C orders, customer prices, registration)
- Provides exact fix steps with file paths, code snippets, and SQL queries
- Covers the full Auzilium API surface: items, customers, salesOrders, GetPrices

## Usage

### GitHub Agent Mode (recommended for quick questions)

1. Go to [github.com](https://github.com) and open the Agent mode
2. Select the **bc-support-agent** repo from the repository picker
3. Also select your **WordPress project repo** if you need code-level diagnosis
4. Ask your question — the agent has full BC spec knowledge built in

Examples:
```
Prices aren't syncing from BC for some products
How does the B2B vs B2C order flow work?
Customer is getting wrong customer prices after login
Why would a B2C order post with the wrong customer number?
```

### Claude Code (full features)

For the full experience with auto-detection, shared knowledge base, and issue logging:

**macOS / Linux / Git Bash:**
```bash
git clone https://github.com/maliknarayan/bc-support-agent.git
cd bc-support-agent
bash install.sh
```

**Windows PowerShell:**
```powershell
git clone https://github.com/maliknarayan/bc-support-agent.git
cd bc-support-agent
.\install.ps1
```

**Manual:** Copy `agents/bc-support.md` to `~/.claude/agents/bc-support.md`

Then navigate to any WordPress project with a BC plugin and use Claude Code normally.

### Copy to your own project (optional)

If you want BC knowledge available directly in your WordPress project repo:
```bash
cp .github/copilot-instructions.md /path/to/your-wp-project/.github/copilot-instructions.md
```

This works with GitHub Agent Mode, Copilot Chat in VS Code, and any tool that reads `.github/copilot-instructions.md`.

## Feature Comparison

| Feature | GitHub Agent Mode | Claude Code |
|---------|:-:|:-:|
| BC spec knowledge | Yes | Yes |
| Diagnostic patterns | Yes | Yes |
| API debugging guide | Yes | Yes |
| Auto-detect BC plugin | — | Yes |
| Shared knowledge base | — | Yes |
| Issue logging & recall | — | Yes |
| Cross-project pattern matching | — | Yes |

## Updating

```bash
cd bc-support-agent
git pull
bash install.sh   # re-run only if using Claude Code
```

## Structure

```
bc-support-agent/
  .github/
    copilot-instructions.md    # GitHub Agent Mode / Copilot instructions
  agents/
    bc-support.md              # Claude Code agent definition
  copilot/
    copilot-instructions.md    # Standalone copy for embedding in other repos
  install.sh                   # Bash installer (Claude Code)
  install.ps1                  # PowerShell installer (Claude Code)
  README.md
```
