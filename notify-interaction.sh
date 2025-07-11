#!/bin/bash
PROJECT_NAME=$(basename "$(pwd)")
powershell.exe -Command "
Add-Type -AssemblyName System.Windows.Forms
\$notify = New-Object System.Windows.Forms.NotifyIcon
\$notify.Icon = [System.Drawing.SystemIcons]::Question
\$notify.Visible = \$true
\$notify.ShowBalloonTip(10000, '🤔 Claude Code - 需要交互', '项目: $PROJECT_NAME\n正在等待您的输入', 'Info')
Start-Sleep -Seconds 3
\$notify.Dispose()
"
echo "[$(date)] 交互通知: $PROJECT_NAME" >> ~/.claude/notification.log
