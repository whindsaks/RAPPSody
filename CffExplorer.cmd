@echo off&setlocal&REM v0.3
set name=CffExplorer
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL /S ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=CFF Explorer
Description=Make PE editing as easy as possible, but without losing sight on the portable executable's internal structure.
LicenseType=2
Version=8.0
URLDownload=https://ntcore.com/files/CFF_Explorer.zip
SHA1=7a287cd97bd9287c020c98c3496e284d04f5382d
SizeBytes=2179871
Category=7
Installer=Generate

[Generate]
Files=CFF_Explorer\*.exe|CFF_Explorer\*
DelReg=HKCU\Software\NTCore\CFFExplorer
DelRegEmpty=HKCU\Software\NTCore