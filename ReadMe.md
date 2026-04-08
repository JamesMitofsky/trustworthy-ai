# Evaluating AI Behavior
A collection of experiments to compare how different AI models respond to prompts.
* [Project 1 — Bad Advice](projects/project-1)
* Project 2 - Playing Games & Cheating
* Project 3 — Selective Truthfulness

## Reflections
* [Non-technical, systems-level](documentation/NonTechnical.md).
* [Technical](documentation/Technical.md).

##  Getting started
1.  Install [Promptfoo](https://www.promptfoo.dev/docs/category/configuration/). I had trouble with node 24; run `nvm use 22`.
```bash
pnpm install promptfoo
```
2.  Update `.env.example` to be `.env`. Add API keys. Note: These env names are sacred to [PF's expected format](https://www.promptfoo.dev/docs/providers/).
3.  Navigate to the desired directory (this is how PromptFoo finds the right suite) and run the init:
```bash
pnpm launch
```
1.  Subsequent evaluations should use:
```bash
pnpm test
```
