# Lab 04 — Redis shared cache

Book concept: Chapter 1 cache tier.

## What you learn
- Redis as shared in-memory store
- All web servers share one counter
- Load balancer and cache working together

## Run (Podman + PowerShell)

```powershell
cd C:\MY_Learning\Projects\system-design-learning\labs\04-redis-cache
.\scripts\up.ps1
```

Open http://localhost:8080/count and refresh.

```powershell
.\scripts\test.ps1
.\scripts\down.ps1
```

## Manual

```powershell
podman network create sdnet
podman build -t localhost/flask-app:lab04 -f app/Containerfile app
podman run -d --name redis --network sdnet redis:7-alpine
podman run -d --name web1 --hostname web1 --network sdnet -e REDIS_HOST=redis localhost/flask-app:lab04
podman run -d --name web2 --hostname web2 --network sdnet -e REDIS_HOST=redis localhost/flask-app:lab04
podman run -d --name web3 --hostname web3 --network sdnet -e REDIS_HOST=redis localhost/flask-app:lab04
podman run -d --name nginx --network sdnet -p 8080:80 -v ${PWD}/nginx/nginx.conf:/etc/nginx/nginx.conf:ro docker.io/library/nginx:1.27-alpine
```