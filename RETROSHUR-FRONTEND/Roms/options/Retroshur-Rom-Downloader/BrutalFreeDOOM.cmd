:: script realizado por AkiAfroo para Retroshur
@echo off & Cls & Color 0E & Title Retroshur Rom Downloader: BrutalFreeDOOM (1.5 GB)
SET HOME="%~dp0"
SET "CARPETA=%~dp0..\..\..\Roms\"
SET "EXTRAER=%~dp0..\..\..\Herramientas\7-Zip\7z.exe"
SET "RETROSHUR=%~dp0..\..\..\Frontends\Emulationstation\"
SET "BAJAR=%~dp0..\..\..\Herramientas\MEGATOOLS\megadl.exe"
SET "TEMPORALES=%~dp0..\..\..\.temporales_retroshur_Rom_Downloader\Roms\"
set "LISTA=https://mega.nz/#!H4UUyDTY!dHHWp7TtuuICJpIcr_BfkUyft1ZJTMtMOZO9e2LYt4Y"
echo(
echo Creando carpetas temporales
if not exist %TEMPORALES% mkdir %TEMPORALES%
timeout 2 > NUL
echo Hecho!
echo Descargando Backup BrutalFreeDoom para Retroshur
timeout 2 > NUL
%BAJAR% --print-names %LISTA% --path %TEMPORALES%
cd %TEMPORALES%
%EXTRAER% x BrutalFreeDOOM.zip -o%CARPETA% -aoa 
cd %TEMPORALES%\..\..
rd /s /q .temporales_retroshur_Rom_Downloader
CD /D %RETROSHUR%

for /f "tokens=2" %%x in ('tasklist ^| findstr emulationstation.exe') do SET PIDTOKILL=%%x
start "" "RETROSHUR-FULLSCREEN.cmd" /popup
taskkill /F /PID %PIDTOKILL% 

)

exit


