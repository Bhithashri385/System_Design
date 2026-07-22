$ErrorActionPreference = "Stop"

Write-Host "==> Checking container is running"
$ps = podman ps --filter "name=web0" --format "{{.Names}}"
if (-not $ps) {
    Write-Error "web0 is not running. Run .\scripts\up.ps1 first."
}

Write-Host "==> Hitting http://localhost:5000"
$body = Invoke-WebRequest -Uri "http://localhost:5000" -UseBasicParsing
Write-Host $body.Content

if ($body.Content -notmatch "Hello from") {
    Write-Error "Unexpected response"
}

Write-Host "PASS: Lab 01 works"
