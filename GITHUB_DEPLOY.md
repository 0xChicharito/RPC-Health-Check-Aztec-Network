# GitHub Deployment Guide

This guide will help you deploy the RPC Health Check Monitor to GitHub.

## 📋 Prerequisites

- GitHub account
- Git installed on your local machine
- Files from this project

## 🚀 Quick Deploy to GitHub

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `rpc-health-check`
3. Description: `Automated Ethereum RPC and Beacon health monitoring with Telegram notifications`
4. Choose: **Public** (for easier installation) or **Private**
5. Do **NOT** initialize with README (we already have one)
6. Click "Create repository"

### Step 2: Prepare Local Repository

```bash
# Navigate to your project directory
cd /path/to/rpc-health-check

# Initialize git repository
git init

# Add all files
git add .

# Commit files
git commit -m "Initial commit: RPC Health Check Monitor"
```

### Step 3: Push to GitHub

Replace `YOUR_USERNAME` with your actual GitHub username:

```bash
# Add remote repository
git remote add origin https://github.com/YOUR_USERNAME/rpc-health-check.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 4: Update install.sh

After uploading to GitHub, update the `install.sh` file:

```bash
# Edit install.sh
nano install.sh

# Change this line (around line 14):
REPO_URL="https://raw.githubusercontent.com/YOUR_USERNAME/rpc-health-check/main"

# To your actual GitHub username:
REPO_URL="https://raw.githubusercontent.com/yourusername/rpc-health-check/main"

# Commit and push the change
git add install.sh
git commit -m "Update repository URL in install script"
git push
```

### Step 5: Update README.md

Update all instances of `YOUR_USERNAME` in README.md:

```bash
# Edit README.md
nano README.md

# Find and replace all instances of YOUR_USERNAME with your GitHub username

# Commit and push
git add README.md
git commit -m "Update GitHub username in README"
git push
```

## ✅ Verify Installation

Test the one-command installation:

```bash
curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/rpc-health-check/main/install.sh | bash
```

## 📝 Repository Settings (Optional)

### Add Topics

Go to your repository on GitHub and add topics:
- `ethereum`
- `rpc`
- `monitoring`
- `beacon-chain`
- `telegram-bot`
- `health-check`
- `bash-script`

### Add Description

Edit repository description:
```
Automated Ethereum RPC and Beacon health monitoring with auto-failover and Telegram notifications
```

### Enable Issues and Discussions

1. Go to Settings → Features
2. Enable "Issues"
3. Enable "Discussions" (optional)

## 🔐 Security

### Create .gitignore (Already Created)

The `.gitignore` file ensures sensitive files are not committed:

```gitignore
.env
.env.backup.*
.original_rpc
*.log
*.backup.*
```

### Verify .gitignore

```bash
# Make sure .env is not tracked
git ls-files | grep .env

# Should only show .env.example, not .env
```

## 📦 Release (Optional)

Create a release for easier version tracking:

1. Go to your repository on GitHub
2. Click "Releases" → "Create a new release"
3. Tag version: `v1.0.0`
4. Release title: `Initial Release - v1.0.0`
5. Description: Copy features from CHANGELOG.md
6. Click "Publish release"

## 🎯 One-Line Installation Command

After deployment, users can install with:

```bash
curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/rpc-health-check/main/install.sh | bash
```

Or clone and install:

```bash
git clone https://github.com/YOUR_USERNAME/rpc-health-check.git
cd rpc-health-check
chmod +x install.sh
./install.sh
```

## 📋 Checklist

Before going live, ensure:

- [ ] All files are committed
- [ ] .env is in .gitignore
- [ ] README.md has correct GitHub username
- [ ] install.sh has correct repository URL
- [ ] License file is included
- [ ] Repository is public (for easy installation)
- [ ] Topics are added
- [ ] Description is set
- [ ] Installation tested from GitHub

## 🔄 Updating

To update the repository:

```bash
# Make changes to files
nano rpc_health_check.sh

# Stage changes
git add .

# Commit changes
git commit -m "Description of changes"

# Push to GitHub
git push
```

## 📞 Support

After deployment, users can:
- Report issues: https://github.com/YOUR_USERNAME/rpc-health-check/issues
- Start discussions: https://github.com/YOUR_USERNAME/rpc-health-check/discussions
- Submit pull requests

## 🎉 You're Done!

Your RPC Health Check Monitor is now live on GitHub and ready for others to use!

Share your repository:
```
https://github.com/YOUR_USERNAME/rpc-health-check
```

Installation command:
```bash
curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/rpc-health-check/main/install.sh | bash
```
