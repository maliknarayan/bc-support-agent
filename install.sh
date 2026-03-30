#!/usr/bin/env bash
#
# BC Support Agent — Installer
# Installs the bc-support agent into your Claude Code configuration.
#

set -e

CLAUDE_DIR="$HOME/.claude"
AGENTS_DIR="$CLAUDE_DIR/agents"
KB_DIR="$CLAUDE_DIR/bc-support/issues"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
AGENT_SRC="$SCRIPT_DIR/agents/bc-support.md"

echo "=== BC Support Agent — Installer ==="
echo ""

# Check source exists
if [ ! -f "$AGENT_SRC" ]; then
    echo "ERROR: Agent file not found at $AGENT_SRC"
    echo "Run this script from the bc-support-agent repo root."
    exit 1
fi

# Create directories
mkdir -p "$AGENTS_DIR"
mkdir -p "$KB_DIR"

# Copy agent file
cp "$AGENT_SRC" "$AGENTS_DIR/bc-support.md"
echo "[OK] Agent installed to $AGENTS_DIR/bc-support.md"

# Create knowledge base index if it doesn't exist
if [ ! -f "$KB_DIR/INDEX.md" ]; then
    echo "# BC Support — Issue History" > "$KB_DIR/INDEX.md"
    echo "" >> "$KB_DIR/INDEX.md"
    echo "[OK] Knowledge base initialized at $KB_DIR/"
else
    echo "[OK] Knowledge base already exists at $KB_DIR/"
fi

echo ""
echo "=== Installation complete ==="
echo ""
echo "Usage:"
echo "  - The 'bc-support' agent is now available in all your Claude Code projects"
echo "  - Navigate to any WordPress project with a BC integration plugin and use it"
echo "  - Issue history is shared across all projects at: $KB_DIR/"
echo ""
echo "To update: pull the latest repo and run this script again."
