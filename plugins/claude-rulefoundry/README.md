# RuleFoundry for Claude

Get clear, accurate requirements from the people who know, in one conversation instead of rounds
of meetings, notes and follow-ups. RuleFoundry interviews your expert the way an experienced
consultant would: it asks the next useful question, pins down vague terms like "usually" or "large
order", and follows the exceptions until the rules are clear. Every rule links to where it was
said, and anything still unconfirmed stays an open question instead of a guess.

This plugin brings RuleFoundry into Claude (chat, Cowork and Claude Code):

- **Interview me.** Give a topic, such as how you approve refunds. RuleFoundry prepares the
  request, asks you once, and opens the interview beside the chat: talk it through by voice, or
  type where the microphone isn't available, and watch the rules appear.
- **Ask someone else.** Say who and what to cover; RuleFoundry emails them and runs the interview,
  and tells you if the email didn't get through.
- **See your Extractions.** In Claude chat the RuleFoundry library opens as an interactive card.
- **Build from it.** In Claude Code, read a Project's cited rules and implement, test or review code
  against them, with rule IDs next to the code, and send an Extraction for any open question
  instead of guessing.

## What it connects to

The plugin contains skills (instructions) and one remote MCP server reference. It runs no local
code. It connects to RuleFoundry's own MCP server over HTTPS (the interview beside the chat also
talks to the same RuleFoundry API and its voice connection directly, and uses your microphone
only once you start talking):

`https://app-api.rulefoundry.com/mcp/plugins`

You sign in to RuleFoundry with OAuth (PKCE) and approve four scopes: `workspaces:read`,
`extractions:read`, `extractions:write` and `artifacts:read`. Claude stores the token; the plugin
stores nothing. The server returns only what your RuleFoundry account can access: Extraction
titles, status and links, the business logic of finished Extractions, and a Project's knowledge
base. It never returns raw transcripts, passwords or billing data. Creating an Extraction request
always asks you first; a request for someone else sends them one RuleFoundry email. Nothing is
deleted or changed by the plugin.

## Install

In Claude, add RuleFoundry from the directory (**Customize > Plugins**), or in Claude Code:

```text
/plugin marketplace add adammpolak/rulefoundry-plugins
/plugin install rulefoundry@rulefoundry
```

Then run `/mcp`, choose the `rulefoundry` server and sign in to RuleFoundry in the browser.

## Try it

- `Interview me about how I decide which customer refunds to approve.`
- `Send an Extraction to my colleague about how she closes the books each month.`
- `Open my RuleFoundry library.`
- `Read the refund rules from my RuleFoundry Project and implement them in the returns service, with a test per rule.`

Support: [adam@rulefoundry.com](mailto:adam@rulefoundry.com) ·
Privacy: <https://rulefoundry.com/privacy> · Terms: <https://rulefoundry.com/terms>
