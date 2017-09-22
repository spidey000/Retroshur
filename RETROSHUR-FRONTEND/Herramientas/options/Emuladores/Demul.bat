@echo off
if not DEFINED IS_MINIMIZED SET IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
set HOME="%~dp0"
cd %~dp0..\..\..\Emuladores\Demul\
start "" /WAIT "demul.exe"

exit /b
