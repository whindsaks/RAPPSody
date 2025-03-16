@echo off&setlocal&REM v0.2
set name=PEview
echo.%name%...
for /F "tokens=3,*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData"^|find /V "HKEY_"') do @call set DIR=%%B\RApps\appdb
if /I not "%~1"=="/Expert" call "%systemroot%\system32\rapps" /INSTALL ?
2>nul md "%DIR%"
>nul copy /Y "%~0" "%DIR%\%name%.txt"
start "" "%systemroot%\system32\rapps.exe" /INSTALL %name%
goto :EOF

[Section]
Name=PEview
Description=Provides a quick and easy way to view the structure and content of 32-bit PE and COFF files.
LicenseType=2
Version=0.9.9
URLDownload=http://wjradburn.com/software/PEview.zip
SHA1=7e9da7f71fd8105af489ff0debc765d412f8130a
SizeBytes=31521
Category=7
Installer=Generate

[Generate]
DelReg=HKCU\Software\WJR\PEview
DelRegEmpty=HKCU\Software\WJR
