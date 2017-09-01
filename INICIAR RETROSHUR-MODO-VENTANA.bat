if not DEFINED IS_MINIMIZED SET IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
::::::::::::::::::idea/concepto tomado de musicrawx de reddit:::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::script Modificado/ajustado por AkiAfroo para Retroshur::::::::::::::::::::::::::::::::::
@Echo Off & Cls & Color 0E & Title Retroshur Emulationstation

:::::::::::::::::::RETROSHUR Emulationstation::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::definiendo algunos parametros:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SET HOME=%~dp0
SET SHUR="%HOME%\RETROSHUR-FRONTEND\Frontends\Emulationstation\"
SET FNR_APP="%HOME%\RETROSHUR-FRONTEND\Herramientas\FNR"

::::::::::::::::: INICIO-Ajustando la ruta de configuracion de retroshur:::::::::::::::::::::::::::::::::::
     %FNR_APP%\fnr.exe --cl --dir "%HOME%\" --fileMask "*.cfg, *.config, *.ini, *.yml, *.cmd" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]RETROSHUR-FRONTEND[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\\" --silent
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\demul*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]demul(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\dolphin*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]dolphin(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\pcsx2*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]pcsx2(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\ppsspp*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]ppsspp(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\retroarch*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]retroarch(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\cemu*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]retroarch(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\citra*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]retroarch(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\rpcs3*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]retroarch(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
FOR /f "tokens=*" %%D IN ('dir /b "%HOME%RETROSHUR-FRONTEND\Emuladores\xenia*"') Do (%FNR_APP%\fnr.exe --cl --dir "%HOME%RETROSHUR-FRONTEND\\Emuladores\\%%D" --fileMask "*.cfg, *.config, *.ini, *.yml" --includeSubDirectories --useRegEx --find "[abcdefghijklmnopqrstuvwxyz]:(.*?)[/\\]retroarch(.*?)[/\\]" --replace "%HOME%RETROSHUR-FRONTEND\Emuladores\%%D\\" --silent)
::::::::::::::::::FIN-Ajustando la ruta de configuracion de retroshur:::::::::::::::::::::::::::::::::::::::

::::::::::::::::::Lanzando RETROSHUR EMULATIONSTATION:::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd /D %SHUR%
CALL "RETROSHUR-MODO-VENTANA.bat" /min
::::::::::::::::::Saliendo de RETROSHUR EMULATIONSTATION::::::::::::::::::::::::::::::::::::::::::::::::::::
:exit
