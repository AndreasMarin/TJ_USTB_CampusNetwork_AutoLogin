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
set "exe=%~dp0main.exe"
set "lnk=%startup%\mainTJUSAtuologin.lnk"

echo Set W=WScript.CreateObject("WScript.Shell")>%temp%\s.vbs
echo Set S=W.CreateShortcut("%lnk%")>>%temp%\s.vbs
echo S.TargetPath="%exe%">>%temp%\s.vbs
echo S.Save>>%temp%\s.vbs
cscript //nologo %temp%\s.vbs
del /q %temp%\s.vbs

echo 配置完成
pause