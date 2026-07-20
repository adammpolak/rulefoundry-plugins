# RuleFoundry Extractions

RuleFoundry Extractions is the public RuleFoundry plugin for ChatGPT and Codex. It connects to the OAuth-protected MCP endpoint at:

`https://app-api.rulefoundry.com/mcp/plugins`

Marketplace status: **submitted 2026-07-20; OpenAI version 1.0.0 is in
Review**. The direct installation below is for Codex and is not a public
ChatGPT directory listing.

The plugin can list permitted Extractions, return the RuleFoundry app URL for unfinished sessions, read finalized artifacts, and create one self or external-participant request after immediate confirmation of its exact topic, description, and participant. External participant notification is automatic during creation. A fresh opaque idempotency key makes exact retries safe, while app-equivalent input limits and external-request throttles prevent duplicate or abusive sends. Creating a request does not consume quota. The plugin cannot resend, begin, conduct, resume, complete, modify, or delete a session or artifact.

OAuth is bound to this exact resource, requires it explicitly during authorization and token exchange, and requests only `workspaces:read`, `extractions:read`, `extractions:write`, and `artifacts:read`.

## Install

Add the RuleFoundry marketplace and install the plugin:

```bash
codex plugin marketplace add adammpolak/rulefoundry-plugins --ref v1.0.0
codex plugin add rulefoundry-extractions@rulefoundry
```

Then start a new chat and complete RuleFoundry OAuth when prompted.

## Local validation

```bash
python3 ~/.codex/skills/.system/plugin-creator/scripts/validate_plugin.py plugins/rulefoundry-extractions
```

For an authenticated client smoke test, install the package, complete RuleFoundry OAuth, and start a fresh chat. Useful prompts:

- `Show the Extractions assigned to me.`
- `Find completed Extractions about approval rules.`
- `List and read the finalized artifacts for the selected Extraction.`
- `Create an Extraction request about approval precedence for me.` (must confirm exact topic, description, and self participant immediately before creation)
- `Continue this unfinished Extraction.` (must return the RuleFoundry app URL and explain the boundary)

## ChatGPT publication

OpenAI scans the production MCP endpoint directly for the ChatGPT app and
plugin review. This package is the public source for its manifest, skill bundle,
logo, prompts, and MCP configuration; it contains no credentials or static OAuth
client secret.
