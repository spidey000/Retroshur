set HOME=%~dp0
set EMULATION="%~dp0"
::start /min /wait "FNR" SHUR-SCRIPT-FNR-NO-TOCAR.cmd
start /WAIT emulationstation.exe --no-splash --windowed --resolution 1280 720

exit