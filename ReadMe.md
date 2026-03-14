# Evaluating AI Safety
This repo uses [Promptfoo](https://www.promptfoo.dev/docs/category/configuration/) to compare how different AI models respond to prompts designed to test safety and alignment. Each project contains a write up describing take-aways.

> Aside from major version iterations, models undergo regular small updates. To avoid drift between answers, model versions should be pinned. Among the models used here, only Anthropic and OpenAI supported this feature. Meanwhile, other providers such as Google and XAI (Grok) only allowed selecting a major version. The most offensive case was DeepSeek, which did not support any version selection at all, using an alias to access its most recent version.

# Getting started
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


# Troubleshooting
* Logs are stored in `~/.promptfoo/logs` — they're thorough. 👌