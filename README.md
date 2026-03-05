# 🖥️ system-monitor

OpenClaw 技能 - macOS 系统监控工具

## 功能

- 📊 CPU 使用率监控
- 💾 内存状态检查
- 💿 磁盘空间监控
- 🔄 运行进程列表

## 安装

### 方法 1: 手动安装

```bash
# 克隆仓库
git clone https://github.com/jack/system-monitor.git

# 复制到 OpenClaw 技能目录
cp -r system-monitor ~/.openclaw/workspace/skills/
```

### 方法 2: 使用 ClawHub (推荐)

```bash
clawhub install system-monitor
```

## 使用示例

### 基本使用

在 OpenClaw 中询问：

```
检查系统状态
CPU 使用率怎么样？
内存还剩多少？
磁盘空间够吗？
```

### 示例输出

```
🖥️ macOS System Status
━━━━━━━━━━━━━━━━━━━━━━
📊 CPU: 10% user, 15% sys, 75% idle
💾 Memory: 15G used, 221M unused
💿 Disk: 15Gi / 228Gi (36%), 27Gi available
🔄 Processes: 598 running
━━━━━━━━━━━━━━━━━━━━━━
Updated: 2026-03-06 06:26:17
```

## 技术细节

### 依赖

- macOS 系统命令：`top`, `df`, `ps`
- 无需 API 密钥
- 无需额外安装

### 文件结构

```
system-monitor/
├── SKILL.md                        # 技能定义
├── scripts/
│   └── system-status.sh            # 快捷脚本
├── README.md                       # 本文件
├── LICENSE                         # MIT License
└── .gitignore
```

## 开发

### 测试脚本

```bash
# 直接运行脚本
./scripts/system-status.sh

# 在 OpenClaw 中测试
openclaw agent --message "检查系统状态"
```

### 修改技能

编辑 `SKILL.md` 文件，然后重新加载 OpenClaw。

## 兼容性

| 系统 | 状态 | 说明 |
|------|------|------|
| macOS | ✅ 支持 | 完整功能 |
| Linux | ⚠️ 部分支持 | 需要调整命令 |
| Windows | ❌ 不支持 | 命令不兼容 |

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License - 详见 [LICENSE](LICENSE)

## 相关链接

- [OpenClaw 文档](https://docs.openclaw.ai)
- [ClawHub 技能市场](https://clawhub.com)
- [技能开发指南](https://docs.openclaw.ai/skills/creating)

---

**Created with 🦞 by OpenClaw**
