#!/usr/bin/env bash
# Installs or updates personal-skills plugin in Claude Code's local plugin directory.

set -euo pipefail

PLUGIN_DIR="$HOME/.claude/plugins/local/personal-skills"
REPO_URL="git@github.com:mvanzulli/personal-skills.git"

if [ -d "$PLUGIN_DIR/.git" ]; then
  echo "Updating personal-skills plugin..."
  git -C "$PLUGIN_DIR" pull --ff-only
  echo "Done. Restart Claude Code to pick up any skill changes."
else
  echo "Installing personal-skills plugin..."
  mkdir -p "$(dirname "$PLUGIN_DIR")"
  git clone "$REPO_URL" "$PLUGIN_DIR"
  echo "Done. Restart Claude Code to activate the skills."
fi
