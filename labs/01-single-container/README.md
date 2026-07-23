# Lab 01 — Single container app

Book concept: Chapter 1 single server.

## What you learn
- One Flask app in one container
- Difference between image and container
- Basic Podman build and run

## Run (Podman + PowerShell)

```powershell
cd C:\MY_Learning\Projects\system-design-learning\labs\01-single-container
.\scripts\up.ps1
```

Open http://localhost:5000

```powershell
.\scripts\test.ps1
.\scripts\down.ps1
```

## Manual

```powershell
podman build -t localhost/flask-app:lab01 -f Containerfile .
podman rm -f web0
podman run -d --name web0 --hostname web0 -p 5000:5000 localhost/flask-app:lab01
```