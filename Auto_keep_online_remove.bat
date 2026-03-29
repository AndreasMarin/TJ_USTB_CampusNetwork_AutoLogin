@echo off
chcp 437 >nul
setlocal enabledelayedexpansion

set "TASK_NAME=HourlyRunMainExe"

:: 自动获取管理员权限
fltmc >nul 2>&1 || (powershell "Start-Process '%~f0' -Verb RunAs" >nul 2>&1 & exit)

echo ==============================================
echo Deleting scheduled task: %TASK_NAME%
echo ==============================================

:: 删除任务
schtasks /delete /tn "%TASK_NAME%" /f >nul 2>&1

if %errorlevel% equ 0 (
    echo.
    echo SUCCESS: Task deleted successfully!
) else (
    echo.
    echo WARNING: Task not found or already deleted!
)

echo.
pause
exit /b