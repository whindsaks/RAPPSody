@echo off&setlocal&REM v0.3
set name=BabyFtpSrv
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL /S ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=Baby FTP Server
Description=A basic FTP server, without a fancy UI or lots of features.
LicenseType=2
Version=1.24
URLDownload=https://web.archive.org/web/20130531172903if_/http://www.pablosoftwaresolutions.com/files/babyftp.zip
SHA1=6b8ae12f6f85ba35a85e1235728d96b2c6918fad
SizeBytes=41157
Category=5
Installer=Generate

[Generate]
DelReg=HKCU\Software\Pablo Software Solutions\babyftp
DelRegEmpty=HKCU\Software\Pablo Software Solutions