@echo off&setlocal&REM v0.4
for /F "usebackq eol=; tokens=1,* delims== " %%A in ("%~f0") do if /I "%%~A"=="Name" set %%~A=%%~B
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I "%~1"=="/Expert" (shift) else call "%systemroot%\system32\rapps" /INSTALL /S ?
2>nul md "%DIR%"
>nul copy /Y "%~f0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %~1 %name%
goto :EOF

[Section]
Name=NSIS
Description=A professional open source system to create Windows installers
URLSite=https://nsis.sourceforge.io/
License=zlib/libpng, bzip2, CPLv1
LicenseType=1
Category=7
Version=3.12
URLDownload=https://sourceforge.net/projects/nsis/files/NSIS%203/3.12/nsis-3.12-setup.exe

[Section.x86]
Dependencies=vc6run

[Section.amd64]
URLDownload=https://github.com/sredna/NSIS-Combo/releases/download/v3.12/nsis64-3.12-setup.exe