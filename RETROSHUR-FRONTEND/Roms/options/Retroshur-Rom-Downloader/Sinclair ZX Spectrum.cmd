:: script realizado por AkiAfroo para Retroshur
@echo off & Cls & Color 0E & Title Retroshur Rom Downloader: Sinclair ZX Spectrum (545.3 MB)
SET HOME="%~dp0"
SET "CARPETA=%~dp0..\..\..\Roms\"
SET "EXTRAER=%~dp0..\..\..\Herramientas\7-Zip\7z.exe"
SET "RETROSHUR=%~dp0..\..\..\Frontends\Emulationstation\"
SET "BAJAR=%~dp0..\..\..\Herramientas\MEGATOOLS\megadl.exe"
SET "TEMPORALES=%~dp0..\..\..\.temporales_retroshur_Rom_Downloader\Roms\"
SET "LISTA=https://mega.nz/#!6tkXTJxb!UMm575cMtvUQTbcGZvUMh5UgXEZBMTWAticwwhEdJbA"
echo(
echo Creando carpetas temporales
if not exist %TEMPORALES% mkdir %TEMPORALES%
timeout 2 > NUL
echo Hecho!
echo Descargando Backup Sinclair ZX Spectrum para Retroshur
timeout 2 > NUL
%BAJAR% --print-names %LISTA% --path %TEMPORALES%
cd %TEMPORALES%
%EXTRAER% x zxspectrum.zip -o%CARPETA% -aoa 
cd %TEMPORALES%\..\..
rd /s /q .temporales_retroshur_Rom_Downloader
CD /D %RETROSHUR%

for /f "tokens=2" %%x in ('tasklist ^| findstr emulationstation.exe') do SET PIDTOKILL=%%x
start "" "RETROSHUR-FULLSCREEN.cmd" /popup
taskkill /F /PID %PIDTOKILL% 

)

exit


