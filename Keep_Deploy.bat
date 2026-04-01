@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 1. 管理员
fltmc >nul 2>&1 || (
    powershell -Command "Start-Process cmd -ArgumentList '/c ""%~f0""' -Verb RunAs"
    exit /b
)

:: 2. 获取目录
set "currentDir=%~dp0"
set "exePath=!currentDir!main++.exe"
set "shortcutPath=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\main++.lnk"

:: 3. 校验是否存在
if not exist "!exePath!" (
    echo 错误：未找到 main++.exe！
    pause
    exit /b 1
)

:: 4. 用PowerShell创建无窗口快捷方式
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('!shortcutPath!'); $Shortcut.TargetPath = '!exePath!'; $Shortcut.WorkingDirectory = '!currentDir!'; $Shortcut.WindowStyle = 0; $Shortcut.Save()"

:: 5. 验证
if exist "!shortcutPath!" (
    echo 安装成功！
) else (
    echo 安装失败
)
pause