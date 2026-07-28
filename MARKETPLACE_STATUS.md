# RuleFoundry marketplace status

Last verified: **2026-07-28**

The GitHub Copilot plugin was submitted on **2026-07-19**. The ChatGPT and
Claude plugins were submitted on **2026-07-20**. OpenAI approved RuleFoundry
version 1.0.0 on **2026-07-21** and the publisher subsequently published it;
the public RuleFoundry directory page now exposes an `Install plugin` action.
Cursor confirmed on **2026-07-21** that the incorrectly attributed application
would be withdrawn. A corrected submission was created on **2026-07-28** and
is now published with a public `Add to Cursor` action; directory verification
is not yet claimed. Claude remains under review. GitHub Copilot intake passed
on **2026-07-28**, but an `awesome-copilot` maintainer then rejected and closed
the submission because it was viewed as centered on funneling users into a paid
service. OpenAI and Cursor now have verified public directory install paths.
The public, tagged source packages in this repository are available for the
direct or local test paths described below; that availability is not a
marketplace listing.

| Surface | Source/test availability | Submission state | Public listing | Install link |
| --- | --- | --- | --- | --- |
| ChatGPT and Codex Plugins Directory | Codex can install the tagged GitHub package directly | Submitted 2026-07-20; approved 2026-07-21; now published | Available | [Install RuleFoundry](https://chatgpt.com/plugins/plugin_asdk_app_6a5cc3a722c08191a8d64f1ef30047d5) |
| Claude community marketplace | Claude Code can install the tagged GitHub package directly | Anthropic Console lists two RuleFoundry submissions, both `Submitted and pending review` | Not available | None |
| GitHub Copilot `awesome-copilot` marketplace | Copilot CLI can install the tagged GitHub subdirectory directly | [Rejected and closed 2026-07-28](https://github.com/github/awesome-copilot/issues/2353#issuecomment-5100469318) after intake passed | Not available | None |
| Cursor Directory | The Cursor package can be loaded locally or inspected in the public source repository | Published 2026-07-28; directory verification is not yet claimed | Available | [Install RuleFoundry](https://cursor.directory/plugins/rulefoundry) |

## Evidence rules

- `Draft` means vendor-portal fields may be saved, but the final submission has
  not been sent.
- `Submitted` requires a vendor confirmation or review URL and a recorded
  submission timestamp. A filled form or open Testing page is not submission.
- `Approved / publication pending` requires explicit provider acceptance but
  is not public availability while a separate publisher action remains.
- `Accepted / live` requires an official public listing URL and a successful
  install/authentication smoke from that listing.
- The public website must show `Submitted for review` while a submission is
  pending and must not show `Available` until `Accepted / live` is proven. Once
  proven, the relevant integration card must link directly to the official
  vendor install page, not to a generic marketplace home page.

## Official directories checked on 2026-07-28

- [Cursor Directory listing](https://cursor.directory/plugins/rulefoundry):
  the public page exposes `Add to Cursor`. The signed-in owner menu exposes
  `Unpublish`, proving the listing is published, and separately offers `Submit
  for verification`, so no verification badge or endorsement is claimed.
- [Anthropic `claude-plugins-official`](https://github.com/anthropics/claude-plugins-official)
  and [`claude-plugins-community`](https://github.com/anthropics/claude-plugins-community):
  no RuleFoundry entry; the signed-in Console lists two RuleFoundry submissions
  and marks both `Submitted and pending review`.
- [GitHub `awesome-copilot` review #2353](https://github.com/github/awesome-copilot/issues/2353):
  intake passed on 2026-07-28, then a maintainer rejected the plugin as
  centered on funneling users into a paid service. The issue is closed and
  labeled `rejected`; no generated PR or accepted RuleFoundry listing exists.
- OpenAI: the signed-in portal shows RuleFoundry 1.0.0 as `Published`. The
  [public directory page](https://chatgpt.com/plugins/plugin_asdk_app_6a5cc3a722c08191a8d64f1ef30047d5)
  loads as `ChatGPT - RuleFoundry` and exposes `Install plugin`.
- Cursor: in Gmail thread `19f7a48b57b5e4cd`, Cursor confirmed on 2026-07-21
  that the incorrectly attributed submission would be withdrawn. On
  2026-07-28, the publisher created the corrected submission from
  `adammpolak/rulefoundry-plugins`; the Cursor Directory listing is now public
  and exposes its install action.

Update this file at each state transition and include the submission receipt or
public listing URL as evidence.
