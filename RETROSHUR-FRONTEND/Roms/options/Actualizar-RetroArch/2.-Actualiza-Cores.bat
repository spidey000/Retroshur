:: script realizado por AkiAfroo para Retroshur
@Echo Off & Cls & Color 0E & Title Retroshur: Instalador Retroarch-Cores
SET HOME="%~dp0"
SET "EXTRAER=%~dp0..\..\..\Herramientas\7-Zip\7z.exe"
SET "BAJAR=%~dp0..\..\..\Herramientas\WGET\wget64.exe"
SET "RETROSHUR=%~dp0..\..\..\Frontends\Emulationstation\"
SET "Actualiza_Cores=%~dp0..\..\..\Emuladores\RetroArch\cores\"
SET "BORRAR_TEMPORALES=%~dp0..\..\..\.temporales_retroshur_Rom_Downloader\"
SET "TEMPORALES=%~dp0..\..\..\.temporales_retroshur_Rom_Downloader\RetroArch\cores\"
SET "LISTA32BITS=https://buildbot.libretro.com/nightly/windows/x86/latest/"
SET "LISTA64BITS=https://buildbot.libretro.com/nightly/windows/x86_64/latest/"

cls
echo(
echo Creando carpetas temporales
if not exist %TEMPORALES% mkdir %TEMPORALES%
timeout 2 > NUL
echo Hecho!
echo Creando carpeta cores en RetroArch
if not exist %Actualiza_Cores% mkdir %Actualiza_Cores%
timeout 2 > NUL
echo Hecho!
echo.
echo  32bits o 64bits es tu windows? , deja que Retroshur lo adivine!...
	timeout 3 > NUL
if defined PROGRAMFILES(X86) (
    echo.
	echo shur, Estas usando Windows 64bits!
	timeout 2 > NUL
	echo Descargando Cores RetroArch para windows 64BITS
	timeout 2 > NUL
	%BAJAR% -r -l1 -H -t1 -nd -N -np -A.zip -erobots=off --reject "index.html*" %LISTA64bits% -P %TEMPORALES% -q --show-progress
) else (
    echo.
	echo shur, Estas usando Windows 32bits!
	timeout 2 > NUL
	echo Descargando Cores RetroArch para windows 32BITS
	timeout 2 > NUL
	%BAJAR% -r -l1 -H -t1 -nd -N -np -A.zip -erobots=off --reject "index.html*" %LISTA32bits% -P %TEMPORALES% -q --show-progress
)
echo.
echo Descarga Completada!
timeout 2 > NUL

:: abrir temporales,extraer,mover y borrar la carpeta
cd %TEMPORALES%
cls
echo.
echo copiando los Cores a RetroArch
%EXTRAER% x *.zip -o%Actualiza_Cores% -aoa

echo Borrando Archivos Temporales
timeout 2 > NUL

:: abriendo ubicacion de Retroshur y borrando algunos archivos temporales
CD /D %RETROSHUR%
@RD /S /Q %BORRAR_TEMPORALES%
cls
echo.
echo Re-Iniciando Emulationstation, Los Cores estan Actualizados a su Ultima Version!
for /f "tokens=2" %%x in ('tasklist ^| findstr emulationstation.exe') do SET PIDTOKILL=%%x
start "" "RETROSHUR-FULLSCREEN.cmd" /popup
taskkill /F /PID %PIDTOKILL% 
exit
