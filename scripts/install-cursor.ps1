[CmdletBinding()]
param(
    [string]$Version = $env:RULEFOUNDRY_PLUGIN_VERSION,
    [string]$InstallRoot = $env:CURSOR_PLUGIN_HOME,
    [string]$ArchiveUrl = $env:RULEFOUNDRY_PLUGIN_ARCHIVE_URL
)

$ErrorActionPreference = "Stop"
$pluginName = "cursor-rulefoundry"

if ([string]::IsNullOrWhiteSpace($Version)) {
    $Version = "v1.0.0"
}
if ([string]::IsNullOrWhiteSpace($InstallRoot)) {
    $InstallRoot = Join-Path $HOME ".cursor\plugins\local"
}
if ([string]::IsNullOrWhiteSpace($ArchiveUrl)) {
    $ArchiveUrl = "https://github.com/adammpolak/rulefoundry-plugins/archive/refs/tags/$Version.zip"
}

$target = Join-Path $InstallRoot $pluginName
$staging = Join-Path $InstallRoot ".$pluginName.install.$PID"
$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) "rulefoundry-cursor-$([guid]::NewGuid().ToString('N'))"
$backup = $null

try {
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
    New-Item -ItemType Directory -Path $InstallRoot -Force | Out-Null
    $archivePath = Join-Path $tempDir "rulefoundry-plugins.zip"

    Write-Host "Downloading RuleFoundry Cursor plugin $Version..."
    Invoke-WebRequest -Uri $ArchiveUrl -OutFile $archivePath -UseBasicParsing
    Expand-Archive -LiteralPath $archivePath -DestinationPath $tempDir -Force

    $manifest = Get-ChildItem -Path $tempDir -Filter "plugin.json" -File -Recurse |
        Where-Object { $_.FullName -like "*plugins*$pluginName*.cursor-plugin*plugin.json" } |
        Select-Object -First 1
    if ($null -eq $manifest) {
        throw "The downloaded archive does not contain a valid $pluginName package."
    }

    $sourceDir = $manifest.Directory.Parent.FullName
    New-Item -ItemType Directory -Path $staging | Out-Null
    Get-ChildItem -LiteralPath $sourceDir -Force |
        Copy-Item -Destination $staging -Recurse -Force

    if (Test-Path -LiteralPath $target) {
        $timestamp = [DateTime]::UtcNow.ToString("yyyyMMddTHHmmssZ")
        $backup = Join-Path $InstallRoot ".$pluginName.backup.$timestamp"
        Move-Item -LiteralPath $target -Destination $backup
    }

    try {
        Move-Item -LiteralPath $staging -Destination $target
    }
    catch {
        if ($null -ne $backup -and -not (Test-Path -LiteralPath $target)) {
            Move-Item -LiteralPath $backup -Destination $target
        }
        throw "Installation failed; the previous plugin was restored. $($_.Exception.Message)"
    }

    Write-Host "Installed RuleFoundry for Cursor at $target"
    if ($null -ne $backup) {
        Write-Host "Previous install backed up at $backup"
    }
    Write-Host "Restart Cursor or run Developer: Reload Window, then enable RuleFoundry Extractions in Settings > Plugins."
}
finally {
    if (Test-Path -LiteralPath $tempDir) {
        Remove-Item -LiteralPath $tempDir -Recurse -Force
    }
    if (Test-Path -LiteralPath $staging) {
        Remove-Item -LiteralPath $staging -Recurse -Force
    }
}
