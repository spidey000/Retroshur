@echo off
set HOME="%~dp0"
cd %~dp0..\..\Emuladores\RetroArch\
start "" /min /WAIT "retroarch.exe"

exit /b
