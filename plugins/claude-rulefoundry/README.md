# RuleFoundry Extractions for Claude

Marketplace status: **submitted 2026-07-20; Anthropic review pending**. Direct
GitHub installation is available now, but RuleFoundry is not yet listed in
Anthropic's public plugin directory.

This public Apache-2.0 package connects
Claude Code and Cowork to RuleFoundry's production Streamable HTTP MCP plugin
resource:

`https://app-api.rulefoundry.com/mcp/plugins`

It can list accessible and assigned Extractions, show live status and RuleFoundry
app links, read engine-produced artifacts from completed Extractions, and create
one self or external-participant request after immediate confirmation. It cannot
resend, begin, conduct, resume, complete, modify, or delete an Extraction or
artifact. RuleFoundry sends the external notification automatically in that
single create action, and request creation does not consume quota. The Extraction
session itself remains in the RuleFoundry app. Exact retries reuse an opaque
idempotency key and cannot send a second email; app-equivalent input bounds and
per-user/recipient throttles apply.

## Install on Claude Code and Cowork

Claude Code supports macOS, Linux, and Windows. Install it with Anthropic's
recommended platform package if `claude` is not already available.

macOS or Linux:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Windows PowerShell:

```powershell
winget install Anthropic.ClaudeCode
```

Start Claude Code with `claude`, then run:

```text
/plugin marketplace add https://github.com/adammpolak/rulefoundry-plugins.git#v1.0.0
/plugin install claude-rulefoundry@rulefoundry
/reload-plugins
```

For Claude Cowork, open **Customize -> Plugins -> Add marketplace**, enter
`adammpolak/rulefoundry-plugins`, and install `claude-rulefoundry`. Cowork
prompts for RuleFoundry authentication when it enables the bundled connector.

These direct paths are separate from Anthropic's public directory review.
See Anthropic's official [Claude Code setup](https://code.claude.com/docs/en/getting-started),
[plugin marketplace](https://code.claude.com/docs/en/discover-plugins), and
[Cowork plugin](https://claude.com/docs/cowork/guide/plugins) documentation.

## Test locally

From this repository root:

```bash
claude plugin validate plugins/claude-rulefoundry
claude --plugin-dir ./plugins/claude-rulefoundry
```

In Claude Code, run `/mcp`. Approve the plugin-provided `rulefoundry` server,
choose authentication, sign in to RuleFoundry in the browser, and consent to the
four plugin scopes: `workspaces:read`, `extractions:read`, `extractions:write`,
and `artifacts:read`. Then run `/reload-plugins` or start a fresh session if the MCP
server was enabled after startup.

After Anthropic accepts the submission into the community marketplace, users
can instead install it with:

```text
/plugin install claude-rulefoundry@claude-plugins-official
```

No bearer token, OAuth client secret, or reviewer credential belongs in the
plugin or `.mcp.json`.

## Try it

- `List the Extractions I can access. Separate workspace Extractions from ones assigned to me.`
- `Find completed Extractions about approval rules and show the available artifacts.`
- `Use the completed artifact I select as context for this implementation plan and cite its URI.`
- `Show the unfinished Extraction I select with its status and app link only. Do not continue it or use it as source truth.`
- `Create an Extraction request for missing approval logic with me as the participant.` (must confirm exact values immediately before creation)

The server exposes six read tools plus one confirmed request-creation tool:

- `rulefoundry_list_workspaces`
- `rulefoundry_list_extractions`
- `rulefoundry_get_extraction`
- `rulefoundry_search_extractions`
- `rulefoundry_list_artifacts`
- `rulefoundry_read_artifact`
- `rulefoundry_create_extraction_request`

## Claude surfaces

The Plugin Directory submission covers Claude Code and Claude Cowork. The
plugin uses the same OAuth resource and server-enforced boundary on both
surfaces; directory acceptance does not add session-lifecycle or
artifact-mutation capability.

Support: [adam@rulefoundry.com](mailto:adam@rulefoundry.com)
Privacy: <https://rulefoundry.com/privacy>
Terms: <https://rulefoundry.com/terms>
