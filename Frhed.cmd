@echo off&setlocal&REM v0.2
set name=Frhed
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I not "%~1"=="/Expert" call "%systemroot%\system32\rapps" /INSTALL ?
2>nul md "%DIR%"
>nul copy /Y "%~0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %name%
goto :EOF

[Section]
Name = Frhed
Version = 0.10904.2017.15
License = GPLv2
LicenseType = 1
Description = Frhed is a hex editor for Windows. It is small but has many advanced features like ability to load big files partially. (Note: This is the WinMerge fork)
Category = 12
URLSite = https://sourceforge.net/projects/frhed/
URLDownload = https://github.com/WinMerge/frhed/releases/download/0.10904.2017/frhed-0.10904.2017.15-x86.zip
SHA1 = 3f9100bcbb31e354afcd1e4284920edfdfd248f9
SizeBytes = 412772
Installer = Generate

[Generate]
Files = frhed\*.exe|frhed\*
DelReg = HKCU\Software\Frhed\Settings|HKCR\Unknown\shell\Open in Frhed|HKCR\*\shell\Open in Frhed
DelRegEmpty = HKCU\Software\Frhed

[Section.amd64]
URLDownload = https://github.com/WinMerge/frhed/releases/download/0.10904.2017/frhed-0.10904.2017.15-x64.zip
SHA1 = fc2df5012ec9ec62e541de3676f68b6dcaf49dd2
SizeBytes = 438370
