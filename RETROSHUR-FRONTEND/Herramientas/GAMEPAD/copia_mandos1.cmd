set HOME="%~dp0"
SET "RetroAch=%~dp0..\..\Emuladores\RetroArch\"
copy  %HOME%\retroarch.cfg %~dp0..\..\Emuladores\RetroArch\retroarch_player1_ready.cfg 
pushd %~dp0..\..\Emuladores\RetroArch\
if not exist mandos_handheld.cfg copy nul mandos_handheld.cfg
findstr /v /C:"input_player1_" retroarch.cfg > retroarch_player1_esperando.cfg > nul 2>&1
xcopy /y retroarch_player1_ready.cfg mandos_handheld.cfg
echo.>>retroarch_player1_esperando.cfg
type retroarch_player1_ready.cfg >>retroarch_player1_esperando.cfg
move /y retroarch_player1_esperando.cfg retroarch.cfg
 
exit /b