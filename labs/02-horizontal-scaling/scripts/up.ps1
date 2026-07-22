podman rm -f web1 web2 web3

podman run -d --name web1 --hostname web1 -p 5001:5000 localhost/flask-app:lab01
podman run -d --name web2 --hostname web2 -p 5002:5000 localhost/flask-app:lab01
podman run -d --name web3 --hostname web3 -p 5003:5000 localhost/flask-app:lab01

Write-Host "Open http://localhost:5001 5002 5003"