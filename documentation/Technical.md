# Technical Documentation


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

## The Importance of Version Pinning
Aside from major version iterations, models undergo regular small updates. To avoid drift between answers, model versions should be pinned. Among the models used here, only Anthropic and OpenAI supported this feature. Meanwhile, other providers such as Google and XAI (Grok) only allowed selecting a major version. The most offensive case was DeepSeek, which did not support any version selection at all, using an alias to access its most recent version.


## Awesome PromptFood Config Features
* [Basic rejection refusal](https://www.promptfoo.dev/docs/red-team/strategies/best-of-n/): replace an LLM judge with a basic refusal check. Avoid the cost of using using a LLM judge by using a simple refusal check to verify if the LLM bowed out of a task.

```yaml
strategies:
  - id: best-of-n
    config:
      useBasicRefusal: true # Use simple refusal check instead of LLM judge
      maxConcurrency: 8 # Maximum concurrent API calls (default is 3) - read more about this
      # maxCandidatesPerStep: 1 # Maximum candidates per batch (optional) - what is this?
```

## Justification for Model Selection
These models were chosen for being relatively recent while also being classed in similar tiers by their providers. The tiering is important because I wanted to avoid a situation where Google's frontier models would be pitted against Anthropic's mid-tier model. Likewise, I didn't want to pit a mid-tier model against another similarly classed model but when they were released far apart in time.

Here's an example grouping:
- OpenAI GPT-5.1 (2025-11-13)
- Google Gemini 3 Flash Preview
- Anthropic Claude Sonnet 4.5 (2025-09-29)
- DeepSeek V3.2
- XAI Grok 4.1 Fast Reasoning
- Mistral Large (2512)
 
## Troubleshooting
* Logs are stored in `~/.promptfoo/logs` — they're thorough. 👌

