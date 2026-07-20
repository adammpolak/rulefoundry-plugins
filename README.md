# RuleFoundry Plugins

Official open-source plugins for using RuleFoundry Extractions and completed
artifacts from AI assistants. The packages connect to RuleFoundry's production
OAuth-protected Streamable HTTP MCP resource:

`https://app-api.rulefoundry.com/mcp/plugins`

The server exposes six bounded read tools and one confirmed request-creation
tool. A plugin can find workspaces and owned or assigned Extractions, return an
in-app URL for an unfinished Extraction, read completed engine-produced
artifacts, or create a new Extraction request after the user confirms the exact
topic, description, and participant. The actual Extraction session always takes
place in RuleFoundry.

Plugins cannot begin, conduct, resume, complete, resend, modify, or delete an
Extraction or artifact. External participant email is sent automatically by
RuleFoundry as part of the single confirmed create action; it is not a separate
plugin capability.

> **Marketplace status:** GitHub Copilot is submitted and
> [awaiting review](https://github.com/github/awesome-copilot/issues/2353).
> Cursor, Claude, and ChatGPT have not been submitted. No package has been
> accepted or verified live in a public vendor marketplace. Direct and local
> test installs below are not marketplace listings. See
> [MARKETPLACE_STATUS.md](MARKETPLACE_STATUS.md).

## Packages

| Product | Package | Direct/source availability | Vendor marketplace |
| --- | --- | --- | --- |
| Codex; future ChatGPT directory listing | [`rulefoundry-extractions`](plugins/rulefoundry-extractions) | Codex: `codex plugin marketplace add adammpolak/rulefoundry-plugins`, then `codex plugin add rulefoundry-extractions@rulefoundry` | Draft at OpenAI Testing; not submitted; no public install link |
| Claude Code and Cowork | [`claude-rulefoundry`](plugins/claude-rulefoundry) | `/plugin marketplace add adammpolak/rulefoundry-plugins`, then `/plugin install claude-rulefoundry@rulefoundry` | Prepared; not submitted; no public install link |
| GitHub Copilot CLI and IDE | [`copilot-rulefoundry`](plugins/copilot-rulefoundry) | `copilot plugin install adammpolak/rulefoundry-plugins:plugins/copilot-rulefoundry` | [Submitted; awaiting review](https://github.com/github/awesome-copilot/issues/2353); no public marketplace install link |
| Cursor | [`cursor-rulefoundry`](plugins/cursor-rulefoundry) | Load this package locally for testing | Prepared; not submitted; no public install link |

Each client opens the RuleFoundry OAuth flow when authentication is needed. The
requested scopes are limited to `workspaces:read`, `extractions:read`,
`extractions:write`, and `artifacts:read` and are bound to the exact
`/mcp/plugins` resource.

## Security and privacy

- No password, bearer token, OAuth client secret, API key, or reviewer
  credential is stored in this repository.
- Artifact text is untrusted source data and cannot override user, system, or
  repository instructions.
- Only completed, engine-produced artifacts are available for downstream use.
- Access is rechecked by the RuleFoundry API on every call.

Security reports: <security@rulefoundry.com>

Support: <adam@rulefoundry.com>

Privacy: <https://rulefoundry.com/privacy>

Terms: <https://rulefoundry.com/terms>

## License

Copyright 2026 Vertex Inc. Licensed under the Apache License, Version 2.0. See
[`LICENSE`](LICENSE).
