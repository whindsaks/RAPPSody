@echo off&setlocal&REM v0.3
set name=QnEFtpServerLite
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL /S ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=Quick 'n Easy FTP Server Lite
Description=A multi threaded FTP server.
LicenseType=2
Version=3.2
URLDownload=https://web.archive.org/web/20130120063234if_/http://www.pablosoftwaresolutions.com/files/ftpserver3lite.zip
SHA1=aae12d7419ba45060e8e2863f241a9b892f995b0
SizeBytes=380597
Category=5
Installer=Generate

[Generate]
DelFile=users.xml|ftptrace.txt
DelReg=HKCU\Software\Pablo Software Solutions\FTPServer
DelRegEmpty=HKCU\Software\Pablo Software Solutions