# personal-skills

Personal Claude Code skills, linked into `~/.claude/skills` so they are available in every repo.

## Skills

| Skill | Trigger | Description |
|-------|---------|-------------|
| **challenge-me** | "challenge my design", "grill me", "stress-test this plan" | Relentless interviewing that walks every branch of a design tree one question at a time |
| **domain-modeling** | discussing codebase terminology, writing `CONTEXT.md`, recording an ADR | Challenges fuzzy terms, keeps a glossary in `CONTEXT.md`, and records decisions as ADRs ([upstream](https://github.com/mattpocock/skills)) |
| **request-refactor-plan** | "plan a refactor", "create a refactoring RFC" | User interview → tiny-commit plan → GitHub issue using the Fowler method |
| **write-a-skill** | "create a skill", "write a new skill" | Guided skill authoring with structure, description, and eval guidance |

## Installation

Clone the repo anywhere, then run the sync script:

```bash
git clone git@github.com:mvanzulli/personal-skills.git ~/Repos/personal/skills
~/Repos/personal/skills/sync.sh
```

`sync.sh` puts a symbolic link in `~/.claude/skills` for each skill. Claude Code reads
that directory for every project, so the skills work in all repos. Restart Claude Code
after the first run.

## Updating

Edit a `SKILL.md` in this repo and the change is live immediately, because the links
point at the working tree. There is no copy step.

Run `sync.sh` again only when you add a skill, remove a skill, or change a `name:` in
front matter:

```bash
git pull && ./sync.sh
```

## Adding a skill

1. Make a folder under `skills/` with a `SKILL.md` in it.
2. Give the `SKILL.md` front matter a `name:` and a `description:`.
3. Run `./sync.sh`.

The link takes the `name:` from the front matter, not the folder name. `refactor-plan/`
declares `name: request-refactor-plan`, so it is linked as `request-refactor-plan`.

## Structure

```
personal-skills/
├── skills/
│   ├── challenge-me/
│   │   └── SKILL.md
│   ├── domain-modeling/
│   │   ├── SKILL.md
│   │   ├── CONTEXT-FORMAT.md
│   │   └── ADR-FORMAT.md
│   ├── refactor-plan/
│   │   └── SKILL.md
│   └── write-skill/
│       └── SKILL.md
├── sync.sh               # Link the skills into ~/.claude/skills
├── LICENSE
└── README.md
```

## License

MIT

The `domain-modeling` skill comes from [mattpocock/skills](https://github.com/mattpocock/skills), MIT © 2026 Matt Pocock.
