:: script realizado AkiAfroo para Retroshur
@Echo Off & Cls & Color 0E & Title Retroshur: RETROSHUR-LAUNCHER-MODO-NORMAL
set HOME="%~dp0"
set "MODO-NORMAL=%~dp0..\..\..\Emuladores"
pushd %MODO-NORMAL%
echo.
echo *******************************************************************************************
echo el MODO-NORMAL significa que rocket-launcher esta desactivado. Este modo es el recomendado
echo para equipos low-level o para quien no quiera bezels,overlays o cualquier otro elemento
echo decorativo.
echo *******************************************************************************************
timeout 10
cls
echo.
echo cambiando a Modo Normal:
echo Hecho!
timeout 3
copy RETROSHUR-LAUNCHER-MODO-NORMAL.shur RETROSHUR-LAUNCHER.cmd