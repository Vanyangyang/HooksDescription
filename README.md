# Claude Code 通知 Hooks 简单配置教程

## 功能简介

可以在claudecode需要用户授权以及claudecode完成对话的时候,通过 Windows右下角通知弹窗与通用提示音提醒用户。

## 🚀 5分钟快速配置

### 步骤1：下载脚本文件
从 GitHub 下载以下两个文件到 `.claude/hooks/` 目录（或者随便什么你觉得合适的位置，如果更换位置，readme后面相关指令记得替换）：
- `notify-interaction.sh`
- `notify-completion.sh`

### 步骤2：赋予执行权限（如遇权限问题，可选）
```bash
chmod +x .claude/hooks/*.sh
```

### 步骤3：创建配置文件
在项目根目录项目级配置文件中修改 `.claude/settings.local.json`：
```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "/mnt/你的盘符/你的项目路径/.claude/hooks/notify-interaction.sh"
          }
        ]
      }
    ],
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "/mnt/你的盘符/你的项目路径/.claude/hooks/notify-completion.sh"
          }
        ]
      }
    ]
  }
}
```
#### 备选方案：使用/hooks 指令自行添加

### 步骤5：修改路径
将配置文件中的路径修改为你的实际项目路径：

**路径格式**：`/mnt/盘符/项目路径/.claude/hooks/脚本名.sh`

### 步骤6：重启 Claude Code
重新启动 Claude Code，钩子即生效！

## 💡 效果说明
- **交互通知**：Claude 需要输入时弹出 Windows 通知
- **完成通知**：任务完成时弹出 Windows 通知
