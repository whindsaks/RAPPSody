@echo off&setlocal&REM v0.3
set name=PEBear
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL /S ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=PEBear
Description=Portable Executable reversing tool with a friendly GUI
URLSite=https://hshrzd.wordpress.com/pe-bear
LicenseType=1
Category=7
Version=0.7.1
URLDownload=https://github.com/hasherezade/pe-bear/releases/download/v0.7.1/PE-bear_0.7.1_qt4_x86_win_vs10.zip
SHA1=c397de76d7790f18dc77c1d0db85c915f441fa11
SizeBytes=6683253
Installer=Generate

[Generate]
DelReg = HKCU\Software\PE-bear\PE-bear|HKCU\Software\Trolltech\OrganizationDefaults\Qt Factory Cache 4.8|HKCU\Software\Trolltech\OrganizationDefaults\Qt Plugin Cache 4.8.false
DelRegEmpty = HKCU\Software\PE-bear