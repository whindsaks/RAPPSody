@echo off&setlocal&REM v0.3
set name=QnEWebServerDemo
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL /S ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=Quick 'n Easy Web Server Demo
Description=Do you want run your own personal webserver or just want to test your ASP/PHP scripts before you upload them to your webhosting server?
LicenseType=3
Version=3.3.8
URLDownload=https://web.archive.org/web/20141113041445if_/http://www.pablosoftwaresolutions.com/files/quickwebdemo.zip
SHA1=729afae66822be6685ca67f6e4e5664eeed1f3bc
SizeBytes=415230
Category=5
Installer=Generate

[Generate]
DelFile=virtdirs.xml
DelReg=HKCU\Software\Pablo Software Solutions\quickweb
DelRegEmpty=HKCU\Software\Pablo Software Solutions