@echo off&setlocal&REM v0.3
set name=ExplorerSuite
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL /S ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=Explorer Suite
Description=A freeware suite of tools including a PE editor called CFF Explorer and a process viewer.
LicenseType=2
Version=4
URLDownload=https://ntcore.com/files/ExplorerSuite.exe
SHA1=89cab44d4956210570ab3123fbf13b2b7d870b91
SizeBytes=3613174
Category=7