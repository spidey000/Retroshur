@echo off
set HOME="%~dp0"
pushd %~dp0..\..\..\Emuladores\RetroArch\
echo.
echo copiando configuracion Global de los controles
timeout 3
call Configurar-Gamepad-GG.bat /wait
echo.
echo Hecho!
timeout 3
exit /b



