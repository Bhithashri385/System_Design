$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot\..

Write-Host "==> Building image localhost/flask-app:lab01"
podman build -t localhost/flask-app:lab01 -f Containerfile .

Write-Host "==> Removing old container web0 (if any)"
podman rm -f web0 2>$null | Out-Null

Write-Host "==> Starting web0 on http://localhost:5000"
podman run -d --name web0 --hostname web0 -p 5000:5000 localhost/flask-app:lab01

Write-Host "Done. Open http://localhost:5000"
Write-Host "Then run: .\scripts\test.ps1"
