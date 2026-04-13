# Evaluating AI Behavior
A collection of experiments to compare how different AI models respond to prompts, including what I've learned both [technically](documentation/Technical.md) and [generally](documentation/NonTechnical.md).

## Experiments
1. [Bad Advice](projects/project-1)
2. Playing Games & Cheating
3. Selective Truthfulness

## Getting Started
1. Install dependencies: `pnpm install`
2. Set up environment variables: `cp .env.example .env` and fill in your API keys
3. Run an evaluation: `pnpm select-scenario`
4. View results in the browser: `pnpm promptfoo view`

```
# Run scenario manually without cache:
pnpm promptfoo eval -c projects/path/file.yaml --no-cache
```