podman network create sdnet 2>$null
podman rm -f redis nginx web1 web2 web3 2>$null

podman build -t localhost/flask-app:lab04 -f app/Containerfile app

podman run -d --name redis --network sdnet redis:7-alpine

podman run -d --name web1 --hostname web1 --network sdnet -e REDIS_HOST=redis localhost/flask-app:lab04
podman run -d --name web2 --hostname web2 --network sdnet -e REDIS_HOST=redis localhost/flask-app:lab04
podman run -d --name web3 --hostname web3 --network sdnet -e REDIS_HOST=redis localhost/flask-app:lab04

podman run -d --name nginx --network sdnet -p 8080:80 -v ${PWD}/nginx/nginx.conf:/etc/nginx/nginx.conf:ro docker.io/library/nginx:1.27-alpine

Write-Host "Open http://localhost:8080/count and refresh"