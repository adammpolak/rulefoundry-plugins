# RuleFoundry marketplace status

Last verified: **2026-07-22**

The GitHub Copilot plugin was submitted on **2026-07-19**. The ChatGPT and
Claude plugins were submitted on **2026-07-20**. OpenAI approved ChatGPT
version 1.0.0 on **2026-07-21**, but it still requires the publisher's explicit
Publish action and has no public listing. Cursor confirmed on **2026-07-21**
that the incorrectly attributed application will be withdrawn; no corrected
application has been submitted. Claude and GitHub Copilot remain under review.
No RuleFoundry plugin has been verified live in a public vendor marketplace.
The public, tagged source packages in this repository are available for the
direct or local test paths described below; that availability is not a
marketplace listing.

| Surface | Source/test availability | Submission state | Public listing | Install link |
| --- | --- | --- | --- | --- |
| ChatGPT and Codex Plugins Directory | Codex can install the tagged GitHub package directly | Submitted 2026-07-20; OpenAI approved version 1.0.0 on 2026-07-21; publisher Publish action still required | Not available | None |
| Claude community marketplace | Claude Code can install the tagged GitHub package directly | Submitted 2026-07-20; Anthropic Console confirmed `Plugin submitted for review` | Not available | None |
| GitHub Copilot `awesome-copilot` marketplace | Copilot CLI can install the tagged GitHub subdirectory directly | [Submitted 2026-07-19; awaiting review](https://github.com/github/awesome-copilot/issues/2353) | Not available | None |
| Cursor Marketplace | The Cursor package can be loaded locally for testing | Incorrectly attributed application withdrawn; corrected application not submitted | Not available | None |

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

## Official directories checked on 2026-07-22

- [Cursor Marketplace](https://cursor.com/marketplace): no RuleFoundry listing.
- [Anthropic `claude-plugins-official`](https://github.com/anthropics/claude-plugins-official): no RuleFoundry entry yet; the Console submission is awaiting review.
- [GitHub `awesome-copilot` review #2353](https://github.com/github/awesome-copilot/issues/2353): open and labeled `awaiting-review`; no accepted RuleFoundry listing yet.
- OpenAI: the 2026-07-21 approval notice says RuleFoundry 1.0.0 is approved and
  ready to publish. On 2026-07-22 the OpenAI portal showed status `Approved`
  and a separate `Publish` action; the public ChatGPT plugin directory still
  had no RuleFoundry listing.
- Cursor: in Gmail thread `19f7a48b57b5e4cd`, Cursor confirmed on 2026-07-21
  that the incorrectly attributed submission will be withdrawn. The original
  retraction request explicitly states that no corrected application was
  submitted. Cursor Marketplace still had no RuleFoundry listing.

Update this file at each state transition and include the submission receipt or
public listing URL as evidence.
