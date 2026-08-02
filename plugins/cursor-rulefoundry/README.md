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

## Install

The easiest path is the public
[RuleFoundry Cursor Directory listing](https://cursor.directory/plugins/rulefoundry).

For a local source install, download and inspect the installer for your
platform before running it. The scripts fetch the immutable `v1.0.0` package,
copy it to Cursor's local-plugin directory, and retain any previous install as
a timestamped backup.

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

To test a checkout manually, place a real copy of this package at:

```text
~/.cursor/plugins/local/cursor-rulefoundry
```

On Windows, the equivalent path is
`%USERPROFILE%\.cursor\plugins\local\cursor-rulefoundry`. Restart Cursor or
run `Developer: Reload Window`, open Plugins, enable RuleFoundry Extractions, and authenticate
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
