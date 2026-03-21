@echo off
chcp 65001 >nul 2>&1

if not "%1"=="admin" (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "admin", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del /f /q "%temp%\getadmin.vbs" >nul 2>&1
    exit /b
)

set "startup=C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
set "lnk=%startup%\mainTJUSAtuologin.lnk"

if exist "%lnk%" (
    del /f /q "%lnk%"
    echo 已清除自启动配置：%lnk%
) else (
    echo 未找到自启动配置：%lnk%
)

pause