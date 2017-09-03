@echo off
set HOME="%~dp0"
pushd %~dp0..\..\..\Emuladores\RetroArch\
echo.
echo copiando configuracion Global de los controles a Gameboy
timeout 5
call Configurar-Gamepad-GB.bat
echo.
echo Hecho!
timeout 3
exit /b
