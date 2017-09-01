if not DEFINED IS_MINIMIZED SET IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
::::::::::::::::::idea/concepto tomado de musicrawx de reddit:::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::script Modificado/ajustado por AkiAfroo para Retroshur::::::::::::::::::::::::::::::::::
@Echo Off & Cls & Color 0E & Title Retroshur Emulationstation

:::::::::::::::::::RETROSHUR Emulationstation::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: definiendo algunos parametros
SET HOME=%~dp0
SET SHUR="%HOME%\RETROSHUR-FRONTEND\Frontends\Emulationstation\"

::::::::::::::::::Lanzando RETROSHUR EMULATIONSTATION:::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd /D %SHUR%

call "RETROSHUR-FULLSCREEN.cmd" /min /wait && exit && GOTO END

::::::::::::::::::Saliendo de RETROSHUR EMULATIONSTATION::::::::::::::::::::::::::::::::::::::::::::::::::::
:END
exit
exit