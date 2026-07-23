# Lab 05 — Mini project (LB + cache + DB)

Book concept: Chapter 1 full basic stack.

## What you learn
- Nginx load balancer
- Horizontally scaled web servers
- Redis cache (HIT / MISS)
- MySQL database

## Run (Podman + PowerShell)

```powershell
cd C:\MY_Learning\Projects\system-design-learning\labs\05-mini-project
.\scripts\up.ps1
```

Try:
- http://localhost:8080/
- http://localhost:8080/count
- http://localhost:8080/users

```powershell
.\scripts\test.ps1
.\scripts\down.ps1
```

## Manual

```powershell
podman network create sdnet
podman build -t localhost/flask-app:lab05 -f app/Containerfile app
podman run -d --name mysql --network sdnet -e MYSQL_ROOT_PASSWORD=rootpass -e MYSQL_DATABASE=appdb -v ${PWD}/mysql/init.sql:/docker-entrypoint-initdb.d/init.sql:ro docker.io/library/mysql:8.0
podman run -d --name redis --network sdnet redis:7-alpine
podman run -d --name web1 --hostname web1 --network sdnet -e REDIS_HOST=redis -e MYSQL_HOST=mysql -e MYSQL_PASSWORD=rootpass -e MYSQL_DB=appdb localhost/flask-app:lab05
podman run -d --name web2 --hostname web2 --network sdnet -e REDIS_HOST=redis -e MYSQL_HOST=mysql -e MYSQL_PASSWORD=rootpass -e MYSQL_DB=appdb localhost/flask-app:lab05
podman run -d --name web3 --hostname web3 --network sdnet -e REDIS_HOST=redis -e MYSQL_HOST=mysql -e MYSQL_PASSWORD=rootpass -e MYSQL_DB=appdb localhost/flask-app:lab05
podman run -d --name nginx --network sdnet -p 8080:80 -v ${PWD}/nginx/nginx.conf:/etc/nginx/nginx.conf:ro docker.io/library/nginx:1.27-alpine
```