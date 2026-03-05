# 🚀 GitHub 发布指南

## 方式 1: 使用 GitHub CLI (推荐)

### 步骤 1: 认证 GitHub

```bash
gh auth login
```

按提示选择：
- GitHub.com
- HTTPS
- Login with a web browser

### 步骤 2: 创建并推送仓库

```bash
cd /Users/jack/.openclaw/workspace/skills/system-monitor

gh repo create jack/system-monitor \
  --public \
  --source=. \
  --remote=origin \
  --push
```

### 步骤 3: 验证

```bash
gh repo view jack/system-monitor
```

---

## 方式 2: 手动创建 (无需 gh CLI)

### 步骤 1: 在 GitHub 创建仓库

1. 访问 https://github.com/new
2. Repository name: `system-monitor`
3. Description: "OpenClaw Skill - macOS System Monitor 🖥️"
4. 选择 **Public**
5. **不要** 勾选 "Add a README" 等选项
6. 点击 **Create repository**

### 步骤 2: 添加远程仓库并推送

```bash
cd /Users/jack/.openclaw/workspace/skills/system-monitor

# 添加远程仓库 (替换 jack 为您的 GitHub 用户名)
git remote add origin https://github.com/jack/system-monitor.git

# 推送代码
git branch -M main
git push -u origin main
```

### 步骤 3: 验证推送

访问 https://github.com/jack/system-monitor 查看代码

---

## 方式 3: 使用 SSH (如已配置 SSH 密钥)

```bash
cd /Users/jack/.openclaw/workspace/skills/system-monitor

git remote add origin git@github.com:jack/system-monitor.git
git branch -M main
git push -u origin main
```

---

## 📋 发布后步骤

### 1. 添加 GitHub Topics

在仓库页面添加 topics：
- `openclaw`
- `skill`
- `macos`
- `system-monitor`
- `cli`

### 2. 发布到 ClawHub (可选)

```bash
# 安装 clawhub (如未安装)
npm install -g clawhub

# 发布技能
clawhub publish /Users/jack/.openclaw/workspace/skills/system-monitor
```

### 3. 分享

在以下地方分享您的技能：
- OpenClaw Discord: https://discord.gg/clawd
- Twitter/X (标记 @openclaw)
- 相关社区论坛

---

## 🔗 仓库信息

**仓库 URL**: https://github.com/jack/system-monitor

**技能路径**: `/Users/jack/.openclaw/workspace/skills/system-monitor/`

**文件结构**:
```
system-monitor/
├── .gitignore
├── LICENSE
├── README.md
├── SKILL.md
└── scripts/
    └── system-status.sh
```

---

## 📝 提交历史

```
commit 5ce4eb8 (HEAD -> main)
Author: jack <jack@users.noreply.github.com>
Date:   Fri Mar 6 06:32:00 2026

    feat: Initial release - macOS system monitor skill
    
    - Add SKILL.md with usage instructions
    - Add system-status.sh script for quick status checks
    - Support CPU, memory, disk, and process monitoring
    - Emoji-formatted output for chat responses
    - MIT License
    
    🦞 Created with OpenClaw
```

---

## ⚠️ 常见问题

### Q: 提示 "repository already exists"
A: 更改仓库名称，如 `system-monitor-skill`

### Q: 推送时要求认证
A: 使用 GitHub Personal Access Token:
   1. 访问 https://github.com/settings/tokens
   2. 创建新 token (repo 权限)
   3. 推送时使用 token 作为密码

### Q: 如何更新技能？
A: 修改文件后：
   ```bash
   git add -A
   git commit -m "feat: 更新说明"
   git push
   ```

---

*创建日期：2026-03-06*
