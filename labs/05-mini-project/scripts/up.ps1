podman network create sdnet 2>$null
podman rm -f nginx web1 web2 web3 redis mysql 2>$null

podman build -t localhost/flask-app:lab05 -f app/Containerfile app

podman run -d --name mysql --network sdnet `
  -e MYSQL_ROOT_PASSWORD=rootpass `
  -e MYSQL_DATABASE=appdb `
  -v ${PWD}/mysql/init.sql:/docker-entrypoint-initdb.d/init.sql:ro `
  docker.io/library/mysql:8.0

Write-Host "Waiting for MySQL to start..."
Start-Sleep -Seconds 25

podman run -d --name redis --network sdnet redis:7-alpine

podman run -d --name web1 --hostname web1 --network sdnet `
  -e REDIS_HOST=redis -e MYSQL_HOST=mysql -e MYSQL_PASSWORD=rootpass -e MYSQL_DB=appdb `
  localhost/flask-app:lab05

podman run -d --name web2 --hostname web2 --network sdnet `
  -e REDIS_HOST=redis -e MYSQL_HOST=mysql -e MYSQL_PASSWORD=rootpass -e MYSQL_DB=appdb `
  localhost/flask-app:lab05

podman run -d --name web3 --hostname web3 --network sdnet `
  -e REDIS_HOST=redis -e MYSQL_HOST=mysql -e MYSQL_PASSWORD=rootpass -e MYSQL_DB=appdb `
  localhost/flask-app:lab05

podman run -d --name nginx --network sdnet -p 8080:80 `
  -v ${PWD}/nginx/nginx.conf:/etc/nginx/nginx.conf:ro `
  docker.io/library/nginx:1.27-alpine

Write-Host "Try:"
Write-Host "  http://localhost:8080/"
Write-Host "  http://localhost:8080/count"
Write-Host "  http://localhost:8080/users   (1st=MISS slow, 2nd=HIT fast)"