# Project Name

> Created from [project-template](https://github.com/AITakeoverComing/project-template)

## Development Workflow

1. **Coding**: Use Conductor to spawn Claude Code agents
2. **Branching**: All work happens on feature branches
3. **Review**: PRs are auto-reviewed by Gemini Code Assist + Graphite
4. **Merge**: After AI + human approval, merge to main

## Getting Started

```bash
# Install dependencies (varies by project type)
npm install  # or pip install -r requirements.txt

# Run development server
npm run dev  # or python main.py
```

## Structure

```
├── .github/
│   ├── workflows/ci.yml    # Automated checks
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── CODEOWNERS
├── src/                    # Source code
└── README.md
```
