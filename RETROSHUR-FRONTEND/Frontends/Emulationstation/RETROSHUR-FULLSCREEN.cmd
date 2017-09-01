@echo off
::if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
set HOME=%~dp0
set EMULATION=%~dp0..\..
::start /min /wait "FNR" SHUR-SCRIPT-FNR-NO-TOCAR.cmd
start "" /min /WAIT "emulationstation.exe" --no-splash && goto END
::tasklist | find /i "emulationstation" && taskkill /im emulationstation.exe /F || echo Re-iniciando Retroshur...
::tasklist | find /i "fnr" && taskkill /im fnr.exe /F || echo cerrando fnr...
::tasklist | find /i "cmd" && taskkill /im cmd.exe /F 
::taskkill /f /t /im cmd.exe
::taskkill /f /t /im emulationstation.exe
::taskkill /f /t /im fnr.exe
:END
EXIT

