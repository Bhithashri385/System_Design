Write-Host "==> Stopping and removing web0"
podman rm -f web0 2>$null | Out-Null
Write-Host "Stopped."
