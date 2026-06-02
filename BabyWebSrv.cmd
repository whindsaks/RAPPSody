@echo off&setlocal&REM v0.3
set name=BabyWebSrv
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL /S ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=Baby Web Server
Description=A simple web server with support for ASP.
LicenseType=2
Version=2.7.2
URLDownload=https://web.archive.org/web/20130531205451if_/http://www.pablosoftwaresolutions.com/files/babywebssl.zip
SHA1=0f7a91d76d8bcfe5677a08547cfcc5896db84da4
SizeBytes=92259
Category=5
Installer=Generate

[Generate]
DelReg=HKCU\Software\Pablo Software Solutions\babyweb
DelRegEmpty=HKCU\Software\Pablo Software Solutions