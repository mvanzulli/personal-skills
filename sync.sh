#!/usr/bin/env bash
# Links every skill in this repo into ~/.claude/skills so it is available in all repos.
# Safe to run again: it refreshes the links and removes the ones that are stale.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/skills"
SKILLS_DST="$HOME/.claude/skills"

mkdir -p "$SKILLS_DST"

# Remove links that point into this repo but no longer have a source.
for link in "$SKILLS_DST"/*; do
  [ -L "$link" ] || continue
  target="$(readlink "$link")"
  case "$target" in
    "$SKILLS_SRC"/*)
      if [ ! -d "$target" ]; then
        echo "Removing stale link: $(basename "$link")"
        rm "$link"
      fi
      ;;
  esac
done

# Link each skill under the name declared in its SKILL.md front matter.
for dir in "$SKILLS_SRC"/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  name="$(sed -n 's/^name:[[:space:]]*//p' "$dir/SKILL.md" | head -1)"
  if [ -z "$name" ]; then
    echo "Skipping $(basename "$dir"): SKILL.md has no name in its front matter" >&2
    continue
  fi
  if [ -e "$SKILLS_DST/$name" ] && [ ! -L "$SKILLS_DST/$name" ]; then
    echo "Skipping $name: $SKILLS_DST/$name is a real directory, not a link" >&2
    continue
  fi
  ln -sfn "${dir%/}" "$SKILLS_DST/$name"
  echo "Linked $name -> ${dir%/}"
done

echo "Done. Restart Claude Code to pick up new or renamed skills."
