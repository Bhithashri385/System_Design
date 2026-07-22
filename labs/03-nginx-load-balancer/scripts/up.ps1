podman network create sdnet 2>$null
podman rm -f web1 web2 web3 nginx 2>$null

podman run -d --name web1 --hostname web1 --network sdnet localhost/flask-app:lab01
podman run -d --name web2 --hostname web2 --network sdnet localhost/flask-app:lab01
podman run -d --name web3 --hostname web3 --network sdnet localhost/flask-app:lab01

podman run -d --name nginx --network sdnet -p 8080:80 `
  -v ${PWD}/nginx/nginx.conf:/etc/nginx/nginx.conf:ro `
  docker.io/library/nginx:1.27-alpine

Write-Host "Open http://localhost:8080 and refresh several times"