# RuleFoundry Extractions for GitHub Copilot

Marketplace status: **prepared, not submitted**. Direct GitHub installation is
available for testing, but RuleFoundry is not listed in the default
`awesome-copilot` marketplace.

This is a current-format GitHub Copilot plugin for browsing RuleFoundry
Extractions and using completed, engine-produced artifacts as cited source
material. It is not a legacy GitHub Copilot Extension or GitHub Marketplace App.

The bundled Streamable HTTP server is:

`https://app-api.rulefoundry.com/mcp/plugins`

The plugin can list permitted Extractions, return status and RuleFoundry app
links, read finalized artifacts, and create one self or external-participant
request after immediate confirmation. It cannot resend, begin, conduct, resume,
complete, modify, or delete an Extraction or artifact. RuleFoundry sends an
external participant notification automatically in that one create action, and
request creation does not consume quota. Exact retries reuse an opaque
idempotency key and cannot send a second email; app-equivalent input bounds and
per-user/recipient throttles apply.

## Install and authenticate

For local package validation:

```powershell
copilot plugin install .\plugins\copilot-rulefoundry
copilot plugin list
copilot mcp get rulefoundry
```

For a direct install after the repository is public:

```text
copilot plugin install adammpolak/rulefoundry-plugins:plugins/copilot-rulefoundry
```

After the plugin is accepted into the default `awesome-copilot` marketplace:

```text
copilot plugin install rulefoundry-extractions@awesome-copilot
```

Start a fresh Copilot session. If the server shows `needs-auth`, run
`/mcp auth rulefoundry`, sign in to RuleFoundry in the browser, and approve the
four plugin scopes: `workspaces:read`, `extractions:read`, `extractions:write`,
and `artifacts:read`. No bearer token, OAuth client secret, or reviewer credential
belongs in this package.

Remote OAuth is for interactive Copilot CLI and IDE use. GitHub Copilot's cloud
coding agent does not currently support OAuth-authenticated remote MCP servers,
so this package must not claim cloud-agent compatibility or add a static token
fallback.

## Try it

- `List the Extractions I can access. Separate workspace Extractions from ones assigned to me.`
- `Find completed Extractions about approval rules and show the available artifacts.`
- `Use the completed artifact I select as context for this implementation plan and cite its URI.`
- `Show the unfinished Extraction I select with its status and app link only. Do not continue it or use it as source truth.`
- `Create an Extraction request for missing approval logic with me as the participant.` (must confirm exact values immediately before creation)

The only server tools bundled in `.mcp.json` are:

- `rulefoundry_list_workspaces`
- `rulefoundry_list_extractions`
- `rulefoundry_get_extraction`
- `rulefoundry_search_extractions`
- `rulefoundry_list_artifacts`
- `rulefoundry_read_artifact`
- `rulefoundry_create_extraction_request`

## Distribution files

- `plugin.json` is the Copilot plugin manifest.
- `.mcp.json` pins the production plugin MCP resource and the seven allowed
  tools.
- `skills/use-rulefoundry-extractions/SKILL.md` defines selection, citation, and
  unfinished-session guardrails.
- `server.json` is the official MCP Registry descriptor for this public remote
  server. Publishing it is a separate manual registry action.

The community default-marketplace route reviews this external plugin from the
public GitHub source and immutable release tag. The plugin never includes a
static token fallback.

Support: [adam@rulefoundry.com](mailto:adam@rulefoundry.com)
Privacy: <https://rulefoundry.com/privacy>
Terms: <https://rulefoundry.com/terms>
