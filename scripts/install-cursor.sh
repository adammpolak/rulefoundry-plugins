#!/usr/bin/env bash

set -euo pipefail

plugin_name="cursor-rulefoundry"
version="${RULEFOUNDRY_PLUGIN_VERSION:-v1.0.0}"
install_root="${CURSOR_PLUGIN_HOME:-${HOME}/.cursor/plugins/local}"
archive_url="${RULEFOUNDRY_PLUGIN_ARCHIVE_URL:-https://github.com/adammpolak/rulefoundry-plugins/archive/refs/tags/${version}.tar.gz}"
target="${install_root}/${plugin_name}"
staging="${install_root}/.${plugin_name}.install.$$"
temp_dir="$(mktemp -d "${TMPDIR:-/tmp}/rulefoundry-cursor.XXXXXX")"

cleanup() {
  rm -rf -- "${temp_dir}"
  if [[ -e "${staging}" ]]; then
    rm -rf -- "${staging}"
  fi
}
trap cleanup EXIT

for command_name in curl tar; do
  if ! command -v "${command_name}" >/dev/null 2>&1; then
    echo "Missing required command: ${command_name}" >&2
    exit 1
  fi
done

mkdir -p -- "${install_root}"
archive_path="${temp_dir}/rulefoundry-plugins.tar.gz"

echo "Downloading RuleFoundry Cursor plugin ${version}..."
curl --fail --location --silent --show-error --retry 3 \
  "${archive_url}" \
  --output "${archive_path}"
tar -xzf "${archive_path}" -C "${temp_dir}"

source_dir="$(find "${temp_dir}" -type d -path "*/plugins/${plugin_name}" -print -quit)"
if [[ -z "${source_dir}" || ! -f "${source_dir}/.cursor-plugin/plugin.json" ]]; then
  echo "The downloaded archive does not contain a valid ${plugin_name} package." >&2
  exit 1
fi

mkdir -- "${staging}"
cp -R "${source_dir}/." "${staging}/"

backup=""
if [[ -e "${target}" || -L "${target}" ]]; then
  backup="${install_root}/.${plugin_name}.backup.$(date -u +%Y%m%dT%H%M%SZ)"
  mv -- "${target}" "${backup}"
fi

if ! mv -- "${staging}" "${target}"; then
  if [[ -n "${backup}" && ! -e "${target}" ]]; then
    mv -- "${backup}" "${target}"
  fi
  echo "Installation failed; the previous plugin was restored." >&2
  exit 1
fi

echo "Installed RuleFoundry for Cursor at ${target}"
if [[ -n "${backup}" ]]; then
  echo "Previous install backed up at ${backup}"
fi
echo "Restart Cursor or run Developer: Reload Window, then enable RuleFoundry Extractions in Settings > Plugins."
