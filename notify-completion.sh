#!/bin/bash
PROJECT_NAME=$(basename "$(pwd)")
COMPLETION_TIME=$(date '+%H:%M:%S')
powershell.exe -Command "
Add-Type -AssemblyName System.Windows.Forms
\$notify = New-Object System.Windows.Forms.NotifyIcon
\$notify.Icon = [System.Drawing.SystemIcons]::Information
\$notify.Visible = \$true
\$notify.ShowBalloonTip(10000, '✅ Claude Code - 任务完成', '项目: $PROJECT_NAME\n完成时间: $COMPLETION_TIME', 'Info')
Start-Sleep -Seconds 3
\$notify.Dispose()
"
echo "[$(date)] 任务完成: $PROJECT_NAME" >> ~/.claude/notification.log
