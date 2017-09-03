@echo off
set HOME="%~dp0"
pushd %~dp0..\..\..\Emuladores\RetroArch\
echo.
echo copiando configuracion Global de los controles a Gameboy Advance
timeout 5
call Configurar-Gamepad-GBA.bat
echo.
echo Hecho!
timeout 3
exit /b








