# Push this project to GitHub

Your code lives only on your PC until you create a GitHub repo and push.

GitHub username example from your account: **Bhithashri385**

## 1) Create empty repo on GitHub

1. Open https://github.com/new  
2. Name: `system-design-learning`  
3. Public or Private  
4. **Do not** add README / license / .gitignore  
5. Click **Create repository**

## 2) First commit + push (PowerShell)

```powershell
cd C:\MY_Learning\Projects\system-design-learning

git add .
git status
git commit -m "Add Podman labs 01-02: single server and horizontal scaling"

git branch -M main
git remote add origin https://github.com/Bhithashri385/system-design-learning.git
git push -u origin main
```

If remote already exists:
```powershell
git remote -v
git push -u origin main
```

## 3) After each new lab

```powershell
git add .
git commit -m "Add lab 03: nginx load balancer"
git push
```

## Note

The book PDF is ignored (copyright). Only lab code goes to GitHub.
