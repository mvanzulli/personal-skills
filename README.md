# personal-skills

A Claude Code plugin with personal productivity skills.

## Skills

| Skill | Trigger | Description |
|-------|---------|-------------|
| **caveman** | "caveman mode", "less tokens", `/caveman` | Ultra-compressed ~75% token reduction while keeping full technical accuracy |
| **challenge-me** | "challenge my design", "grill me", "stress-test this plan" | Relentless interviewing that walks every branch of a design tree one question at a time |
| **request-refactor-plan** | "plan a refactor", "create a refactoring RFC" | User interview → tiny-commit plan → GitHub issue using the Fowler method |
| **write-a-skill** | "create a skill", "write a new skill" | Guided skill authoring with structure, description, and eval guidance |

## Installation

```bash
# Clone into Claude's local plugin directory
git clone git@github.com:mvanzulli/personal-skills.git ~/.claude/plugins/local/personal-skills
```

Then restart Claude Code. The skills will be available immediately.

## Updating

```bash
~/.claude/plugins/local/personal-skills/sync.sh
```

Or manually:

```bash
cd ~/.claude/plugins/local/personal-skills && git pull
```

## Structure

This repo follows the Claude Code plugin format:

```
personal-skills/
├── .claude-plugin/
│   └── plugin.json       # Plugin metadata
├── skills/
│   ├── caveman/
│   │   └── SKILL.md
│   ├── challenge-me/
│   │   └── SKILL.md
│   ├── refactor-plan/
│   │   └── SKILL.md
│   └── write-skill/
│       └── SKILL.md
├── sync.sh               # Pull latest from GitHub
├── LICENSE
└── README.md
```

## License

MIT
