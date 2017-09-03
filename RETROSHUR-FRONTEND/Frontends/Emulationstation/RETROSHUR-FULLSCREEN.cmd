@echo off
set HOME=%~dp0
set EMULATION=%~dp0..\..
start "" /min /WAIT "emulationstation.exe" --no-splash && goto END
:END
EXIT

