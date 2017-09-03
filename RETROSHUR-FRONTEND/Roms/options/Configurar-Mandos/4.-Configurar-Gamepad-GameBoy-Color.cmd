@echo off
set HOME="%~dp0"
pushd %~dp0..\..\..\Emuladores\RetroArch\
echo.
echo copiando configuracion Global de los controles a Gameboy Color
timeout 5
call Configurar-Gamepad-GBC.bat
echo.
echo Hecho!
timeout 3
exit /b


