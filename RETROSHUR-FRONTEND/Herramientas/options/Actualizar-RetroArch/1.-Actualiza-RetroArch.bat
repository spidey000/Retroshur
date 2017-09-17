:: script realizado AkiAfroo para Retroshur
@Echo Off & Cls & Color 0E & Title Retroshur: Instalador Retroarch
set HOME="%~dp0"
set "RetroAch=%~dp0..\..\..\Emuladores\RetroArch\"
SET "EXTRAER=%~dp0..\..\..\Herramientas\7-Zip\7z.exe"
set "BAJAR=%~dp0..\..\..\Herramientas\WGET\aria2c.exe"
SET "RETROSHUR=%~dp0..\..\..\Frontends\Emulationstation\"
SET "BORRAR_TEMPORALES=%~dp0..\..\..\.temporales_retroshur_Rom_Downloader\"
SET "TEMPORALES=%~dp0..\..\..\.temporales_retroshur_Rom_Downloader\RetroArch\"
set "LISTA32BITS=https://buildbot.libretro.com/nightly/windows/x86/RetroArch.7z"
set "LISTA64BITS=https://buildbot.libretro.com/nightly/windows/x86_64/RetroArch.7z"

cls
echo Haciendo Backup de retroarch.cfg
move %RetroAch%\retroarch.cfg %RetroAch%\retroarch.cfg.bak
echo(
echo Creando carpetas temporales donde se Descargara RetroArch
if not exist %TEMPORALES% mkdir %TEMPORALES%
timeout 2 > NUL
echo Hecho!
cd %TEMPORALES%
echo  32bits o 64bits es tu windows? , ni idea verdad!, deja que Retroshur lo adivine!...
	timeout 3 > NUL
if defined PROGRAMFILES(X86) (
    echo.
	echo shur, Estas usando Windows 64bits!
	timeout 2 > NUL
	echo Descargando RetroArch para windows 64BITS
	timeout 2 > NUL
	%BAJAR% %LISTA64BITS% -d %TEMPORALES%
) else (
    echo.
	echo shur, Estas usando Windows 32bits!
	timeout 2 > NUL
	echo Descargando RetroArch para windows 32BITS
	timeout 2 > NUL
	%BAJAR% %LISTA32BITS% -d %TEMPORALES%
)
if exist %TEMPORALES%\RetroArch.7z (
echo.
echo Descarga Completada!
timeout 2 > NUL
cls
echo.
echo Descomprimiendo RetroArch y copiando los archivos...
%EXTRAER% x RetroArch.7z -o%RetroAch% -aoa
move /y %RetroAch%\retroarch.cfg.bak %RetroAch%\retroarch.cfg
) else (
    echo El archivo RetroArch.7z esta incompleto.

)

:: Abrir carpeta de Retroshur y borrar RetroAch.7z
CD /D %RETROSHUR%
@RD /S /Q %BORRAR_TEMPORALES%
for /f "tokens=2" %%x in ('tasklist ^| findstr emulationstation.exe') do SET PIDTOKILL=%%x
start "" "RETROSHUR-FULLSCREEN.cmd" /popup
taskkill /F /PID %PIDTOKILL% 
exit
