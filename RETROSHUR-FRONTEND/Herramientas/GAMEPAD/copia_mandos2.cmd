set HOME="%~dp0"
copy %HOME%\retroarch.cfg %~dp0..\..\Emuladores\RetroArch\retroarch_player2_ready.cfg 
pushd %~dp0..\..\Emuladores\RetroArch\
findstr /v /C:"input_player2_" retroarch.cfg > retroarch_player2_esperando.cfg
echo.>>retroarch_player2_esperando.cfg
type retroarch_player2_ready.cfg >>retroarch_player2_esperando.cfg
move /y retroarch_player2_esperando.cfg retroarch.cfg

exit /b