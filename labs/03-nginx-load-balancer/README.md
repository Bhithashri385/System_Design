# Lab 03 — Nginx load balancer

Book concept: Chapter 1 load balancer.

## What you learn
- One public entry point for users
- Nginx shares traffic across web servers
- Private network between Nginx and web servers

## Run (Podman + PowerShell)

```powershell
cd C:\MY_Learning\Projects\system-design-learning\labs\03-nginx-load-balancer
.\scripts\up.ps1
```

Open http://localhost:8080 and refresh several times.

```powershell
.\scripts\test.ps1
.\scripts\down.ps1
```

## Manual

```powershell
podman network create sdnet
podman rm -f web1 web2 web3 nginx
podman run -d --name web1 --hostname web1 --network sdnet localhost/flask-app:lab01
podman run -d --name web2 --hostname web2 --network sdnet localhost/flask-app:lab01
podman run -d --name web3 --hostname web3 --network sdnet localhost/flask-app:lab01
podman run -d --name nginx --network sdnet -p 8080:80 -v ${PWD}/nginx/nginx.conf:/etc/nginx/nginx.conf:ro docker.io/library/nginx:1.27-alpine
```