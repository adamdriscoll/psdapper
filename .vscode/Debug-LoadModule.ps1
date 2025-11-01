# This script is used for debugging: it loads the psdapper module from the output directory
$modulePath = Join-Path $PSScriptRoot '..' 'bin' 'Debug' 'netstandard2.0' 'publish' 'psdapper.psd1'
if (Test-Path $modulePath) {
    Import-Module $modulePath -Force
    Write-Host "psdapper module loaded from $modulePath"
} else {
    Write-Host "Module not found at $modulePath. Build the project first."
}
# Place your test/debug commands below
