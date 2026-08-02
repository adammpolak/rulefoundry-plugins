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

> **Marketplace status:** RuleFoundry 1.0.0 is published and
> [publicly installable in ChatGPT](https://chatgpt.com/plugins/plugin_asdk_app_6a5cc3a722c08191a8d64f1ef30047d5).
> Codex uses the separate direct GitHub install documented below; no separate
> Codex directory approval is claimed.
> [Cursor Directory](https://cursor.directory/plugins/rulefoundry) is also
> published with an `Add to Cursor` action, although directory verification is
> not yet claimed. Claude remains under review. A separate free, offline
> `expert-logic-to-code` GitHub Copilot community plugin passed intake, but its
> [marketplace submission was closed without
> approval](https://github.com/github/awesome-copilot/issues/2353); the
> connected RuleFoundry package remains a direct install. Direct and local
> installs below remain separate from provider marketplace listings. See
> [MARKETPLACE_STATUS.md](MARKETPLACE_STATUS.md).

## Packages

| Product | Package | Direct/source availability | Vendor marketplace |
| --- | --- | --- | --- |
| ChatGPT and Codex | [`rulefoundry-extractions`](plugins/rulefoundry-extractions) | Codex: `codex plugin marketplace add adammpolak/rulefoundry-plugins`, then `codex plugin add rulefoundry-extractions@rulefoundry` | [ChatGPT published and available](https://chatgpt.com/plugins/plugin_asdk_app_6a5cc3a722c08191a8d64f1ef30047d5); Codex remains a separate direct source install |
| Claude Code and Cowork | [`claude-rulefoundry`](plugins/claude-rulefoundry) | `/plugin marketplace add adammpolak/rulefoundry-plugins`, then `/plugin install claude-rulefoundry@rulefoundry` | Submitted 2026-07-20; Anthropic review pending; no public install link |
| GitHub Copilot CLI and IDE | [`copilot-rulefoundry`](plugins/copilot-rulefoundry) | `copilot plugin install adammpolak/rulefoundry-plugins:plugins/copilot-rulefoundry` | Separate offline community plugin [submission closed without approval](https://github.com/github/awesome-copilot/issues/2353); no public marketplace install link |
| Cursor | [`cursor-rulefoundry`](plugins/cursor-rulefoundry) | Use the Bash or PowerShell installer below for a local source install | [Published and available from Cursor Directory](https://cursor.directory/plugins/rulefoundry); directory verification is not yet claimed |

## Quick install for Cursor and GitHub Copilot

Cursor users should normally use the public
[Cursor Directory listing](https://cursor.directory/plugins/rulefoundry). If
that route is unavailable, download and inspect the platform installer before
running it. Both installers fetch the immutable `v1.0.0` package, install it at
Cursor's supported local-plugin path, and retain the previous install as a
timestamped backup.

macOS or Linux:

```bash
curl -fsSLO https://raw.githubusercontent.com/adammpolak/rulefoundry-plugins/main/scripts/install-cursor.sh
bash install-cursor.sh
```

Windows PowerShell:

```powershell
Invoke-WebRequest https://raw.githubusercontent.com/adammpolak/rulefoundry-plugins/main/scripts/install-cursor.ps1 -OutFile install-cursor.ps1
Unblock-File .\install-cursor.ps1
.\install-cursor.ps1
```

GitHub Copilot CLI has a native cross-platform repository installer, so no
wrapper script is needed:

```text
copilot plugin install adammpolak/rulefoundry-plugins:plugins/copilot-rulefoundry
copilot plugin list
```

The separate free, offline workflow package can be installed with:

```text
copilot plugin install adammpolak/rulefoundry-plugins:plugins/expert-logic-to-code
```

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
