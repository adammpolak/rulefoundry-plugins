#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MCP_URL = "https://app-api.rulefoundry.com/mcp/plugins"
VERSION = "1.0.0"
LICENSE = "Apache-2.0"
TOOLS = {
    "rulefoundry_list_workspaces",
    "rulefoundry_list_extractions",
    "rulefoundry_get_extraction",
    "rulefoundry_search_extractions",
    "rulefoundry_list_artifacts",
    "rulefoundry_read_artifact",
    "rulefoundry_create_extraction_request",
}


def load(path: str) -> dict:
    target = ROOT / path
    if not target.is_file():
        raise SystemExit(f"missing required file: {path}")
    return json.loads(target.read_text(encoding="utf-8"))


def require(value: bool, message: str) -> None:
    if not value:
        raise SystemExit(message)


def main() -> None:
    codex = load("plugins/rulefoundry-extractions/.codex-plugin/plugin.json")
    codex_mcp = load("plugins/rulefoundry-extractions/.mcp.json")
    claude = load("plugins/claude-rulefoundry/.claude-plugin/plugin.json")
    claude_mcp = load("plugins/claude-rulefoundry/.mcp.json")
    copilot = load("plugins/copilot-rulefoundry/plugin.json")
    copilot_mcp = load("plugins/copilot-rulefoundry/.mcp.json")
    registry = load("plugins/copilot-rulefoundry/server.json")
    cursor = load("plugins/cursor-rulefoundry/.cursor-plugin/plugin.json")
    cursor_mcp = load("plugins/cursor-rulefoundry/mcp.json")
    codex_marketplace = load(".agents/plugins/marketplace.json")
    claude_marketplace = load(".claude-plugin/marketplace.json")
    cursor_marketplace = load(".cursor-plugin/marketplace.json")

    manifests = (codex, claude, copilot, cursor)
    for manifest in manifests:
        require(manifest.get("version") == VERSION, "all plugin versions must match the release")
        require(manifest.get("license") == LICENSE, "all plugins must use Apache-2.0")
        require(
            manifest.get("repository") == "https://github.com/adammpolak/rulefoundry-plugins",
            "all plugins must identify the public source repository",
        )

    for mcp in (codex_mcp, claude_mcp, copilot_mcp, cursor_mcp):
        server = mcp["mcpServers"]["rulefoundry"]
        require(server["url"] == MCP_URL, "all plugins must use the restricted public MCP resource")

    require(
        set(copilot_mcp["mcpServers"]["rulefoundry"]["tools"]) == TOOLS,
        "Copilot must allowlist exactly the seven public tools",
    )
    require(registry["version"] == VERSION, "MCP Registry version must match the release")
    require(
        registry["remotes"] == [{"type": "streamable-http", "url": MCP_URL}],
        "MCP Registry remote must identify the public endpoint",
    )
    require(codex_marketplace["name"] == "rulefoundry", "Codex marketplace name is incorrect")
    require(claude_marketplace["name"] == "rulefoundry", "Claude marketplace name is incorrect")
    require(cursor_marketplace["name"] == "rulefoundry", "Cursor marketplace name is incorrect")

    for skill in ROOT.glob("plugins/*/skills/use-rulefoundry-extractions/SKILL.md"):
        text = skill.read_text(encoding="utf-8")
        for phrase in (
            "confirmCreateAndSend: true",
            "idempotencyKey",
            "does not consume quota",
            "appUrl",
            "completed",
        ):
            require(phrase.lower() in text.lower(), f"{skill} is missing {phrase}")

    for path in ROOT.rglob("*"):
        if not path.is_file() or ".git" in path.parts:
            continue
        if path.suffix.lower() in {".png", ".jpg", ".jpeg", ".webp"}:
            continue
        text = path.read_text(encoding="utf-8")
        stale_license = "Proprie" + "tary"
        require(stale_license not in text, f"stale non-public license in {path}")
        private_repo_name = "rulefoundry" + "-app"
        require(private_repo_name not in text, f"private app repository reference in {path}")

    print("RuleFoundry public plugin validation passed")


if __name__ == "__main__":
    main()
