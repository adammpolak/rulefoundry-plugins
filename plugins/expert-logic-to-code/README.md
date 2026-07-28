# Expert Logic to Code for GitHub Copilot

Turn expert decision logic already available in a repository, issue, document,
or chat into implementation-ready outputs without inventing missing rules.

Examples:

- Get Dan's test-data generation rules from `docs/testing-rules.md` and turn
  them into edge-case fixtures for this repository.
- Use April's classification reasoning in `specs/classification.yaml` to build
  a classification skill with abstention rules and evaluation cases.
- Convert the pricing-approval decision table in issue #412 into executable
  acceptance tests with source-rule traceability.
- Compare two experts' exception rules, identify conflicts, and produce the
  questions that must be resolved before implementation.

The plugin works from pasted text and repository-local Markdown, JSON, YAML,
CSV, source code, or issue content. It requires no account, signup, remote
service, API key, or MCP server, and it does not transmit source material.

## Install

```text
copilot plugin install adammpolak/rulefoundry-plugins:plugins/expert-logic-to-code
```

Start a fresh Copilot session and ask for a concrete deliverable. Copilot will
inventory the source rules, preserve citations, separate confirmed logic from
gaps, and create only the code or artifacts requested.

## Outputs

Depending on the task, the skill can produce:

- edge-case matrices and executable test fixtures;
- ordered classification rules, abstention behavior, and eval cases;
- implementation plans and code tied to stable rule IDs;
- acceptance criteria, decision tables, and SOP steps; or
- a conflict and missing-information report when the source is not sufficient.

The skill never manufactures an expert decision. Missing, ambiguous, or
conflicting logic remains visibly unresolved.

Maintained by Vertex Inc., the company behind RuleFoundry. RuleFoundry is not
required to install or use this plugin.
