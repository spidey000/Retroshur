:: script realizado AkiAfroo para Retroshur
@Echo Off & Cls & Color 0E & Title Retroshur: Instalador Retroarch
SET HOME="%~dp0"
SET "RetroAch=%~dp0..\..\Emuladores\RetroArch\"
SET "CONFIGURAR_MANDOS=%~dp0..\..\..\Herramientas\GAMEPAD\"
SET "RETROSHUR=%~dp0..\..\..\Frontends\Emulationstation\"
@Echo Off
CD /D %CONFIGURAR_MANDOS%
del vacio.cfg
del retroarch.cfg
if not exist %CONFIGURAR_MANDOS%fase2.cfg copy nul %CONFIGURAR_MANDOS%fase2.cfg
if not exist %CONFIGURAR_MANDOS%vacio.cfg copy nul %CONFIGURAR_MANDOS%vacio.cfg
::
echo.
echo hola! %username% , recuerda que estas usando un version Alpha.
echo #######################RETROSHUR-GAMEPAD-CONFIGURATOR################################
echo.
echo Mueva los controles de su mando y cuando este listo presione enter para configurarlos.
echo el programa configurara 25 botones de tu gamepad si tu gamepad tiene menos botones o no
echo quieres asignar todos los botones solo tienes que no presionar ningun boton durante 
echo 5 segundos y el programa automaticamente lo dejara en blanco y asi hasta que complete 
echo el ciclo. -Retroshur-
echo.
echo #######################RETROSHUR-GAMEPAD-CONFIGURATOR################################
echo.
echo iniciando configurador de mandos:
retroarch-joyconfig.exe -p 2 -i vacio.cfg > fase2.cfg -t 5
::::
findstr /v  /C:"input_player2_joypad_index" fase2.cfg > retroarchp2.cfg
copy player2.cfg.bak player2.cfg
timeout 2
copy player2.cfg player2.cfg.bak
echo.>>player2.cfg
type retroarchp2.cfg >>player2.cfg
move /y player2.cfg retroarch.cfg
echo se han configurado los mandos, copiando configuracion a Retroarch
call copia_mandos2.cmd

exit /b