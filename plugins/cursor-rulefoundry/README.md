# RuleFoundry Extractions for Cursor

This Cursor plugin connects to RuleFoundry's OAuth-protected public MCP resource:

`https://app-api.rulefoundry.com/mcp/plugins`

It can find permitted workspaces and owned or assigned Extractions, return an
in-app URL for unfinished work, read completed engine-produced artifacts, and
create a new Extraction request after the user confirms the exact topic,
description, and participant. The actual Extraction session stays in the
RuleFoundry app.

It cannot begin, conduct, resume, complete, resend, modify, or delete an
Extraction or artifact. RuleFoundry automatically sends the participant email
when an external request is created; email is not a separate plugin action.

## Test locally

Place or symlink this package at:

```text
~/.cursor/plugins/local/cursor-rulefoundry
```

Restart Cursor, open Plugins, enable RuleFoundry Extractions, and authenticate
the bundled MCP server. The requested scopes are limited to
`workspaces:read`, `extractions:read`, `extractions:write`, and
`artifacts:read`.

After Cursor Marketplace review, install the public listing from
<https://cursor.com/marketplace>.

Support: [adam@rulefoundry.com](mailto:adam@rulefoundry.com)

Privacy: <https://rulefoundry.com/privacy>

Terms: <https://rulefoundry.com/terms>
