# RuleFoundry marketplace status

Last verified: **2026-07-28**

The GitHub Copilot plugin was submitted on **2026-07-19**. The ChatGPT and
Claude plugins were submitted on **2026-07-20**. OpenAI approved RuleFoundry
version 1.0.0 on **2026-07-21** and the publisher subsequently published it;
the public RuleFoundry directory page now exposes an `Install plugin` action.
Cursor confirmed on **2026-07-21** that the incorrectly attributed application
would be withdrawn. A corrected submission was created on **2026-07-28** and
is hidden while Cursor runs its security scan. Claude remains under review.
GitHub Copilot intake passed on **2026-07-28** and its issue is ready for
maintainer review. OpenAI is the only provider in this audit with a verified
public marketplace listing.
The public, tagged source packages in this repository are available for the
direct or local test paths described below; that availability is not a
marketplace listing.

| Surface | Source/test availability | Submission state | Public listing | Install link |
| --- | --- | --- | --- | --- |
| ChatGPT and Codex Plugins Directory | Codex can install the tagged GitHub package directly | Submitted 2026-07-20; approved 2026-07-21; now published | Available | [Install RuleFoundry](https://chatgpt.com/plugins/plugin_asdk_app_6a5cc3a722c08191a8d64f1ef30047d5) |
| Claude community marketplace | Claude Code can install the tagged GitHub package directly | Anthropic Console lists two RuleFoundry submissions, both `Submitted and pending review` | Not available | None |
| GitHub Copilot `awesome-copilot` marketplace | Copilot CLI can install the tagged GitHub subdirectory directly | [Submitted 2026-07-19; intake passed 2026-07-28; ready for maintainer review](https://github.com/github/awesome-copilot/issues/2353) | Not available | None |
| Cursor Directory | The Cursor package can be loaded locally for testing | [Corrected submission created 2026-07-28](https://cursor.directory/plugins/rulefoundry); security scan pending; hidden from the directory | Not available | None |

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

- [Cursor Directory submission](https://cursor.directory/plugins/rulefoundry):
  the signed-in publisher page reports that scanning is in progress and the
  plugin remains unpublished and hidden from the directory.
- [Anthropic `claude-plugins-official`](https://github.com/anthropics/claude-plugins-official)
  and [`claude-plugins-community`](https://github.com/anthropics/claude-plugins-community):
  no RuleFoundry entry; the signed-in Console lists two RuleFoundry submissions
  and marks both `Submitted and pending review`.
- [GitHub `awesome-copilot` review #2353](https://github.com/github/awesome-copilot/issues/2353):
  intake passed on 2026-07-28 and the open issue is labeled
  `ready-for-review`; no generated PR or accepted RuleFoundry listing exists.
- OpenAI: the signed-in portal shows RuleFoundry 1.0.0 as `Published`. The
  [public directory page](https://chatgpt.com/plugins/plugin_asdk_app_6a5cc3a722c08191a8d64f1ef30047d5)
  loads as `ChatGPT - RuleFoundry` and exposes `Install plugin`.
- Cursor: in Gmail thread `19f7a48b57b5e4cd`, Cursor confirmed on 2026-07-21
  that the incorrectly attributed submission would be withdrawn. On
  2026-07-28, the publisher created the corrected submission from
  `adammpolak/rulefoundry-plugins`; Cursor Directory now reports a pending
  security scan and says the plugin is unpublished and hidden.

Update this file at each state transition and include the submission receipt or
public listing URL as evidence.
