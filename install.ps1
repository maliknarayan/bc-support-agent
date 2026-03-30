#
# BC Support Agent — Installer (Windows PowerShell)
# Installs the bc-support agent into your Claude Code configuration.
#

$ErrorActionPreference = "Stop"

$ClaudeDir = "$env:USERPROFILE\.claude"
$AgentsDir = "$ClaudeDir\agents"
$KBDir = "$ClaudeDir\bc-support\issues"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$AgentSrc = "$ScriptDir\agents\bc-support.md"

Write-Host "=== BC Support Agent — Installer ===" -ForegroundColor Cyan
Write-Host ""

# Check source exists
if (-not (Test-Path $AgentSrc)) {
    Write-Host "ERROR: Agent file not found at $AgentSrc" -ForegroundColor Red
    Write-Host "Run this script from the bc-support-agent repo root."
    exit 1
}

# Create directories
New-Item -ItemType Directory -Force -Path $AgentsDir | Out-Null
New-Item -ItemType Directory -Force -Path $KBDir | Out-Null

# Copy agent file
Copy-Item $AgentSrc "$AgentsDir\bc-support.md" -Force
Write-Host "[OK] Agent installed to $AgentsDir\bc-support.md" -ForegroundColor Green

# Create knowledge base index if it doesn't exist
if (-not (Test-Path "$KBDir\INDEX.md")) {
    "# BC Support — Issue History`n" | Out-File -FilePath "$KBDir\INDEX.md" -Encoding utf8
    Write-Host "[OK] Knowledge base initialized at $KBDir\" -ForegroundColor Green
} else {
    Write-Host "[OK] Knowledge base already exists at $KBDir\" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== Installation complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Usage:"
Write-Host "  - The 'bc-support' agent is now available in all your Claude Code projects"
Write-Host "  - Navigate to any WordPress project with a BC integration plugin and use it"
Write-Host "  - Issue history is shared across all projects at: $KBDir\"
Write-Host ""
Write-Host "To update: pull the latest repo and run this script again."
