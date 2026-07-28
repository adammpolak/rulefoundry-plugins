# RuleFoundry Extractions for Cursor

This Cursor plugin connects to RuleFoundry's OAuth-protected public MCP resource:

`https://app-api.rulefoundry.com/mcp/plugins`

Directory status: **published and publicly installable** at
<https://cursor.directory/plugins/rulefoundry>. The public listing exposes
`Add to Cursor`. Directory verification is not yet claimed; the owner menu
still offers a separate `Submit for verification` action.

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

For the public directory path, use the exact RuleFoundry listing above rather
than a generic directory home page. Local loading remains useful for package
testing and is separate from that public listing. See the repository
[marketplace status](../../MARKETPLACE_STATUS.md) for the latest verification
state.

Support: [adam@rulefoundry.com](mailto:adam@rulefoundry.com)

Privacy: <https://rulefoundry.com/privacy>

Terms: <https://rulefoundry.com/terms>
