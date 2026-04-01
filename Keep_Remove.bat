@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 1. 管理员
fltmc >nul 2>&1 || (
    powershell -Command "Start-Process cmd -ArgumentList '/c ""%~f0""' -Verb RunAs"
    exit /b
)

:: 2. 路径
set "shortcutPath=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\main++.lnk"

:: 3. 删除自启项
if exist "!shortcutPath!" (
    del /f /q "!shortcutPath!"
    echo 卸载成功
) else (
    echo 未找到
)
pause