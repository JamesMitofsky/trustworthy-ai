# Evaluating AI Behavior
This repo is a collection of experiments using [Promptfoo](https://www.promptfoo.dev/docs/category/configuration/) to compare how different AI models respond to prompts. Each project has its own folder, containing its own short write-up explaining the experiment and results.

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


## Troubleshooting
* Logs are stored in `~/.promptfoo/logs` — they're thorough. 👌

