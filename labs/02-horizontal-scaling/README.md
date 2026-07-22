# Lab 02 — Horizontal scaling (3 web servers)

Book concept: Chapter 1 **horizontal scaling** (scale out = more machines).

## What you will see

Three containers, three ports, three different hostnames:

| URL | Container | Hostname shown |
|-----|-----------|----------------|
| http://localhost:5001 | web1 | Hello from web1 |
| http://localhost:5002 | web2 | Hello from web2 |
| http://localhost:5003 | web3 | Hello from web3 |

Same **image** (`localhost/flask-app:lab01`), three **containers**.

## Automate (PowerShell)

```powershell
cd C:\MY_Learning\Projects\system-design-learning\labs\02-horizontal-scaling
.\scripts\up.ps1
.\scripts\test.ps1
.\scripts\down.ps1
```

## Why this lab

| Piece | Book idea |
|-------|-----------|
| 1 image | Same app packaged once |
| 3 containers | Multiple web servers |
| Different hostnames | Prove they are different servers |

Next: [Lab 03 — Nginx load balancer](../03-nginx-load-balancer)
