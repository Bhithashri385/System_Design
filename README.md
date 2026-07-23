# System Design Labs (Podman + Windows)

Hands-on automation for *System Design Interview* concepts.

**Environment:** Windows + Podman Desktop  
**Project path:** `C:\MY_Learning\Projects\system-design-learning`

## Lab roadmap

| Lab | Topic | Book concept | Status |
|-----|--------|--------------|--------|
| [01](labs/01-single-container) | Single container Flask app | Single server | Ready |
| [02](labs/02-horizontal-scaling) | 3 web containers | Horizontal scaling | Ready |
| [03](labs/03-nginx-load-balancer) | Nginx → web1/2/3 | Load balancer | Planned |
| [04](labs/04-redis-cache) | Shared Redis cache | Cache tier | Planned |
| [05](labs/06-mini-project) | Nginx + Flask×3 + Redis + MySQL | Full Ch1 stack | Planned |

## Quick start

### Lab 01 — Single server
```powershell
cd C:\MY_Learning\Projects\system-design-learning\labs\01-single-container
.\scripts\up.ps1
# browser: http://localhost:5000  -> Hello from web0
.\scripts\test.ps1
.\scripts\down.ps1
```

### Lab 02 — Horizontal scaling
```powershell
cd C:\MY_Learning\Projects\system-design-learning\labs\02-horizontal-scaling
.\scripts\up.ps1
# browsers: :5001 :5002 :5003 -> web1 / web2 / web3
.\scripts\test.ps1
.\scripts\down.ps1
```

## How we automate

Each lab has:
- `scripts/up.ps1` — build + run
- `scripts/down.ps1` — stop + cleanup
- `scripts/test.ps1` — verify
- `README.md` — concept + why

## GitHub

See [GITHUB.md](GITHUB.md).
