#!/bin/bash
# publish-to-github.sh - 一键发布 system-monitor 技能到 GitHub

set -e

REPO_NAME="system-monitor"
REPO_PATH="/Users/jack/.openclaw/workspace/skills/$REPO_NAME"
GITHUB_USER="jack"  # 请修改为您的 GitHub 用户名

echo "🦞 OpenClaw Skill GitHub Publisher"
echo "=================================="
echo ""

cd "$REPO_PATH"

# 检查 gh CLI 是否可用
if command -v gh &> /dev/null; then
    echo "✅ 检测到 GitHub CLI"
    echo ""
    
    # 检查是否已认证
    if gh auth status &> /dev/null; then
        echo "✅ GitHub 已认证"
        echo ""
        echo "📤 创建并推送仓库..."
        gh repo create "$GITHUB_USER/$REPO_NAME" \
            --public \
            --source=. \
            --remote=origin \
            --push \
            --confirm
        
        echo ""
        echo "✅ 发布成功！"
        echo "🔗 查看仓库：https://github.com/$GITHUB_USER/$REPO_NAME"
    else
        echo "⚠️  GitHub CLI 未认证"
        echo ""
        echo "请先运行：gh auth login"
        echo "然后重新运行此脚本"
        echo ""
        echo "或者手动创建仓库并推送："
        echo "  git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
        echo "  git branch -M main"
        echo "  git push -u origin main"
    fi
else
    echo "⚠️  未检测到 GitHub CLI"
    echo ""
    echo "请选择以下方式之一："
    echo ""
    echo "1️⃣  安装 GitHub CLI (推荐):"
    echo "   brew install gh"
    echo "   gh auth login"
    echo ""
    echo "2️⃣  手动推送:"
    echo "   a. 访问 https://github.com/new"
    echo "   b. 创建仓库：$REPO_NAME"
    echo "   c. 运行以下命令:"
    echo ""
    echo "   git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo "   git branch -M main"
    echo "   git push -u origin main"
fi

echo ""
echo "📝 详细指南请查看：PUBLISH-GITHUB.md"
