# RuleFoundry marketplace status

Last verified: **2026-07-20**

The GitHub Copilot plugin was submitted on **2026-07-19**. The ChatGPT, Claude,
and Cursor plugins were submitted on **2026-07-20**. All four are awaiting
review. No RuleFoundry plugin has been accepted by or verified live in a public
vendor marketplace.
The public, tagged source packages in this repository are available for the
direct or local test paths described below; that availability is not a
marketplace listing.

| Surface | Source/test availability | Submission state | Public listing | Install link |
| --- | --- | --- | --- | --- |
| ChatGPT and Codex Plugins Directory | Codex can install the tagged GitHub package directly | Submitted 2026-07-20; resubmitted with subtitle `Extract business logic`; OpenAI version 1.0.0 status `Review` | Not available | None |
| Claude community marketplace | Claude Code can install the tagged GitHub package directly | Submitted 2026-07-20; Anthropic Console confirmed `Plugin submitted for review` | Not available | None |
| GitHub Copilot `awesome-copilot` marketplace | Copilot CLI can install the tagged GitHub subdirectory directly | [Submitted 2026-07-19; awaiting review](https://github.com/github/awesome-copilot/issues/2353) | Not available | None |
| Cursor Marketplace | The Cursor package can be loaded locally for testing | Submitted 2026-07-20; Cursor confirmed `Thanks for applying` | Not available | None |

## Evidence rules

- `Draft` means vendor-portal fields may be saved, but the final submission has
  not been sent.
- `Submitted` requires a vendor confirmation or review URL and a recorded
  submission timestamp. A filled form or open Testing page is not submission.
- `Accepted / live` requires an official public listing URL and a successful
  install/authentication smoke from that listing.
- The public website must show `Submitted for review` while a submission is
  pending and must not show `Available` until `Accepted / live` is proven. Once
  proven, the relevant integration card must link directly to the official
  vendor install page, not to a generic marketplace home page.

## Official directories checked on 2026-07-20

- [Cursor Marketplace](https://cursor.com/marketplace): no RuleFoundry listing.
- [Anthropic `claude-plugins-community`](https://github.com/anthropics/claude-plugins-community): no RuleFoundry entry yet; the Console submission is awaiting review.
- [GitHub `awesome-copilot` review #2353](https://github.com/github/awesome-copilot/issues/2353): open and labeled `awaiting-review`; no accepted RuleFoundry listing yet.
- OpenAI: RuleFoundry version 1.0.0 was resubmitted with the subtitle
  `Extract business logic` and shows status `Review` in the OpenAI portal;
  there is no public directory listing yet.
- Cursor: the publisher application was submitted as the individual
  `adammpolak` using `adammpolak@gmail.com`; Cursor displayed `Thanks for
  applying` and has not published an install page yet.

Update this file at each state transition and include the submission receipt or
public listing URL as evidence.
