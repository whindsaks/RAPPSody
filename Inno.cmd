@echo off&setlocal&REM v0.3
set name=Inno
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=Inno Setup
Description=Inno Setup is an open-source installation builder for Windows applications
LicenseType=1
Version=5.6.1
URLDownload=https://files.jrsoftware.org/is/5/innosetup-5.6.1-unicode.exe
SHA1=df24b63225372f29833c88030c5b5e309e377756
SizeBytes=2359768
RegName = Inno Setup 5_is1
SilentParameters = /VERYSILENT /SUPPRESSMSGBOXES /SP- /NORESTART /CLOSEAPPLICATIONS
Category=7
