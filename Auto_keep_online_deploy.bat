@echo off
chcp 437 >nul
setlocal enabledelayedexpansion

set "EXE_FILE=main.exe"
set "TASK_NAME=HourlyRunMainExe"

:: 获取管理员
fltmc >nul 2>&1 || (powershell "Start-Process '%~f0' -Verb RunAs" >nul 2>&1 & exit)

:: 获取路径
set "FULL_PATH=%~dp0%EXE_FILE%"

if not exist "!FULL_PATH!" (
    echo ERROR: main.exe not found!
    pause
    exit /b 1
)

echo ==============================================
echo Creating scheduled task...
echo Exe Path: !FULL_PATH!
echo Interval: Run every 1 hour
echo ==============================================

:: 删除旧任务
schtasks /delete /tn "%TASK_NAME%" /f >nul 2>&1

:: 创建新任务
schtasks /create /tn "%TASK_NAME%" ^
/tr "!FULL_PATH!" ^
/sc hourly /mo 1 ^
/ru "SYSTEM" /rl highest /f >nul 2>&1

if %errorlevel% equ 0 (
    echo.
    echo SUCCESS: Task created successfully!
    echo It will run every 1 hour after system startup.
) else (
    echo.
    echo FAILED: Task creation failed!
)

echo.
pause
exit /b